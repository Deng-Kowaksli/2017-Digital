`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

// Engineer: ������
// Module Name: ad
// Description: ad������Ϊ0ͨ�������12λbinary��

//////////////////////////////////////////////////////////////////////////////////


module ad(
    input CLK,
    input ad_inputp,//0ͨ���ܽ�����
    input ad_inputn,
    output reg [11:0] ad_output,//ad binary�������
    output reg [11:0] ad_max,
    output reg [11:0] ad_min,
    output reg [11:0] ff
    );
    parameter addr = 'h10;
    wire [15:0]outdata;
    reg [10:0]count;
    xadc_wiz_0 AD1(.vauxp0(ad_inputp),.vauxn0(ad_inputn),.do_out(outdata),.daddr_in(addr),.dclk_in(CLK),.den_in(1));
    always@(posedge CLK)
    begin
        ad_output <= outdata[15:4];
        if(count == 10)
        begin
            ad_max <= 0;
            ad_min <= 0;
            count <= 0;
        end
        else
        begin
            if(ad_output>ad_max)
            ad_max<=ad_output;
            if(ad_output<ad_min)
            ad_min<=ad_output;
            ff <= ad_max-ad_min;
        end
    end
endmodule
