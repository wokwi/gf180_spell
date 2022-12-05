module user_project_wrapper (user_clock2,
    wb_clk_i,
    wb_rst_i,
    wbs_ack_o,
    wbs_cyc_i,
    wbs_stb_i,
    wbs_we_i,
    vss,
    vdd,
    io_in,
    io_oeb,
    io_out,
    la_data_in,
    la_data_out,
    la_oenb,
    user_irq,
    wbs_adr_i,
    wbs_dat_i,
    wbs_dat_o,
    wbs_sel_i);
 input user_clock2;
 input wb_clk_i;
 input wb_rst_i;
 output wbs_ack_o;
 input wbs_cyc_i;
 input wbs_stb_i;
 input wbs_we_i;
 input vss;
 input vdd;
 input [37:0] io_in;
 output [37:0] io_oeb;
 output [37:0] io_out;
 input [63:0] la_data_in;
 output [63:0] la_data_out;
 input [63:0] la_oenb;
 output [2:0] user_irq;
 input [31:0] wbs_adr_i;
 input [31:0] wbs_dat_i;
 output [31:0] wbs_dat_o;
 input [3:0] wbs_sel_i;

 wire rambus_wb_ack;
 wire \rambus_wb_addr[0] ;
 wire \rambus_wb_addr[1] ;
 wire \rambus_wb_addr[2] ;
 wire \rambus_wb_addr[3] ;
 wire \rambus_wb_addr[4] ;
 wire \rambus_wb_addr[5] ;
 wire \rambus_wb_addr[6] ;
 wire \rambus_wb_addr[7] ;
 wire \rambus_wb_addr[8] ;
 wire \rambus_wb_addr[9] ;
 wire rambus_wb_clk;
 wire rambus_wb_cyc;
 wire \rambus_wb_dat_i[0] ;
 wire \rambus_wb_dat_i[10] ;
 wire \rambus_wb_dat_i[11] ;
 wire \rambus_wb_dat_i[12] ;
 wire \rambus_wb_dat_i[13] ;
 wire \rambus_wb_dat_i[14] ;
 wire \rambus_wb_dat_i[15] ;
 wire \rambus_wb_dat_i[16] ;
 wire \rambus_wb_dat_i[17] ;
 wire \rambus_wb_dat_i[18] ;
 wire \rambus_wb_dat_i[19] ;
 wire \rambus_wb_dat_i[1] ;
 wire \rambus_wb_dat_i[20] ;
 wire \rambus_wb_dat_i[21] ;
 wire \rambus_wb_dat_i[22] ;
 wire \rambus_wb_dat_i[23] ;
 wire \rambus_wb_dat_i[24] ;
 wire \rambus_wb_dat_i[25] ;
 wire \rambus_wb_dat_i[26] ;
 wire \rambus_wb_dat_i[27] ;
 wire \rambus_wb_dat_i[28] ;
 wire \rambus_wb_dat_i[29] ;
 wire \rambus_wb_dat_i[2] ;
 wire \rambus_wb_dat_i[30] ;
 wire \rambus_wb_dat_i[31] ;
 wire \rambus_wb_dat_i[3] ;
 wire \rambus_wb_dat_i[4] ;
 wire \rambus_wb_dat_i[5] ;
 wire \rambus_wb_dat_i[6] ;
 wire \rambus_wb_dat_i[7] ;
 wire \rambus_wb_dat_i[8] ;
 wire \rambus_wb_dat_i[9] ;
 wire \rambus_wb_dat_o[0] ;
 wire \rambus_wb_dat_o[10] ;
 wire \rambus_wb_dat_o[11] ;
 wire \rambus_wb_dat_o[12] ;
 wire \rambus_wb_dat_o[13] ;
 wire \rambus_wb_dat_o[14] ;
 wire \rambus_wb_dat_o[15] ;
 wire \rambus_wb_dat_o[16] ;
 wire \rambus_wb_dat_o[17] ;
 wire \rambus_wb_dat_o[18] ;
 wire \rambus_wb_dat_o[19] ;
 wire \rambus_wb_dat_o[1] ;
 wire \rambus_wb_dat_o[20] ;
 wire \rambus_wb_dat_o[21] ;
 wire \rambus_wb_dat_o[22] ;
 wire \rambus_wb_dat_o[23] ;
 wire \rambus_wb_dat_o[24] ;
 wire \rambus_wb_dat_o[25] ;
 wire \rambus_wb_dat_o[26] ;
 wire \rambus_wb_dat_o[27] ;
 wire \rambus_wb_dat_o[28] ;
 wire \rambus_wb_dat_o[29] ;
 wire \rambus_wb_dat_o[2] ;
 wire \rambus_wb_dat_o[30] ;
 wire \rambus_wb_dat_o[31] ;
 wire \rambus_wb_dat_o[3] ;
 wire \rambus_wb_dat_o[4] ;
 wire \rambus_wb_dat_o[5] ;
 wire \rambus_wb_dat_o[6] ;
 wire \rambus_wb_dat_o[7] ;
 wire \rambus_wb_dat_o[8] ;
 wire \rambus_wb_dat_o[9] ;
 wire rambus_wb_rst;
 wire \rambus_wb_sel[0] ;
 wire \rambus_wb_sel[1] ;
 wire \rambus_wb_sel[2] ;
 wire \rambus_wb_sel[3] ;
 wire rambus_wb_stb;
 wire rambus_wb_we;

 rambus rambus0 (.rambus_wb_ack_o(rambus_wb_ack),
    .rambus_wb_clk_i(rambus_wb_clk),
    .rambus_wb_cyc_i(rambus_wb_cyc),
    .rambus_wb_rst_i(rambus_wb_rst),
    .rambus_wb_stb_i(rambus_wb_stb),
    .rambus_wb_we_i(rambus_wb_we),
    .vdd(vdd),
    .vss(vss),
    .rambus_wb_addr_i({\rambus_wb_addr[8] ,
    \rambus_wb_addr[7] ,
    \rambus_wb_addr[6] ,
    \rambus_wb_addr[5] ,
    \rambus_wb_addr[4] ,
    \rambus_wb_addr[3] ,
    \rambus_wb_addr[2] ,
    \rambus_wb_addr[1] ,
    \rambus_wb_addr[0] }),
    .rambus_wb_dat_i({\rambus_wb_dat_i[31] ,
    \rambus_wb_dat_i[30] ,
    \rambus_wb_dat_i[29] ,
    \rambus_wb_dat_i[28] ,
    \rambus_wb_dat_i[27] ,
    \rambus_wb_dat_i[26] ,
    \rambus_wb_dat_i[25] ,
    \rambus_wb_dat_i[24] ,
    \rambus_wb_dat_i[23] ,
    \rambus_wb_dat_i[22] ,
    \rambus_wb_dat_i[21] ,
    \rambus_wb_dat_i[20] ,
    \rambus_wb_dat_i[19] ,
    \rambus_wb_dat_i[18] ,
    \rambus_wb_dat_i[17] ,
    \rambus_wb_dat_i[16] ,
    \rambus_wb_dat_i[15] ,
    \rambus_wb_dat_i[14] ,
    \rambus_wb_dat_i[13] ,
    \rambus_wb_dat_i[12] ,
    \rambus_wb_dat_i[11] ,
    \rambus_wb_dat_i[10] ,
    \rambus_wb_dat_i[9] ,
    \rambus_wb_dat_i[8] ,
    \rambus_wb_dat_i[7] ,
    \rambus_wb_dat_i[6] ,
    \rambus_wb_dat_i[5] ,
    \rambus_wb_dat_i[4] ,
    \rambus_wb_dat_i[3] ,
    \rambus_wb_dat_i[2] ,
    \rambus_wb_dat_i[1] ,
    \rambus_wb_dat_i[0] }),
    .rambus_wb_dat_o({\rambus_wb_dat_o[31] ,
    \rambus_wb_dat_o[30] ,
    \rambus_wb_dat_o[29] ,
    \rambus_wb_dat_o[28] ,
    \rambus_wb_dat_o[27] ,
    \rambus_wb_dat_o[26] ,
    \rambus_wb_dat_o[25] ,
    \rambus_wb_dat_o[24] ,
    \rambus_wb_dat_o[23] ,
    \rambus_wb_dat_o[22] ,
    \rambus_wb_dat_o[21] ,
    \rambus_wb_dat_o[20] ,
    \rambus_wb_dat_o[19] ,
    \rambus_wb_dat_o[18] ,
    \rambus_wb_dat_o[17] ,
    \rambus_wb_dat_o[16] ,
    \rambus_wb_dat_o[15] ,
    \rambus_wb_dat_o[14] ,
    \rambus_wb_dat_o[13] ,
    \rambus_wb_dat_o[12] ,
    \rambus_wb_dat_o[11] ,
    \rambus_wb_dat_o[10] ,
    \rambus_wb_dat_o[9] ,
    \rambus_wb_dat_o[8] ,
    \rambus_wb_dat_o[7] ,
    \rambus_wb_dat_o[6] ,
    \rambus_wb_dat_o[5] ,
    \rambus_wb_dat_o[4] ,
    \rambus_wb_dat_o[3] ,
    \rambus_wb_dat_o[2] ,
    \rambus_wb_dat_o[1] ,
    \rambus_wb_dat_o[0] }),
    .rambus_wb_sel_i({\rambus_wb_sel[3] ,
    \rambus_wb_sel[2] ,
    \rambus_wb_sel[1] ,
    \rambus_wb_sel[0] }));
 spell spell (.clock(wb_clk_i),
    .i_la_wb_disable(la_data_in[1]),
    .i_la_write(la_data_in[2]),
    .i_wb_cyc(wbs_cyc_i),
    .i_wb_stb(wbs_stb_i),
    .i_wb_we(wbs_we_i),
    .interrupt(user_irq[0]),
    .o_wb_ack(wbs_ack_o),
    .rambus_wb_ack_i(rambus_wb_ack),
    .rambus_wb_clk_o(rambus_wb_clk),
    .rambus_wb_cyc_o(rambus_wb_cyc),
    .rambus_wb_rst_o(rambus_wb_rst),
    .rambus_wb_stb_o(rambus_wb_stb),
    .rambus_wb_we_o(rambus_wb_we),
    .reset(wb_rst_i),
    .vdd(vdd),
    .vss(vss),
    .i_la_addr({la_data_in[14],
    la_data_in[13],
    la_data_in[12],
    la_data_in[11],
    la_data_in[10],
    la_data_in[9],
    la_data_in[8]}),
    .i_la_data({la_data_in[23],
    la_data_in[22],
    la_data_in[21],
    la_data_in[20],
    la_data_in[19],
    la_data_in[18],
    la_data_in[17],
    la_data_in[16]}),
    .i_wb_addr({wbs_adr_i[31],
    wbs_adr_i[30],
    wbs_adr_i[29],
    wbs_adr_i[28],
    wbs_adr_i[27],
    wbs_adr_i[26],
    wbs_adr_i[25],
    wbs_adr_i[24],
    wbs_adr_i[23],
    wbs_adr_i[22],
    wbs_adr_i[21],
    wbs_adr_i[20],
    wbs_adr_i[19],
    wbs_adr_i[18],
    wbs_adr_i[17],
    wbs_adr_i[16],
    wbs_adr_i[15],
    wbs_adr_i[14],
    wbs_adr_i[13],
    wbs_adr_i[12],
    wbs_adr_i[11],
    wbs_adr_i[10],
    wbs_adr_i[9],
    wbs_adr_i[8],
    wbs_adr_i[7],
    wbs_adr_i[6],
    wbs_adr_i[5],
    wbs_adr_i[4],
    wbs_adr_i[3],
    wbs_adr_i[2],
    wbs_adr_i[1],
    wbs_adr_i[0]}),
    .i_wb_data({wbs_dat_i[31],
    wbs_dat_i[30],
    wbs_dat_i[29],
    wbs_dat_i[28],
    wbs_dat_i[27],
    wbs_dat_i[26],
    wbs_dat_i[25],
    wbs_dat_i[24],
    wbs_dat_i[23],
    wbs_dat_i[22],
    wbs_dat_i[21],
    wbs_dat_i[20],
    wbs_dat_i[19],
    wbs_dat_i[18],
    wbs_dat_i[17],
    wbs_dat_i[16],
    wbs_dat_i[15],
    wbs_dat_i[14],
    wbs_dat_i[13],
    wbs_dat_i[12],
    wbs_dat_i[11],
    wbs_dat_i[10],
    wbs_dat_i[9],
    wbs_dat_i[8],
    wbs_dat_i[7],
    wbs_dat_i[6],
    wbs_dat_i[5],
    wbs_dat_i[4],
    wbs_dat_i[3],
    wbs_dat_i[2],
    wbs_dat_i[1],
    wbs_dat_i[0]}),
    .io_in({io_in[15],
    io_in[14],
    io_in[13],
    io_in[12],
    io_in[11],
    io_in[10],
    io_in[9],
    io_in[8]}),
    .io_oeb({io_oeb[15],
    io_oeb[14],
    io_oeb[13],
    io_oeb[12],
    io_oeb[11],
    io_oeb[10],
    io_oeb[9],
    io_oeb[8]}),
    .io_out({io_out[15],
    io_out[14],
    io_out[13],
    io_out[12],
    io_out[11],
    io_out[10],
    io_out[9],
    io_out[8]}),
    .la_data_out({la_data_out[31],
    la_data_out[30],
    la_data_out[29],
    la_data_out[28],
    la_data_out[27],
    la_data_out[26],
    la_data_out[25],
    la_data_out[24],
    la_data_out[23],
    la_data_out[22],
    la_data_out[21],
    la_data_out[20],
    la_data_out[19],
    la_data_out[18],
    la_data_out[17],
    la_data_out[16],
    la_data_out[15],
    la_data_out[14],
    la_data_out[13],
    la_data_out[12],
    la_data_out[11],
    la_data_out[10],
    la_data_out[9],
    la_data_out[8],
    la_data_out[7],
    la_data_out[6],
    la_data_out[5],
    la_data_out[4],
    la_data_out[3],
    la_data_out[2],
    la_data_out[1],
    la_data_out[0]}),
    .o_wb_data({wbs_dat_o[31],
    wbs_dat_o[30],
    wbs_dat_o[29],
    wbs_dat_o[28],
    wbs_dat_o[27],
    wbs_dat_o[26],
    wbs_dat_o[25],
    wbs_dat_o[24],
    wbs_dat_o[23],
    wbs_dat_o[22],
    wbs_dat_o[21],
    wbs_dat_o[20],
    wbs_dat_o[19],
    wbs_dat_o[18],
    wbs_dat_o[17],
    wbs_dat_o[16],
    wbs_dat_o[15],
    wbs_dat_o[14],
    wbs_dat_o[13],
    wbs_dat_o[12],
    wbs_dat_o[11],
    wbs_dat_o[10],
    wbs_dat_o[9],
    wbs_dat_o[8],
    wbs_dat_o[7],
    wbs_dat_o[6],
    wbs_dat_o[5],
    wbs_dat_o[4],
    wbs_dat_o[3],
    wbs_dat_o[2],
    wbs_dat_o[1],
    wbs_dat_o[0]}),
    .rambus_wb_addr_o({\rambus_wb_addr[9] ,
    \rambus_wb_addr[8] ,
    \rambus_wb_addr[7] ,
    \rambus_wb_addr[6] ,
    \rambus_wb_addr[5] ,
    \rambus_wb_addr[4] ,
    \rambus_wb_addr[3] ,
    \rambus_wb_addr[2] ,
    \rambus_wb_addr[1] ,
    \rambus_wb_addr[0] }),
    .rambus_wb_dat_i({\rambus_wb_dat_o[31] ,
    \rambus_wb_dat_o[30] ,
    \rambus_wb_dat_o[29] ,
    \rambus_wb_dat_o[28] ,
    \rambus_wb_dat_o[27] ,
    \rambus_wb_dat_o[26] ,
    \rambus_wb_dat_o[25] ,
    \rambus_wb_dat_o[24] ,
    \rambus_wb_dat_o[23] ,
    \rambus_wb_dat_o[22] ,
    \rambus_wb_dat_o[21] ,
    \rambus_wb_dat_o[20] ,
    \rambus_wb_dat_o[19] ,
    \rambus_wb_dat_o[18] ,
    \rambus_wb_dat_o[17] ,
    \rambus_wb_dat_o[16] ,
    \rambus_wb_dat_o[15] ,
    \rambus_wb_dat_o[14] ,
    \rambus_wb_dat_o[13] ,
    \rambus_wb_dat_o[12] ,
    \rambus_wb_dat_o[11] ,
    \rambus_wb_dat_o[10] ,
    \rambus_wb_dat_o[9] ,
    \rambus_wb_dat_o[8] ,
    \rambus_wb_dat_o[7] ,
    \rambus_wb_dat_o[6] ,
    \rambus_wb_dat_o[5] ,
    \rambus_wb_dat_o[4] ,
    \rambus_wb_dat_o[3] ,
    \rambus_wb_dat_o[2] ,
    \rambus_wb_dat_o[1] ,
    \rambus_wb_dat_o[0] }),
    .rambus_wb_dat_o({\rambus_wb_dat_i[31] ,
    \rambus_wb_dat_i[30] ,
    \rambus_wb_dat_i[29] ,
    \rambus_wb_dat_i[28] ,
    \rambus_wb_dat_i[27] ,
    \rambus_wb_dat_i[26] ,
    \rambus_wb_dat_i[25] ,
    \rambus_wb_dat_i[24] ,
    \rambus_wb_dat_i[23] ,
    \rambus_wb_dat_i[22] ,
    \rambus_wb_dat_i[21] ,
    \rambus_wb_dat_i[20] ,
    \rambus_wb_dat_i[19] ,
    \rambus_wb_dat_i[18] ,
    \rambus_wb_dat_i[17] ,
    \rambus_wb_dat_i[16] ,
    \rambus_wb_dat_i[15] ,
    \rambus_wb_dat_i[14] ,
    \rambus_wb_dat_i[13] ,
    \rambus_wb_dat_i[12] ,
    \rambus_wb_dat_i[11] ,
    \rambus_wb_dat_i[10] ,
    \rambus_wb_dat_i[9] ,
    \rambus_wb_dat_i[8] ,
    \rambus_wb_dat_i[7] ,
    \rambus_wb_dat_i[6] ,
    \rambus_wb_dat_i[5] ,
    \rambus_wb_dat_i[4] ,
    \rambus_wb_dat_i[3] ,
    \rambus_wb_dat_i[2] ,
    \rambus_wb_dat_i[1] ,
    \rambus_wb_dat_i[0] }),
    .rambus_wb_sel_o({\rambus_wb_sel[3] ,
    \rambus_wb_sel[2] ,
    \rambus_wb_sel[1] ,
    \rambus_wb_sel[0] }));
endmodule
