`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

// Engineer: ������
// Module Name: ad
// Description: ad������Ϊ0ͨ�������12λbinary��

//////////////////////////////////////////////////////////////////////////////////


module ad(
    input CLK,
    input ad_input,//0ͨ���ܽ�����
    output reg [11:0] ad_output//ad binary�������
    );
    parameter addr = 'h10;
    reg [15:0]outdata;
    xadc_wiz_0 AD1(.vauxp0(ad_input),.vauxn0(0),.do_out(outdata),.daddr_in(addr),.dclk_in(CLK),.den_in(1));
    always@(posedge CLK)
    begin
        ad_output <= outdata[15:4];
    end
endmodule
