`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

// Engineer: 邓剡梁
// Module Name: ad
// Description: ad，输入为0通道，输出12位binary。

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
