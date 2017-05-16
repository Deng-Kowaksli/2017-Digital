`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/03/19 16:22:48
// Design Name: 
// Module Name: decode
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


module decode(
    input CLK,
    input [7:0] in,
    output reg [7:0] show,
    output reg [2:0] out,
    output reg error,
    output reg sign,
    output reg sign1,
    output reg[10:0] display_out,
    output reg[10:0] display_out2,
    input button
    );
    reg [2:0] sel=0;
    reg [19:0]count=0;
    parameter T1MS=50000;
    reg [6:0]digit[0:9];
    reg [10:0]click;
    reg [3:0]show1;
    reg [3:0]show2;
    reg [3:0]show3;
    reg [3:0]show4;
    reg [15:0]press;
    reg [1:0]lose;
    //= {7'b1111110,7'b0110000,7'b1101101,7'b1111001,7'b0110011,7'b1011011,7'b1011111,7'b1110000,7'b1111111,7'b1111011};
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
        show<=in;
        error<=0;
        case (in)
        8'b00000001 : out<=0;
        8'b00000010 : out<=1;
        8'b00000100 : out<=2;
        8'b00001000 : out<=3;
        8'b00010000 : out<=4;
        8'b00100000 : out<=5;
        8'b01000000 : out<=6;
        8'b10000000 : out<=7;
        default : error<=1;
        endcase
        if(error==1)
        out<=0;
    end
    always@(posedge CLK)
    begin
    if(error==0)
      begin
        case(sel)
        0:display_out<=4'b0001<<7|digit[out];
        1:display_out<=4'b0010<<7;
        2:display_out<=4'b0100<<7;
        3:display_out<=4'b1000<<7;
        default:display_out<=11'b0000_0000000;
        endcase
      end
      else
        begin
            case(sel)
            0:display_out<=11'b1000_1001111;
            1:display_out<=11'b0100_0000101;
            2:display_out<=11'b0010_0000101;
            3:display_out<=11'b0001_0110000;
            default:display_out<=11'b0000_0000000;
            endcase  
        end
        case(sel)
            0:display_out2<=4'b0001<<7|digit[show1];
            1:display_out2<=4'b0010<<7|digit[show2];
            2:display_out2<=4'b0100<<7|digit[show3];
            3:display_out2<=4'b1000<<7|digit[show4];
        endcase
    end
    always@(posedge CLK)
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
     always@(posedge CLK)
        begin
            //sign <= button;
            if(button==1)
            begin
            sign <= 1;
            press <= press+1;
            end
            else
            begin
            sign <= 0;
            press <= 0;
            lose <=1;
            end
            if(press==10000&&lose==1)
            begin
                sign1 <=1;
                lose <=0;
                press <= 0;
                click <= click+1;
                show4 <= click/1000;
                show3 <= (click-click/1000*1000)/100;
                show2 <= (click-click/100*100)/10;
                show1 <= click-click/10*10;
            end
        end
endmodule
