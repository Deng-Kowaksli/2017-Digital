`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/06/03 13:57:05
// Design Name: 
// Module Name: ad_var
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


module ad_var(
    input clk,
    input in,
    output reg [11:0] out
    );
    parameter addr = 'h11;
    wire [15:0]outdata;
    xadc_wiz_1 AD2(.vauxp1(in),.vauxn1(),.do_out(outdata),.daddr_in(addr),.dclk_in(clk),.den_in(1));
    always@(posedge clk)
    begin
        out <= outdata[15:4];
    end
endmodule
