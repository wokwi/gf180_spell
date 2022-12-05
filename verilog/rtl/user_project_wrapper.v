// SPDX-FileCopyrightText: 2020 Efabless Corporation
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// SPDX-License-Identifier: Apache-2.0

`default_nettype none
/*
 *-------------------------------------------------------------
 *
 * user_project_wrapper
 *
 * This wrapper enumerates all of the pins available to the
 * user for the user project.
 *
 * An example user project is provided in this wrapper.  The
 * example should be removed and replaced with the actual
 * user project.
 *
 *-------------------------------------------------------------
 */

module user_project_wrapper #(
    parameter BITS = 32
)(
`ifdef USE_POWER_PINS
    inout vdd,		// User area 5.0V supply
    inout vss,		// User area ground
`endif

    // Wishbone Slave ports (WB MI A)
    input wb_clk_i,
    input wb_rst_i,
    input wbs_stb_i,
    input wbs_cyc_i,
    input wbs_we_i,
    input [3:0] wbs_sel_i,
    input [31:0] wbs_dat_i,
    input [31:0] wbs_adr_i,
    output wbs_ack_o,
    output [31:0] wbs_dat_o,

    // Logic Analyzer Signals
    input  [63:0] la_data_in,
    output [63:0] la_data_out,
    input  [63:0] la_oenb,

    // IOs
    input  [`MPRJ_IO_PADS-1:0] io_in,
    output [`MPRJ_IO_PADS-1:0] io_out,
    output [`MPRJ_IO_PADS-1:0] io_oeb,

    // Independent clock (on independent integer divider)
    input   user_clock2,

    // User maskable interrupt signals
    output [2:0] user_irq
);

/*--------------------------------------*/
/* User project is instantiated  here   */
/*--------------------------------------*/

spell spell(
`ifdef USE_POWER_PINS
	.vdd(vdd),	// User area 1 5V power
	.vss(vss),	// User area 1 digital ground
`endif

    // Logic analyzer
    .i_la_wb_disable(la_data_in[1]),
    .i_la_write(la_data_in[2]),
    .i_la_addr(la_data_in[14:8]),
    .i_la_data(la_data_in[23:16]),
    .la_data_out(la_data_out[31:0]),

    // Wishbone slave
    .i_wb_cyc(wbs_cyc_i),
    .i_wb_stb(wbs_stb_i),
    .i_wb_we(wbs_we_i),
    .i_wb_addr(wbs_adr_i),
    .i_wb_data(wbs_dat_i),
    .o_wb_ack(wbs_ack_o),
    .o_wb_data(wbs_dat_o),

    // RAMBus ports - unused
//    .rambus_wb_ack_i   (0),
 //   .rambus_wb_dat_i   (0),
    .reset(wb_rst_i),
    .clock(wb_clk_i),

    // IO pins
    .io_in(io_in[15:8]),
    .io_out(io_out[15:8]),
    .io_oeb(io_oeb[15:8]),

    // Interrupts
    .interrupt(user_irq[0])
);

gf180mcu_fd_ip_sram__sram512x8m8wm1 sram (
`ifdef USE_POWER_PINS
    .VDD(vdd),	// User area 1 1.8V power
    .VSS(vss),	// User area 1 digital ground
`endif
    .CLK(wb_clk_i),
    .A(adr_mem),
    .D(memdatout[7:0]),
    .Q(memdatin0[7:0]),
    .GWEN(memrwb),
    .CEN(memenb[0]),
    .WEN({8{cpuen}})
);

endmodule	// user_project_wrapper

`default_nettype wire
