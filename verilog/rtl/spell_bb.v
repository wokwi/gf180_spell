module spell (
`ifdef USE_POWER_PINS
    inout vdd,	// User area 1 1.8V supply
    inout vss,	// User area 1 digital ground
`endif

    input wire reset,
    input wire clock,

    // Logic anaylzer
    input wire i_la_write,
    input wire [6:0] i_la_addr,
    input wire [7:0] i_la_data,
    input wire i_la_wb_disable,
    output wire [31:0] la_data_out,

    // Wishbone interface
    input  wire        i_wb_cyc,   // wishbone transaction
    input  wire        i_wb_stb,   // strobe
    input  wire        i_wb_we,    // write enable
    input  wire [31:0] i_wb_addr,  // address
    input  wire [31:0] i_wb_data,  // incoming data
    output wire        o_wb_ack,   // request is completed 
    output reg  [31:0] o_wb_data,  // output data

    // GPIO
    input  wire [7:0] io_in,
    output wire [7:0] io_out,
    output wire [7:0] io_oeb,  // out enable bar (low active)

    // Shared RAM wishbone controller
    output wire        rambus_wb_clk_o,   // clock, must run at system clock
    output wire        rambus_wb_rst_o,   // reset
    output wire        rambus_wb_stb_o,   // write strobe
    output wire        rambus_wb_cyc_o,   // cycle
    output wire        rambus_wb_we_o,    // write enable
    output wire [ 3:0] rambus_wb_sel_o,   // write word select
    output wire [31:0] rambus_wb_dat_o,   // ram data out
    output wire [ 9:0] rambus_wb_addr_o,  // 8 bit address
    input  wire        rambus_wb_ack_i,   // ack
    input  wire [31:0] rambus_wb_dat_i,   // ram data in

    // Interrupt
    output wire interrupt
);

endmodule

