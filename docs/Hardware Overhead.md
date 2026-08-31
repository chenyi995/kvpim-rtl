我目前需要分为AttAcc、Fugue（有RoPE和无RoPE单元）三类综合出硬件overhead

从bank-level、BG-level、Logic Die Level、HBM Controller这四个层面评估hardware

以下是对每个层面的硬件结构：
Bank-Level：2个GEMV Units，每个GEMV Unit：“Each GEMV unit consists of 16 FP16 multipliers, 16 FP16 adders, doublebuffered 16 256-bit buffers that can store the input vectors, and a control unit.” (Park 等, 2024, p. 109) 。16个Adder可以在Adder Tree模式和16个Adder并行Accumulate模式切换。

2个GEMV Buffer(Double Buffering)：每个Buffer可以存下16*16bit Q(每次存16 dhead) 

对于AttAcc，GEMV的综合频率为666MHz；对于Fugue，GEMV综合频率为1.3GHz（不应该改变GEMV Unit的RTL，只改变dc频率约束）



BG-level: 1个Accumulator，可以选择bypass模式和求和模式：输入4个FP16数，输出它们的和1个FP16

对于AttAcc，Accumulator的综合频率为666MHz；对于Fugue，Accumulator综合频率为1.3GHz

1个Accumulator Buffer：存储8个FP16数



Logic-Level：

16个Accumulator，对于每个Accumulator，可以选择bypass模式和求和模式：每cycle输入1个(16×FP16数)，一共输入4个数后输出和16×FP16

对于AttAcc，Accumulator的综合频率为666MHz；对于Fugue，Accumulator综合频率为666MHzGHz



Softmax Unit（由256个Softmax Unit构成），应该已经以1.3GHz综合出来，可以检查综合结果正确性



RoPE：只有Fugue(有RoPE版)需要有，RTL不用修改，666MHz综合





HBM Controller：

对于AttAcc Unit 1个Controller：功能实现参考attacc的源代码(来自最早的仓库)

参考论文原文：AttAccController:TheAttAcccontrollerconsistsofan I/Omodule,adirectmemoryaccess(DMA)engine,anin structionqueueanddecoder,configmemory,andmultiple HBMcontrollers(seeFigure9(a)).AttAccreceivesinstruc tionsfortheattentionlayer(henceforthAtt_inst),where eachhasaone-to-onecorrespondingAttAccAPIfunction. Att_instsaredecodedtotriggeri)operationsforanattention layerthroughHBMcontrollers, ii)datatransfersbetween theAttAccandxPUs,oriii)modifytheconfigmemory.The HBMcontroller,oneperHBM,generatesDRAMorPIM commandsforeachchannelandperformsscore,softmax, andcontextoperationsforeachrequest.Thedatatransferis supportedbytheDMAengine.Configmemorystores𝑁ℎ𝑒𝑎𝑑, 𝑑ℎ𝑒𝑎𝑑,maximum𝐿,informationaboutKVmatrixmapping (row-wiseorcolumn-wise)ateachmemorynodelevel,batch size,and𝐿ofeachrequestwithinthebatch. PIMcommandsissuedtotheHBMincludetheonesfor metadatasetupanddatamovement.PIM_SET_CONFIGwrites thepartitioninginformationoftheKVmatricestotheGEMV units.PIM_ACT_ABperformsrowactivationofthesamead dressinallbanks,similartopriorworks[36,37].PIM_MAC_AB executesthemultiply-accumulate(MAC)operationsinall bankswhilereadingnecessarydatafromDRAMcellsand GEMVbuffers.PIM_SFMexecutesthesoftmaxoperationin cludingthecomputationssuchasfindingmaximum, sub traction,andexponential.PIM_WR_GBwritesdatatoaGEMV buffer.PIM_MV_GBmovestheoutputdatafromtheGEMV unittothesoftmaxbuffer.Similarly,PIM_MV_SBmovesthe resultfromthesoftmaxunittotheGEMVbuffer.PIM_RD_SB readsthefinalresultsofacontextoperationfromasoftmax buffer.AllPIMcommandsareimplementedasRFU(reserved forfutureuse)commands.Theyareissuedthroughastan dardHBMcommandpath,similartoDRAMcommands.



对于Fugue：1个Controller还要包含TLB的功能：TLB的功能实现参考attacc_drampim的simulator，666MHz综合  用于diff块的地址管理



首先，修改我的RTL，确认哪些代码是正确的（目前的rtl可能为了满足时序要求而变得很复杂，需要你结合对应的syn结果看看是否时序成立，如果功能正确且时序约束满足，则无需再综合，应该在最后的markdown里指出），哪些是无效的（可能需要删除/重写），严格按照我的定义；

Controller部分由你根据代码和论文发挥。

新的代码存在0830-02文件夹

其次，根据之前的dc脚本，写一个针对新RTL的dc脚本：要求：不需要自顶综合，综合出每个组件的面积即可。

最后，再写一个markdown，说明每个层级如何通过小组件的面积，计算出每个层级的总硬件overhead。

