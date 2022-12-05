module rambus(
`ifdef USE_POWER_PINS
    inout vdd,
    inout vss,
`endif

    input wire        rambus_wb_clk_i,   // clock, must run at system clock
    input wire        rambus_wb_rst_i,   // reset
    input wire        rambus_wb_stb_i,   // write strobe
    input wire        rambus_wb_cyc_i,   // cycle
    input wire        rambus_wb_we_i,    // write enable
    input wire [ 3:0] rambus_wb_sel_i,   // write word select
    input wire [31:0] rambus_wb_dat_i,   // ram data in
    input wire [ 9:0] rambus_wb_addr_i,  // 8 bit address
    output wire        rambus_wb_ack_o,  // ack
    output wire [31:0] rambus_wb_dat_o   // ram data out
);

gf180mcu_fd_ip_sram__sram512x8m8wm1 sram0 (
`ifdef USE_POWER_PINS
    .VDD(vdd),
    .VSS(vss),
`endif
    .CLK(rambus_wb_clk_i),
    .A(rambus_wb_addr_i[8:0]),
    .D(rambus_wb_dat_i[7:0]),
    .Q(rambus_wb_dat_o[7:0]),
    .GWEN(rambus_wb_we_i),
    .CEN(!rambus_wb_rst_i),
    .WEN({8{!rambus_wb_rst_i}})
);

endmodule