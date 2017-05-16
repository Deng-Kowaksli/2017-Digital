`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/03/20 20:37:00
// Design Name: 
// Module Name: test_display
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


module test_display( );

reg clk;
reg rst;
wire [7:0] row_scan_sig;
wire [3:0] column_scan_sig;
wire led;

smg_display U6(
.clk(clk),
.rst(rst),
.row_scan_sig(row_scan_sig),
.column_scan_sig(column_scan_sig),
.led(led)
);

parameter PERIOD=10;

always begin
clk = 1'b0;
#(PERIOD/2) clk = 1'b1;
#(PERIOD/2);
end
initial begin
clk = 1'b0;
rst = 1'b1;
#100;
rst = 1'b0;
#100;
rst = 1'b1;
end

  
endmodule
