`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/05/09 16:35:27
// Design Name: 
// Module Name: main
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


module main(
    input clk,
    input rst,
    input measure,
    output wire [7:0] dn,
    output wire [7:0] ntl,
    output wire [7:0] ntr,
    output wire [7:0] led
    );
    wire [23:0] frequencymeasure;
    wire [27:0] frequencybcd;
    wire [2:0] point;
    wire [15:0] digital;
    frequencymeasure fun1(.clk(clk),.rst(rst),.measure(measure),.frequencymeasure(frequencymeasure));
    frequencybcd fun2(.clk(clk),.rst(rst),.frequencymeasure(frequencymeasure),.frequencybcd(frequencybcd));
    frequencycalculate fun3(.clk(clk),.frequencybcd(frequencybcd),.led(led),.point(point),.digital(digital));
    digitalshow fun4(.clk(clk),.rst(rst),.point(point),.digital(digital),.dn(dn),.ntl(ntl),.ntr(ntr));
endmodule
