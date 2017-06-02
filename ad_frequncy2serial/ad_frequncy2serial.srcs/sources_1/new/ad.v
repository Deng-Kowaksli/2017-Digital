`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/06/02 23:54:21
// Design Name: 
// Module Name: ad
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


module ad(
    input CLK,
    input ad_input,//0通道管脚输入
    output reg [11:0] ad_output//ad binary数据输出
    );
    parameter addr = 'h10;
    reg [15:0]outdata;
    xadc_wiz_0 AD1(.vauxp0(ad_input),.vauxn0(0),.do_out(outdata),.daddr_in(addr),.dclk_in(CLK),.den_in(1));
    always@(posedge CLK)
    begin
        ad_output <= outdata[15:4];
    end
endmodule
