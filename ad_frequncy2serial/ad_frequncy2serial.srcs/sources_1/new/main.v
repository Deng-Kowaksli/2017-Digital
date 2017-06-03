`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

// Engineer: 邓剡梁
// Module Name: main
// Description: 主程序

//////////////////////////////////////////////////////////////////////////////////


module main(
    input CLK,
    output reg [7:0] show,
    output reg [2:0] out,
    output reg error,
    output reg sign,
    output reg sign1,
    output reg test,
    output wire[11:0] display_out,
    output wire[11:0] display_out2,
    input button,
    input wheel,
    input adsiginal,
    input adsiginaln,
    input siginal
    );
    //////////////////////////////////请在此定义使用的变量及连线///////////////////////////////////
    parameter toshow = 32343;
    wire [27:0]wire1;
    wire [15:0]wire2;
    wire [3:0]wire3;
    wire [11:0]wire4;
    wire [27:0]wire5;
    wire [15:0]wire6;
    wire [20:0]wire7;
    wire [11:0]wire8;
    reg [23:0]adoutdata;
    wire adsign;
    /////////////////////////////////请在此调用模块实现所需功能///////////////////////////////////
    binary2bcd Binary2bcd(.CLK(CLK),.binaryin(wire7),.bcdout(wire1));
    binary2bcd Binary2bcd2(.CLK(CLK),.binaryin(adoutdata),.bcdout(wire5));
    bcd_4round Bce_round(.bcd_in(wire1),.bcd_out(wire2),.dots(wire3));
    //bcd_4round Bce_round2(.bcd_in(wire5),.bcd_out(wire6),.dots());
    //ad_var ADC0(.clk(CLK),.in(wheel),.out(wire4));
    ad ADC1(.CLK(CLK),.ad_inputp(adsiginal),.ad_inputn(adsiginaln),.ad_output(wire4),.ff(wire8));
    analogfre2binary Analogfre(.siginal(wire4),.CLK(CLK),.sign1(adsign),.finfre(wire7));
    led_digits shownum(.CLK(CLK),.show_num_1(wire2),.dot1(wire3),.show_num_2(wire5>>12),.dot2(0),.display_out1(display_out),.display_out2(display_out2));
    /////////////////////////////////////请在此进行数据处理//////////////////////////////////////
    always@(posedge CLK)
    begin
        adoutdata <= wire8 * 366;
        sign <= adsign;
    end
endmodule
