`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/05/09 19:17:57
// Design Name: 
// Module Name: test
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


module test(

    );
    reg clk;
    reg rst;
    reg [23:0] frequencymeasure;
    wire [27:0] frequencybcd;
    wire [28:0] bcd;
    wire [4:0] count;
    frequencybcd fun(
        .clk(clk),.rst(rst),.frequencymeasure(frequencymeasure),
        .frequencybcd(frequencybcd),.bcd(bcd),.count(count)
        );
    always
    begin
        clk = 0;
        #5;
        clk = 1;
        #5;
    end
    initial
    begin
        clk = 0;
        rst = 1;
        frequencymeasure = 17'b11010101010101010;
        #10;
        rst = 0;
        #10;
        rst = 1;
    end
endmodule
