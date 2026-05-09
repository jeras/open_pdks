# PDK and SCL (Standard Cell Library) configuration files for LibreLane 3+

The following methods specify how library cells are used:
1. the `config.tcl` file specifies variables containing
   single cells (some with port names) and cell lists (can use wildcard),
2. `*_map.v` files specify technology mapping of cells to Yosys primitives,
3. `no_synth.cells` file contains a list of cells not to be used during synthesis,
4. `drc_exclude.cells` file contains a list of cells to be excluded during DRC checking.

## TCL variable configuration `config.tcl` for PDK and SCLs

Synthesis:
- `SYNTH_DRIVING_CELL`,
- `SYNTH_CLK_DRIVING_CELL`,
- `SYNTH_BUFFER_CELL`,
- `SYNTH_TIEHI_CELL`, `SYNTH_TIELO_CELL`.

CTC (Clock Tree Synthesis):
- `CTS_ROOT_BUFFER`,
- `CTS_CLK_BUFFERS`.

tap/decap/fill/antenna:
- `WELLTAP_CELL`,
- `ENDCAP_CELL`,
- `FILL_CELLS`,
- `DECAP_CELLS`,
- `DIODE_CELL`.

Adder mapping:
- `SYNTH_FA_MAP`.

Tristate buffer mapping:
- `TRISTATE_CELLS`:
  - `ebuf*` - _tri-state buffer_,
  - `einv*` - _tri-state inverter_.

Clock gating:
- `SYNTH_CLOCKGATE_POSEDGE_ICG`,
- `SYNTH_CLOCKGATE_NEGEDGE_ICG`.

???:
- CELL_PAD_EXCLUDE

## Yosys technology mapping `*_map.v`

- `SYNTH_LATCH_MAP`,
- `SYNTH_TRISTATE_MAP`,
- `SYNTH_CSA_MAP`,
- `SYNTH_RCA_MAP`,
- `SYNTH_FA_MAP`,
- `SYNTH_MUX_MAP`,
- `SYNTH_MUX4_MAP`.

## Synthesis exclude list `no_synth.cells`

The `no_synth.cells` lists cells that should not
be used by the RTL synthesis tool for various reasons
roughly divided into groups:
- cells used in post synthesis stages:
  - CTS (Clock Tree Synthesis),
  - delay insertion (to meet I/O) timing,
  - DFT (Design For Test),
  - diode insertion,
  - fill insertion,
  - tap/decap insertion,
- cells causing issues with the current toolchain (LibreLane)
- cells explicitly used by the RTL synthesis tool:
  - technology mapping for adders, latches and multiplexers
  - clock gating
- TODO:
  - cells on the edges of power domains,
    power gating, is this what SLEEP cells are for?
  - cells used to implement timing circuits like
    digital PLL, FLL (Frequency Locked Loop), CDR (Clock Data Recovery)

### sky130

According to information from old forum posts
`*_1` cells were excluded due to connectivity issues.
The posts are also looking forward to when OpenROAD
would fix those issues.

Cells are excluded from synthesis:
- `clk*` clock tree related cells:
  - `clkbuf` _clock tree buffer_
  - `clkinv` _clock tree inverter_
  - `clkinvlp` _low power clock tree inverter_
  - `clkdlybuf` _clock delay buffer_
- `s*` scan related cells:
  - `sdf*` _scan delay flop_
  - `srsdf*` _scan flop with sleep mode_
  - `sdlclk*` _scan gated clock_
  - `srdl` ??? _delay latch with sleep mode_
  - `sreg` ??? _scan register_
- `sleep` ???
  - `sleep_pargate` ??? _sleep parallel gate_
  - `sleep_sergate` ??? _sleep serial gate_
- `*decap*` decap related cells:
  - `decap` - _decoupling capacitance filler_
  - `decapkapwr` - _decoupling capacitance filler on keep-alive rail_
  - `decaphe` - _hielded Decoupling capacitance filler_
  - `decaphetap` ???
- `dlclk*` - _clock gate_ (Delay Latch ICG (Integrated Clock Gate))
- `dl*` _delay latch_ TODO
- `dlgate*` - _delay buffer_
- `dlmetal*` - _N-inverter delay with output from M-nd stage on horizontal route_

- `einv*` - _tri-state inverter_
- `ha` - _half adder_

- `inputiso*` - _input isolator_

- `macro_sparecell` - _macro cell for metal-mask-only revisioning, containing inverter, 2-input NOR, 2-input NAND, and constant cell_

- `probe_p` - Virtual voltage probe point.
- `probec_p` - Virtual current probe point.


- `maj3` - _3-input majority vote_
- `mux2i` - _2-input multiplexer, output inverted_

Cells not excluded from synthesis:
- `tap*`

## DRC (Design Rule Check) exclusions
