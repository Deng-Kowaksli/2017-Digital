`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/06/02 22:21:37
// Design Name: 
// Module Name: 7digits
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


module led_digits(
    output reg[11:0] display_out1,
    output reg[11:0] display_out2,
    input CLK,
    input [15:0] show_num_1,
    input [3:0] dot1,
    input [15:0] show_num_2,
    input [3:0] dot2
    );
    reg [6:0]digit[0:9];
    reg [2:0] sel;
    reg [19:0]count;
    reg [3:0]show11;
    reg [3:0]show12;
    reg [3:0]show13;
    reg [3:0]show14;
    reg [3:0]show21;
    reg [3:0]show22;
    reg [3:0]show23;
    reg [3:0]show24;
    parameter T1MS=50000;
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
always@(posedge CLK)
    begin
        show11 <= show_num_1[3:0];
        show12 <= show_num_1[7:4];
        show13 <= show_num_1[11:8];
        show14 <= show_num_1[15:12];
        show21 <= show_num_2[3:0];
        show22 <= show_num_2[7:4];
        show23 <= show_num_2[11:8];
        show24 <= show_num_2[15:12];
   end
always@(posedge CLK)
            begin
                case(sel)
                    0:display_out1<=dot1[0]<<11|4'b0001<<7|digit[show11];
                    1:display_out1<=dot1[1]<<11|4'b0010<<7|digit[show12];
                    2:display_out1<=dot1[2]<<11|4'b0100<<7|digit[show13];
                    3:display_out1<=dot1[3]<<11|4'b1000<<7|digit[show14];
                endcase
                case(sel)
                    0:display_out2<=dot2[0]<<11|4'b0001<<7|digit[show21];
                    1:display_out2<=dot2[1]<<11|4'b0010<<7|digit[show22];
                    2:display_out2<=dot2[2]<<11|4'b0100<<7|digit[show23];
                    3:display_out2<=dot2[3]<<11|4'b1000<<7|digit[show24];
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
endmodule
