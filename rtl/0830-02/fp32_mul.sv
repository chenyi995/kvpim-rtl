// FP32 multiplier (FTZ), built from 6x6 multipliers so each PE-macro stage
// meets the 0.699 ns clock.  Latency is elastic through out_valid.
module fp32_mul (
 input logic clk,rst_n,in_valid, input logic [31:0] a,b,
 output logic [31:0] y, output logic out_valid
);
 logic sa,sb; logic [7:0] ea,eb; logic [22:0] ma,mb;
 logic az,bz,ai,bi,an,bn; logic [23:0] aa,bb;
 assign sa=a[31];assign ea=a[30:23];assign ma=a[22:0];assign sb=b[31];assign eb=b[30:23];assign mb=b[22:0];
 assign az=(ea==0)&&(ma==0);assign bz=(eb==0)&&(mb==0);assign ai=(ea==8'hff)&&(ma==0);assign bi=(eb==8'hff)&&(mb==0);
 assign an=(ea==8'hff)&&(ma!=0);assign bn=(eb==8'hff)&&(mb!=0);
 assign aa=(ea==0)?0:{1'b1,ma};assign bb=(eb==0)?0:{1'b1,mb};

 // Stage 0: sixteen 6x6 products, forming a 4x4 limb product matrix.
 logic [11:0] q00,q01,q02,q03,q10,q11,q12,q13,q20,q21,q22,q23,q30,q31,q32,q33;
 assign q00=aa[5:0]*bb[5:0]; assign q01=aa[5:0]*bb[11:6]; assign q02=aa[5:0]*bb[17:12]; assign q03=aa[5:0]*bb[23:18];
 assign q10=aa[11:6]*bb[5:0];assign q11=aa[11:6]*bb[11:6];assign q12=aa[11:6]*bb[17:12];assign q13=aa[11:6]*bb[23:18];
 assign q20=aa[17:12]*bb[5:0];assign q21=aa[17:12]*bb[11:6];assign q22=aa[17:12]*bb[17:12];assign q23=aa[17:12]*bb[23:18];
 assign q30=aa[23:18]*bb[5:0];assign q31=aa[23:18]*bb[11:6];assign q32=aa[23:18]*bb[17:12];assign q33=aa[23:18]*bb[23:18];
 logic v1,sg1,z1,i1,n1,iv1; logic signed [10:0] ex1;
 logic [11:0] r00,r01,r02,r03,r10,r11,r12,r13,r20,r21,r22,r23,r30,r31,r32,r33;

 // Stage 1: four 13-bit cross sums for the four 12x12 quadrants.
 logic [12:0] x0,x1,x2,x3;
 assign x0={1'b0,r01}+{1'b0,r10}; assign x1={1'b0,r03}+{1'b0,r12};
 assign x2={1'b0,r21}+{1'b0,r30}; assign x3={1'b0,r23}+{1'b0,r32};
 logic v2,sg2,z2,i2,n2,iv2; logic signed [10:0] ex2;
 logic [11:0] t00,t11,t02,t13,t20,t31,t22,t33; logic [12:0] cx0,cx1,cx2,cx3;

 // Stage 2: reconstruct four 12x12 products from the 6x6 terms.
 logic [12:0] lo0,lo1,lo2,lo3,hi0,hi1,hi2,hi3; logic [23:0] pl,pr,pb,pt;
 assign lo0={1'b0,t00}+{cx0[5:0],6'b0}; assign hi0={1'b0,t11}+cx0[12:6]+lo0[12]; assign pl={hi0[11:0],lo0[11:0]};
 assign lo1={1'b0,t02}+{cx1[5:0],6'b0}; assign hi1={1'b0,t13}+cx1[12:6]+lo1[12]; assign pr={hi1[11:0],lo1[11:0]};
 assign lo2={1'b0,t20}+{cx2[5:0],6'b0}; assign hi2={1'b0,t31}+cx2[12:6]+lo2[12]; assign pb={hi2[11:0],lo2[11:0]};
 assign lo3={1'b0,t22}+{cx3[5:0],6'b0}; assign hi3={1'b0,t33}+cx3[12:6]+lo3[12]; assign pt={hi3[11:0],lo3[11:0]};
 logic v3,sg3,z3,i3,n3,iv3; logic signed [10:0] ex3; logic [23:0] mll,mlh,mhl,mhh;

 // Stage 3 and 4: 24-bit quadrant cross sum, then the final product.
 logic [24:0] mid; assign mid={1'b0,mlh}+{1'b0,mhl};
 logic v4,sg4,z4,i4,n4,iv4; logic signed [10:0] ex4; logic [23:0] ll,hh; logic [24:0] cmid;
 logic [24:0] low48,high48; assign low48={1'b0,ll}+{cmid[11:0],12'b0};
 assign high48={1'b0,hh}+cmid[24:12]+low48[24];
 logic v5,sg5,z5,i5,n5,iv5; logic signed [10:0] ex5; logic [47:0] prod;

 // Stage 5: normalize/round/pack, followed by the registered interface.
 logic top,g,r,st,ru; logic [22:0] mn; logic [23:0] mr; logic signed [10:0] en,er; logic [31:0] yc;
 assign top=prod[47];assign mn=top?prod[46:24]:prod[45:23];assign g=top?prod[23]:prod[22];assign r=top?prod[22]:prod[21];assign st=top? |prod[21:0]: |prod[20:0];assign ru=g&(r|st|mn[0]);
 always_comb begin
   mr={1'b0,mn}+ru; en=top?(ex5+11'sd1):ex5; er=en;
   if(mr[23]) begin mr=24'h800000;er=en+11'sd1;end
   if(n5||iv5) yc={1'b0,8'hff,23'h400000};
   else if(i5) yc={sg5,8'hff,23'd0};
   else if(z5||(er<=0)) yc={sg5,31'd0};
   else if(er>=11'sd255) yc={sg5,8'hff,23'd0};
   else yc={sg5,er[7:0],mr[22:0]};
 end
 always_ff @(posedge clk or negedge rst_n) begin
  if(!rst_n) begin
   v1<=0;sg1<=0;z1<=0;i1<=0;n1<=0;iv1<=0;ex1<=0;r00<=0;r01<=0;r02<=0;r03<=0;r10<=0;r11<=0;r12<=0;r13<=0;r20<=0;r21<=0;r22<=0;r23<=0;r30<=0;r31<=0;r32<=0;r33<=0;
   v2<=0;sg2<=0;z2<=0;i2<=0;n2<=0;iv2<=0;ex2<=0;t00<=0;t11<=0;t02<=0;t13<=0;t20<=0;t31<=0;t22<=0;t33<=0;cx0<=0;cx1<=0;cx2<=0;cx3<=0;
   v3<=0;sg3<=0;z3<=0;i3<=0;n3<=0;iv3<=0;ex3<=0;mll<=0;mlh<=0;mhl<=0;mhh<=0;
   v4<=0;sg4<=0;z4<=0;i4<=0;n4<=0;iv4<=0;ex4<=0;ll<=0;hh<=0;cmid<=0;
   v5<=0;sg5<=0;z5<=0;i5<=0;n5<=0;iv5<=0;ex5<=0;prod<=0;y<=0;out_valid<=0;
  end else begin
   v1<=in_valid;sg1<=sa^sb;z1<=az||bz;i1<=ai||bi;n1<=an||bn;iv1<=(ai&&bz)||(az&&bi);ex1<=$signed({1'b0,ea})+$signed({1'b0,eb})-11'sd127;
   r00<=q00;r01<=q01;r02<=q02;r03<=q03;r10<=q10;r11<=q11;r12<=q12;r13<=q13;r20<=q20;r21<=q21;r22<=q22;r23<=q23;r30<=q30;r31<=q31;r32<=q32;r33<=q33;
   v2<=v1;sg2<=sg1;z2<=z1;i2<=i1;n2<=n1;iv2<=iv1;ex2<=ex1;t00<=r00;t11<=r11;t02<=r02;t13<=r13;t20<=r20;t31<=r31;t22<=r22;t33<=r33;cx0<=x0;cx1<=x1;cx2<=x2;cx3<=x3;
   v3<=v2;sg3<=sg2;z3<=z2;i3<=i2;n3<=n2;iv3<=iv2;ex3<=ex2;mll<=pl;mlh<=pr;mhl<=pb;mhh<=pt;
   v4<=v3;sg4<=sg3;z4<=z3;i4<=i3;n4<=n3;iv4<=iv3;ex4<=ex3;ll<=mll;hh<=mhh;cmid<=mid;
   v5<=v4;sg5<=sg4;z5<=z4;i5<=i4;n5<=n4;iv5<=iv4;ex5<=ex4;prod<={high48[23:0],low48[23:0]};
   y<=yc;out_valid<=v5;
  end
 end
endmodule
