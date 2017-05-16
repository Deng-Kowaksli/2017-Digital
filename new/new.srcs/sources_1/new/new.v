`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/03/12 00:10:11
// Design Name: 
// Module Name: new
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


module new(
    input CLK,
    input sw_red,
    input sw_green,
    input sw_yello,
    output reg led_red,
    output reg led_green,
    output reg led_yello,
    output reg led_check,
    output reg[10:0] display_out
    );
    reg [0:1]add = 0;
    reg [2:0] sel=0;
    reg [19:0]count=0;
    parameter T1MS=50000;
    always@(*)
    begin
       led_red<=sw_red;
       led_green<=sw_green;
       led_yello<=sw_yello;
       add<=sw_red+sw_green+sw_yello;
       case(add)
        1:led_check<=1;
        default:led_check<=0;
       endcase 
    end
    always@(posedge CLK)
            begin
                if(add==1)
                    begin
                    case(sel)
                    0:display_out<=11'b1000_1011110;
                    1:display_out<=11'b0100_0011101;
                    2:display_out<=11'b0010_0011101;
                    3:display_out<=11'b0001_0111101;            
                    default:display_out<=11'b0000_0000000;
                    endcase
                    end
                else if(add==0)
                    begin
                    case(sel)
                    0:display_out<=11'b1000_1001111;
                    1:display_out<=11'b0100_0000101;
                    2:display_out<=11'b0010_0000101;
                    3:display_out<=11'b0001_0110000;
                    default:display_out<=11'b0000_0000000;
                    endcase
                    end
                else if(add==2)
                    begin
                    case(sel)
                    0:display_out<=11'b1000_1001111;
                    1:display_out<=11'b0100_0000101;
                    2:display_out<=11'b0010_0000101;
                    3:display_out<=11'b0001_1101101;
                    default:display_out<=11'b0000_0000000;
                    endcase
                    end
                else
                    begin
                    case(sel)
                    0:display_out<=11'b1000_1001111;
                    1:display_out<=11'b0100_0000101;
                    2:display_out<=11'b0010_0000101;
                    3:display_out<=11'b0001_1111001;
                    default:display_out<=11'b0000_0000000;
                    endcase
                    end
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
