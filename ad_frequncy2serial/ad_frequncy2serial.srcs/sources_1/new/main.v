`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

// Engineer: 邓剡梁
// Module Name: main
// Description: 主程序

//////////////////////////////////////////////////////////////////////////////////


module main(
    input CLK,
    input [7:0] in,
    output reg [7:0] show,
    output reg [2:0] out,
    output reg error,
    output reg sign,
    output reg sign1,
    output reg test,
    output wire[11:0] display_out,
    output wire[11:0] display_out2,
    input button,
    input siginal
    );
    //////////////////////////////////请在此定义使用的变量及连线///////////////////////////////////
    parameter toshow = 32343;
    wire [27:0]wire1;
    wire [15:0]wire2;
    wire [3:0]wire3;
    /////////////////////////////////请在此调用模块实现所需功能///////////////////////////////////
    binary2bcd Binary2bcd(.CLK(CLK),.binaryin(toshow),.bcdout(wire1));
    bcd_4round Bce_round(.bcd_in(wire1),.bcd_out(wire2),.dots(wire3));
    led_digits shownum(.CLK(CLK),.show_num_1(wire2),.dot1(wire3),.show_num_2(0),.dot2(0),.display_out1(display_out),.display_out2(display_out2));
    /////////////////////////////////////////////////////////////////////////////////////////////
endmodule
