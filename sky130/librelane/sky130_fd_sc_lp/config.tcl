set current_folder [file dirname [file normalize [info script]]]
# Technology lib

# TODO: there is no typical 
#set ::env(LIB_SYNTH) "$::env(PDK_ROOT)/$::env(PDK)/libs.ref/$::env(STD_CELL_LIBRARY)/lib/sky130_fd_sc_lp__ff_100C_1v95.lib"
#set ::env(LIB_SYNTH) "$::env(PDK_ROOT)/$::env(PDK)/libs.ref/$::env(STD_CELL_LIBRARY)/lib/sky130_fd_sc_lp__ff_125C_3v15.lib"
#set ::env(LIB_SYNTH) "$::env(PDK_ROOT)/$::env(PDK)/libs.ref/$::env(STD_CELL_LIBRARY)/lib/sky130_fd_sc_lp__ff_140C_1v95.lib"
#set ::env(LIB_SYNTH) "$::env(PDK_ROOT)/$::env(PDK)/libs.ref/$::env(STD_CELL_LIBRARY)/lib/sky130_fd_sc_lp__ff_150C_2v05.lib"
set ::env(LIB_SYNTH) "$::env(PDK_ROOT)/$::env(PDK)/libs.ref/$::env(STD_CELL_LIBRARY)/lib/sky130_fd_sc_lp__ff_n40C_1v56.lib"
#set ::env(LIB_SYNTH) "$::env(PDK_ROOT)/$::env(PDK)/libs.ref/$::env(STD_CELL_LIBRARY)/lib/sky130_fd_sc_lp__ff_n40C_1v76.lib"
#set ::env(LIB_SYNTH) "$::env(PDK_ROOT)/$::env(PDK)/libs.ref/$::env(STD_CELL_LIBRARY)/lib/sky130_fd_sc_lp__ff_n40C_1v95.lib"
#set ::env(LIB_SYNTH) "$::env(PDK_ROOT)/$::env(PDK)/libs.ref/$::env(STD_CELL_LIBRARY)/lib/sky130_fd_sc_lp__ff_n40C_2v05.lib"
#set ::env(LIB_SYNTH) "$::env(PDK_ROOT)/$::env(PDK)/libs.ref/$::env(STD_CELL_LIBRARY)/lib/sky130_fd_sc_lp__ss_100C_1v60.lib"
#set ::env(LIB_SYNTH) "$::env(PDK_ROOT)/$::env(PDK)/libs.ref/$::env(STD_CELL_LIBRARY)/lib/sky130_fd_sc_lp__ss_140C_1v65.lib"
#set ::env(LIB_SYNTH) "$::env(PDK_ROOT)/$::env(PDK)/libs.ref/$::env(STD_CELL_LIBRARY)/lib/sky130_fd_sc_lp__ss_150C_1v65.lib"
#set ::env(LIB_SYNTH) "$::env(PDK_ROOT)/$::env(PDK)/libs.ref/$::env(STD_CELL_LIBRARY)/lib/sky130_fd_sc_lp__ss_n40C_1v55.lib"
#set ::env(LIB_SYNTH) "$::env(PDK_ROOT)/$::env(PDK)/libs.ref/$::env(STD_CELL_LIBRARY)/lib/sky130_fd_sc_lp__ss_n40C_1v60.lib"
#set ::env(LIB_SYNTH) "$::env(PDK_ROOT)/$::env(PDK)/libs.ref/$::env(STD_CELL_LIBRARY)/lib/sky130_fd_sc_lp__ss_n40C_1v65.lib"

set ::env(LIB_FASTEST) "$::env(PDK_ROOT)/$::env(PDK)/libs.ref/$::env(STD_CELL_LIBRARY)/lib/sky130_fd_sc_lp__ff_n40C_2v05.lib"
set ::env(LIB_SLOWEST) "$::env(PDK_ROOT)/$::env(PDK)/libs.ref/$::env(STD_CELL_LIBRARY)/lib/sky130_fd_sc_lp__ss_100C_1v60.lib"

set ::env(LIB_TYPICAL) $::env(LIB_SYNTH)

# Corners
set ::env(STA_CORNERS) "\
    min_ff_100C_1v95 nom_ff_100C_1v95 max_ff_100C_1v95 \
    min_ff_125C_3v15 nom_ff_125C_3v15 max_ff_125C_3v15 \
    min_ff_140C_1v95 nom_ff_140C_1v95 max_ff_140C_1v95 \
    min_ff_150C_2v05 nom_ff_150C_2v05 max_ff_150C_2v05 \
    min_ff_n40C_1v56 nom_ff_n40C_1v56 max_ff_n40C_1v56 \
    min_ff_n40C_1v76 nom_ff_n40C_1v76 max_ff_n40C_1v76 \
    min_ff_n40C_1v95 nom_ff_n40C_1v95 max_ff_n40C_1v95 \
    min_ff_n40C_2v05 nom_ff_n40C_2v05 max_ff_n40C_2v05 \
    min_ss_100C_1v60 nom_ss_100C_1v60 max_ss_100C_1v60 \
    min_ss_140C_1v65 nom_ss_140C_1v65 max_ss_140C_1v65 \
    min_ss_150C_1v65 nom_ss_150C_1v65 max_ss_150C_1v65 \
    min_ss_n40C_1v55 nom_ss_n40C_1v55 max_ss_n40C_1v55 \
    min_ss_n40C_1v60 nom_ss_n40C_1v60 max_ss_n40C_1v60 \
    min_ss_n40C_1v65 nom_ss_n40C_1v65 max_ss_n40C_1v65 \
"

set ::env(DEFAULT_CORNER) "nom_ff_n40C_1v56"

# MUX4 mapping
set ::env(SYNTH_MUX4_MAP) "$::env(PDK_ROOT)/$::env(PDK)/libs.tech/librelane/$::env(STD_CELL_LIBRARY)/mux4_map.v"

# MUX2 mapping
set ::env(SYNTH_MUX_MAP) "$::env(PDK_ROOT)/$::env(PDK)/libs.tech/librelane/$::env(STD_CELL_LIBRARY)/mux2_map.v"

# Placement site for core cells
# This can be found in the technology lef
set ::env(PLACE_SITE) "unit"

# EXTRA_SITES ???

# welltap and endcap cells
set ::env(WELLTAP_CELL) "sky130_fd_sc_lp__tapvpwrvgnd_1"
set ::env(ENDCAP_CELL) "sky130_fd_sc_lp__decap_3"

# defaults (can be overridden by designs):
set ::env(SYNTH_DRIVING_CELL) "sky130_fd_sc_lp__inv_2/Y"
set ::env(SYNTH_CLK_DRIVING_CELL) "sky130_fd_sc_lp__clkinv_2/Y"
# capacitance : 0.0062400000; # sky130_fd_sc_lp__ff_100C_1v95.lib.part3
# capacitance : 0.0036200000; # sky130_fd_sc_lp__ff_125C_3v15.lib.part2
# capacitance : 0.0063000000; # sky130_fd_sc_lp__ff_140C_1v95.lib.part3
# capacitance : 0.0063800000; # sky130_fd_sc_lp__ff_150C_2v05.lib.part2
# capacitance : 0.0056400000; # sky130_fd_sc_lp__ff_n40C_1v56.lib.part3
# capacitance : 0.0058800000; # sky130_fd_sc_lp__ff_n40C_1v76.lib.part3
# capacitance : 0.0060100000; # sky130_fd_sc_lp__ff_n40C_1v95.lib.part3
# capacitance : 0.0060600000; # sky130_fd_sc_lp__ff_n40C_2v05.lib.part2
# capacitance : 0.0063600000; # sky130_fd_sc_lp__ss_100C_1v60.lib.part2
# capacitance : 0.0062800000; # sky130_fd_sc_lp__ss_140C_1v65.lib.part2
# capacitance : 0.0064900000; # sky130_fd_sc_lp__ss_150C_1v65.lib.part2
# capacitance : 0.0059500000; # sky130_fd_sc_lp__ss_n40C_1v55.lib.part2
# capacitance : 0.0060000000; # sky130_fd_sc_lp__ss_n40C_1v60.lib.part2
# capacitance : 0.0059900000; # sky130_fd_sc_lp__ss_n40C_1v65.lib.part2

# update these
#set ::env(OUTPUT_CAP_LOAD) "50.400" ; # femtofarad __inv_16 pin A cap (sky130_fd_sc_lp__ff_100C_1v95.lib.part3)
#set ::env(OUTPUT_CAP_LOAD) "53.570" ; # femtofarad __inv_16 pin A cap (sky130_fd_sc_lp__ff_125C_3v15.lib.part2)
#set ::env(OUTPUT_CAP_LOAD) "50.810" ; # femtofarad __inv_16 pin A cap (sky130_fd_sc_lp__ff_140C_1v95.lib.part3)
#set ::env(OUTPUT_CAP_LOAD) "51.190" ; # femtofarad __inv_16 pin A cap (sky130_fd_sc_lp__ff_150C_2v05.lib.part2)
set ::env(OUTPUT_CAP_LOAD) "44.660" ; # femtofarad __inv_16 pin A cap (sky130_fd_sc_lp__ff_n40C_1v56.lib.part3)
#set ::env(OUTPUT_CAP_LOAD) "47.200" ; # femtofarad __inv_16 pin A cap (sky130_fd_sc_lp__ff_n40C_1v76.lib.part3)
#set ::env(OUTPUT_CAP_LOAD) "48.400" ; # femtofarad __inv_16 pin A cap (sky130_fd_sc_lp__ff_n40C_1v95.lib.part3)
#set ::env(OUTPUT_CAP_LOAD) "48.920" ; # femtofarad __inv_16 pin A cap (sky130_fd_sc_lp__ff_n40C_2v05.lib.part2)
#set ::env(OUTPUT_CAP_LOAD) "51.720" ; # femtofarad __inv_16 pin A cap (sky130_fd_sc_lp__ss_100C_1v60.lib.part2)
#set ::env(OUTPUT_CAP_LOAD) "52.850" ; # femtofarad __inv_16 pin A cap (sky130_fd_sc_lp__ss_140C_1v65.lib.part2)
#set ::env(OUTPUT_CAP_LOAD) "53.990" ; # femtofarad __inv_16 pin A cap (sky130_fd_sc_lp__ss_150C_1v65.lib.part2)
#set ::env(OUTPUT_CAP_LOAD) "47.270" ; # femtofarad __inv_16 pin A cap (sky130_fd_sc_lp__ss_n40C_1v55.lib.part2)
#set ::env(OUTPUT_CAP_LOAD) "48.370" ; # femtofarad __inv_16 pin A cap (sky130_fd_sc_lp__ss_n40C_1v60.lib.part2)
#set ::env(OUTPUT_CAP_LOAD) "48.780" ; # femtofarad __inv_16 pin A cap (sky130_fd_sc_lp__ss_n40C_1v65.lib.part2)

set ::env(SYNTH_BUFFER_CELL) "sky130_fd_sc_lp__buf_2/A/X"
# TODO: should be conb_0?
set ::env(SYNTH_TIEHI_CELL) "sky130_fd_sc_lp__conb_1/HI"
set ::env(SYNTH_TIELO_CELL) "sky130_fd_sc_lp__conb_1/LO"

# cts defaults
set ::env(CTS_ROOT_BUFFER) sky130_fd_sc_lp__clkbuf_16

# placement defaults
set ::env(PL_LIB) $::env(LIB_TYPICAL)

# fill/decap cell insertion
set ::env(FILL_CELLS) "sky130_fd_sc_lp__fill*"
set ::env(DECAP_CELLS) "sky130_fd_sc_lp__decap*"

# diode insertion
set ::env(DIODE_CELL) "sky130_fd_sc_lp__diode_1/DIODE"; #  sky130_fd_sc_lp__diode_0

set ::env(GPL_CELL_PADDING) {0}
set ::env(DPL_CELL_PADDING) {0}
set ::env(CELL_PAD_EXCLUDE) "sky130_fd_sc_lp__tap* sky130_fd_sc_lp__decap* sky130_fd_sc_lp__fill*"

# Clk Buffers info CTS data
set ::env(CTS_CLK_BUFFERS) "sky130_fd_sc_lp__clkbuf_8 sky130_fd_sc_lp__clkbuf_4 sky130_fd_sc_lp__clkbuf_2"
set ::env(PDN_RAIL_WIDTH) 0.48
set ::env(MAX_TRANSITION_CONSTRAINT) 0.75
set ::env(MAX_FANOUT_CONSTRAINT) 10
set ::env(MAX_CAPACITANCE_CONSTRAINT) 0.2

set ::env(TRISTATE_CELLS) "sky130_fd_sc_lp__ebuf*"
