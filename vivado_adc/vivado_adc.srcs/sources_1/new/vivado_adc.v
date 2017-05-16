`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/03/20 22:10:54
// Design Name: 
// Module Name: vivado_adc
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module vivado_adc(clk, rst,auxn1, auxp1, row_scan_sig, column_scan_sig);

input clk,rst,auxn1,auxp1;
output [7:0] row_scan_sig;
output [3:0] column_scan_sig;
wire [6:0] daddr_in;
wire den_in;
wire ready;
wire [15:0] data;
reg [11:0] adc_data;
reg [11:0] set_adc_data;
reg [25:0] count;
parameter t500ms=49_999_999;
assign daddr_in=7'h11;
assign den_in=1;
smg_display_0 U1(
    .clk(clk), .rst(rst),
    .number_data(set_adc_data),
     .row_scan_sig(row_scan_sig),
    .column_scan_sig(column_scan_sig)
);
    


xadc_wiz_0 U2(
    .dclk_in(clk),
    .reset_in(!rst),
    .daddr_in(daddr_in),
    .den_in(den_in),
    .di_in(),
    .do_out(data),    
    .drdy_out(ready),
    .dwe_in(),
    .vn_in(),
    .vp_in(),
    .vauxn1(auxn1),
    .vauxp1(auxp1),
    .user_temp_alarm_out(),
    .vccaux_alarm_out(),
    .vccint_alarm_out(),
    .ot_out(),
    .channel_out(),
    .alarm_out(),
    .busy_out(),
    .eoc_out(),
    .eos_out()
);
always @(posedge clk or negedge rst)
    if(!rst)
        count<=0;
    else
        if(count==t500ms)
        begin
            count<=0;
            set_adc_data<= adc_data;
        end
        else
            count<=count+1;
            
          
always @(posedge clk or negedge rst)
    if(!rst)
        adc_data<=0;
    else
       if(ready)
          adc_data<= data[15:4];
endmodule
