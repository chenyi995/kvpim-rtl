# TSMC N28 MMMC template for Cadence Innovus/Encounter.
# Defaults target the CLN28HPC+ 1P10M_5X2Y2R + UT-AlRDL stack and the
# installed BWP30P140 base/HVT/LVT standard-cell libraries.

if {![info exists constraint_mode_name]} {
    set constraint_mode_name my_constraint_mode
}

if {![info exists tsmcn28_ref_root]} {
    set tsmcn28_ref_root "/data2/tools-additional/pdk/N28/cadence_ref"
}

if {![info exists tsmcn28_stdcell_root]} {
    set tsmcn28_stdcell_root "/data2/tools-additional/pdk/N28/installed/standard_cell/TSMCHOME"
}

if {![info exists tsmcn28_route_style]} {
    set tsmcn28_route_style "HVH"
}

set tsmcn28_tech_lef [file join $tsmcn28_ref_root apr_tlef $tsmcn28_route_style tsmcn28_10lm5X2Y2RRDL.tlef]

set tsmcn28_ss_libs [list \
    [file join $tsmcn28_stdcell_root digital Front_End timing_power_noise NLDM tcbn28hpcplusbwp30p140_180a tcbn28hpcplusbwp30p140ssg0p72v125c.lib] \
    [file join $tsmcn28_stdcell_root digital Front_End timing_power_noise NLDM tcbn28hpcplusbwp30p140hvt_180a tcbn28hpcplusbwp30p140hvtssg0p72v125c.lib] \
    [file join $tsmcn28_stdcell_root digital Front_End timing_power_noise NLDM tcbn28hpcplusbwp30p140lvt_180a tcbn28hpcplusbwp30p140lvtssg0p72v125c.lib] \
]

set tsmcn28_ff_libs [list \
    [file join $tsmcn28_stdcell_root digital Front_End timing_power_noise NLDM tcbn28hpcplusbwp30p140_180a tcbn28hpcplusbwp30p140ffg0p88vm40c.lib] \
    [file join $tsmcn28_stdcell_root digital Front_End timing_power_noise NLDM tcbn28hpcplusbwp30p140hvt_180a tcbn28hpcplusbwp30p140hvtffg0p88vm40c.lib] \
    [file join $tsmcn28_stdcell_root digital Front_End timing_power_noise NLDM tcbn28hpcplusbwp30p140lvt_180a tcbn28hpcplusbwp30p140lvtffg0p88vm40c.lib] \
]

set tsmcn28_tt_libs [list \
    [file join $tsmcn28_stdcell_root digital Front_End timing_power_noise NLDM tcbn28hpcplusbwp30p140_180a tcbn28hpcplusbwp30p140tt0p8v25c.lib] \
    [file join $tsmcn28_stdcell_root digital Front_End timing_power_noise NLDM tcbn28hpcplusbwp30p140hvt_180a tcbn28hpcplusbwp30p140hvttt0p8v25c.lib] \
    [file join $tsmcn28_stdcell_root digital Front_End timing_power_noise NLDM tcbn28hpcplusbwp30p140lvt_180a tcbn28hpcplusbwp30p140lvttt0p8v25c.lib] \
]

set tsmcn28_setup_qrc [file join $tsmcn28_ref_root qrc cln28hpcplus_1p10m_5x2y2r rcworst qrcTechFile]
set tsmcn28_hold_qrc  [file join $tsmcn28_ref_root qrc cln28hpcplus_1p10m_5x2y2r rcbest qrcTechFile]
set tsmcn28_tt_qrc    [file join $tsmcn28_ref_root qrc cln28hpcplus_1p10m_5x2y2r typical qrcTechFile]

set tsmcn28_lefs [list \
    $tsmcn28_tech_lef \
    [file join $tsmcn28_stdcell_root digital Back_End lef tcbn28hpcplusbwp30p140_110a lef tcbn28hpcplusbwp30p140.lef] \
    [file join $tsmcn28_stdcell_root digital Back_End lef tcbn28hpcplusbwp30p140hvt_110a lef tcbn28hpcplusbwp30p140hvt.lef] \
    [file join $tsmcn28_stdcell_root digital Back_End lef tcbn28hpcplusbwp30p140lvt_110a lef tcbn28hpcplusbwp30p140lvt.lef] \
]

foreach required_file [concat $tsmcn28_ss_libs $tsmcn28_ff_libs $tsmcn28_tt_libs $tsmcn28_lefs [list $tsmcn28_setup_qrc $tsmcn28_hold_qrc $tsmcn28_tt_qrc]] {
    if {![file exists $required_file]} {
        error "Missing MMMC input file: $required_file"
    }
}

create_library_set -name SS.setup_set -timing $tsmcn28_ss_libs
create_timing_condition -name SS.setup_cond -library_sets [list SS.setup_set]
create_rc_corner -name SS.setup_rc -temperature 125.0 -qrc_tech $tsmcn28_setup_qrc
create_delay_corner -name SS.setup_delay -timing_condition SS.setup_cond -rc_corner SS.setup_rc
create_analysis_view -name SS.setup_view -delay_corner SS.setup_delay -constraint_mode $constraint_mode_name

create_library_set -name FF.hold_set -timing $tsmcn28_ff_libs
create_timing_condition -name FF.hold_cond -library_sets [list FF.hold_set]
create_rc_corner -name FF.hold_rc -temperature -40.0 -qrc_tech $tsmcn28_hold_qrc
create_delay_corner -name FF.hold_delay -timing_condition FF.hold_cond -rc_corner FF.hold_rc
create_analysis_view -name FF.hold_view -delay_corner FF.hold_delay -constraint_mode $constraint_mode_name

create_library_set -name TT.extra_set -timing $tsmcn28_tt_libs
create_timing_condition -name TT.extra_cond -library_sets [list TT.extra_set]
create_rc_corner -name TT.extra_rc -temperature 25.0 -qrc_tech $tsmcn28_tt_qrc
create_delay_corner -name TT.extra_delay -timing_condition TT.extra_cond -rc_corner TT.extra_rc
create_analysis_view -name TT.extra_view -delay_corner TT.extra_delay -constraint_mode $constraint_mode_name

set_analysis_view -setup {SS.setup_view} -hold {FF.hold_view TT.extra_view}

# Append generated SRAM LEFs to this list if your design instantiates memories.
read_physical -lef $tsmcn28_lefs