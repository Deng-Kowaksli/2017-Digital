`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/04/21 13:42:31
// Design Name: 
// Module Name: adda
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


module adda(
    input signial,
    input clk,
    output reg[11:0] display_out,
    output reg[11:0] display_out2,
    output reg[2:0] ssel
    );
    wire [15:0]outdata;
    reg [10:0]count;
    parameter addr = 'h11;
    parameter adclock = 100;
    parameter T1MS=50000;
//    reg clkad;
    reg [6:0]digit[0:9];
    reg [2:0] sel;
    reg [3:0]show1;
    reg [3:0]show2;
    reg [3:0]show3;
    reg [3:0]show4;
    reg [3:0]show11;
    reg [3:0]show12;
    reg [3:0]show13;
    reg [3:0]show14;
    reg[3:0] dot;
    reg[3:0] dot1;
    reg[31:0] voltage;
    xadc_wiz_0 AD1(.vauxp1(signial),.vauxn1(),.do_out(outdata),.daddr_in(addr));
    always@(*)
        begin
            digit[0] <= 7'b1111110;
            digit[1] <= 7'b0110000;
            digit[2] <= 7'b1101101;
            digit[3] <= 7'b1111001;
            digit[4] <= 7'b0110011;
            digit[5] <= 7'b1011011;
            digit[6] <= 7'b1011111;
            digit[7] <= 7'b1110000;
            digit[8] <= 7'b1111111;
            digit[9] <= 7'b1111011;
        end
    always@(posedge clk)
    begin
        count <=count+1;
        if(count==adclock)
        begin

//        clkad <= ~clkad;
        count <= 0;
        end
        voltage <= 'b1111_1111_1111;
//        voltage <= outdata[15:4];
        show4 <= voltage/1000;
        show3 <= (voltage-voltage/1000*1000)/100;
        show2 <= (voltage-voltage/100*100)/10;
        show1 <= voltage-voltage/10*10;
    end
//    always@(posedge clkad)
//    begin
        
//    end
always@(posedge clk)
    begin
    count<=count+1;
    if(count==T1MS)
        begin
        count<=0;
        sel<=sel+1;
        if(sel==4)
        sel<=0;
        end
    end
always@(posedge clk)
    begin
        ssel<=sel;
        case(sel)
        0:display_out<=dot1[0]<<11|4'b0001<<7|digit[show11];
        1:display_out<=dot1[1]<<11|4'b0010<<7|digit[show12];
        2:display_out<=dot1[2]<<11|4'b0100<<7|digit[show13];
        3:display_out<=dot1[3]<<11|4'b1000<<7|digit[show14];
        endcase  
        case(sel)
        0:display_out2<=dot[0]<<11|4'b0001<<7|digit[show1];
        1:display_out2<=dot[1]<<11|4'b0010<<7|digit[show2];
        2:display_out2<=dot[2]<<11|4'b0100<<7|digit[show3];
        3:display_out2<=dot[3]<<11|4'b1000<<7|digit[show4];
        endcase
    end 
endmodule
