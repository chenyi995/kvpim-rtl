# Compile the selected ASAP7 SRAM Liberty view to Synopsys DB for DC.
set script_dir [file dirname [file normalize [info script]]]
set sram_dir [file normalize [file join $script_dir .. third_party asap7 asap7_sram_0p0 generated]]
set out_dir [file join $sram_dir db]
file mkdir $out_dir
foreach name {srambank_256x4x64_6t122 srambank_64x4x16_6t122} {
    read_lib [file join $sram_dir LIB ${name}.lib]
    write_lib $name -format db -output [file join $out_dir ${name}.db]
}
quit
