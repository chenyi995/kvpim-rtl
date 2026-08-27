## ASAP7 MMMC for Genus synthesis — TT 0.7 V 25 C, all VT flavors.
## Self-contained: reads the extracted NLDM .libs from the shared PDK install.
## ASAP7 liberty units: time = 1ps, cap = 1fF (SDC values are therefore in ps).
## Single TT view for both setup and hold: this flow feeds an area/power/energy
## frequency sweep where the TT numbers are the quantity of interest, not a
## signoff PVT bracket.

if {![info exists constraint_mode_name]} {
    set constraint_mode_name my_constraint_mode
}

set asap7_nldm "/data2/tools-additional/pdk/asap7/asap7sc7p5t_27/LIB/NLDM"

set asap7_tt_libs [list]
foreach grp {AO OA INVBUF SEQ SIMPLE} {
    foreach vt {RVT LVT SLVT} {
        lappend asap7_tt_libs [file join $asap7_nldm "asap7sc7p5t_${grp}_${vt}_TT_nldm_201020.lib"]
    }
}
foreach f $asap7_tt_libs {
    if {![file exists $f]} { error "Missing ASAP7 .lib: $f" }
}

create_library_set -name TT.setup_set -timing $asap7_tt_libs
create_timing_condition -name TT.setup_cond -library_sets [list TT.setup_set]
create_rc_corner -name TT.setup_rc -temperature 25.0
create_delay_corner -name TT.setup_delay -timing_condition TT.setup_cond -rc_corner TT.setup_rc
create_analysis_view -name TT.setup_view -delay_corner TT.setup_delay -constraint_mode $constraint_mode_name

create_library_set -name TT.hold_set -timing $asap7_tt_libs
create_timing_condition -name TT.hold_cond -library_sets [list TT.hold_set]
create_rc_corner -name TT.hold_rc -temperature 25.0
create_delay_corner -name TT.hold_delay -timing_condition TT.hold_cond -rc_corner TT.hold_rc
create_analysis_view -name TT.hold_view -delay_corner TT.hold_delay -constraint_mode $constraint_mode_name

set_analysis_view -setup {TT.setup_view} -hold {TT.hold_view}
