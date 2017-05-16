`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/03/20 11:46:08
// Design Name: 
// Module Name: smg_display
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


module smg_display(clk, rst,number_data, row_scan_sig, column_scan_sig);

input clk, rst;
input [15:0] number_data;
output[7:0] row_scan_sig;
output[3:0] column_scan_sig;

wire [3:0] one_data, ten_data, hundred_data, thousand_data;
wire [7:0] one_seg_data, ten_seg_data, hundred_seg_data, thousand_seg_data;
get_number U1(
    .clk(clk),
    .rst(rst),
    .number_data(number_data),
    .one_data(one_data),
    .ten_data(ten_data),   
     .hundred_data(hundred_data),
    .thousand_data(thousand_data) 
);
transform_code U2(
    .clk(clk),
    .rst(rst),
    .one_data(one_data),
    .ten_data(ten_data),
    .hundred_data(hundred_data),
    .thousand_data(thousand_data),
    .one_seg_data(one_seg_data),
    .ten_seg_data(ten_seg_data),
    .hundred_seg_data(hundred_seg_data),
    .thousand_seg_data(thousand_seg_data)
);
smg_scan U3(
    .clk(clk),
    .rst(rst),
    .one_seg_data(one_seg_data),
    .ten_seg_data(ten_seg_data),
    .hundred_seg_data(hundred_seg_data),
    .thousand_seg_data(thousand_seg_data),
    .row_scan_sig(row_scan_sig),
    .column_scan_sig(column_scan_sig)
);
endmodule
