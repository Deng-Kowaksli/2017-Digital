`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/03/17 23:17:07
// Design Name: 
// Module Name: 4digits_add
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


module digits_add(
    input [3:0] add1,
    input [3:0] add2,
    output reg [3:0] show1,
    output reg [3:0] show2,
    output reg [7:0] out
    );
    always@(*)
    begin
        show1<=add1;
        show2<=add2;
        out<=add1+add2;
    end
endmodule
