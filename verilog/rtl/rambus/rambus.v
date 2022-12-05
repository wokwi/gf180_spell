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
    input wire [ 8:0] rambus_wb_addr_i,  // 9 bit address
    output reg        rambus_wb_ack_o,  // ack
    output reg [31:0] rambus_wb_dat_o   // ram data out
);

reg [31:0]data[127:0];

always @(posedge rambus_wb_clk_i)
begin
    if (rambus_wb_rst_i)
    begin
        rambus_wb_ack_o <= 1'b0;
        rambus_wb_dat_o <= 32'b0;
    end
    else
    begin
        if (rambus_wb_cyc_i && rambus_wb_stb_i)
        begin
            if (rambus_wb_we_i)
            begin
                if (rambus_wb_sel_i[0])
                    data[rambus_wb_addr_i[8:2]][ 7: 0] <= rambus_wb_dat_i[ 7: 0];
                if (rambus_wb_sel_i[1])
                    data[rambus_wb_addr_i[8:2]][15: 8] <= rambus_wb_dat_i[15: 8];
                if (rambus_wb_sel_i[2])
                    data[rambus_wb_addr_i[8:2]][23:16] <= rambus_wb_dat_i[23:16];
                if (rambus_wb_sel_i[3])
                    data[rambus_wb_addr_i[8:2]][31:24] <= rambus_wb_dat_i[31:24];
            end
            else
            begin
                rambus_wb_dat_o <= data[rambus_wb_addr_i[8:2]];
            end
            rambus_wb_ack_o <= 1'b1;
        end
        else
        begin
            rambus_wb_ack_o <= 1'b0;
        end
    end
end

endmodule