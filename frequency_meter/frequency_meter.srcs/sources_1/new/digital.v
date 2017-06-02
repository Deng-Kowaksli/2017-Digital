`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/05/09 16:26:36
// Design Name: 
// Module Name: digitalshow
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


module digitalshow(
    input clk,
    input rst,
    input [2:0] point,
    input [15:0] digital,
    (* KEEP = "TRUE" *)output reg [7:0] dn,
    (* KEEP = "TRUE" *)output reg [7:0] ntl,
    (* KEEP = "TRUE" *)output reg [7:0] ntr
    );
    reg [17:0] numbercount;//数码管显示计数
    reg [1:0] number;//数码管片选
    always@(posedge clk)
    begin
        if(!rst)
        begin
            numbercount <= 0;
            ntl <= 0;
            ntr <= 0;
        end
        else
        begin
            if(numbercount == 99999)
            begin
                numbercount <= 0;
                if(number==3)
                    number <= 0;
                else
                    number <= number+1;    
            end
            else
                numbercount <= numbercount+1;
            if(number == 0)
            begin
                dn <= 8'b0001_0001;
                ntl <= 8'b0000_0000;
                case(digital[3:0])
                    0:ntr[6:0] <= 7'b011_1111;//0
                    1:ntr[6:0] <= 7'b000_0110;//1
                    2:ntr[6:0] <= 7'b101_1011;//2
                    3:ntr[6:0] <= 7'b100_1111;//3
                    4:ntr[6:0] <= 7'b110_0110;//4
                    5:ntr[6:0] <= 7'b110_1101;//5
                    6:ntr[6:0] <= 7'b111_1101;//6
                    7:ntr[6:0] <= 7'b000_0111;//7
                    8:ntr[6:0] <= 7'b111_1111;//8
                    9:ntr[6:0] <= 7'b110_1111;//9
                    10:ntr[6:0] <= 7'b111_0110;//H
                    default:ntr[6:0] <= 7'b000_0000;
                endcase
                if(point == 0)
                    ntr[7] <= 1;
                else
                    ntr[7] <= 0;                                 
            end
            else;
            if(number == 1)
            begin
                dn <= 8'b0010_0010;
                ntl <= 8'b0000_0000;
                case(digital[7:4])
                    0:ntr[6:0] <= 7'b011_1111;//0
                    1:ntr[6:0] <= 7'b000_0110;//1
                    2:ntr[6:0] <= 7'b101_1011;//2
                    3:ntr[6:0] <= 7'b100_1111;//3
                    4:ntr[6:0] <= 7'b110_0110;//4
                    5:ntr[6:0] <= 7'b110_1101;//5
                    6:ntr[6:0] <= 7'b111_1101;//6
                    7:ntr[6:0] <= 7'b000_0111;//7
                    8:ntr[6:0] <= 7'b111_1111;//8
                    9:ntr[6:0] <= 7'b110_1111;//9
                    default:ntr[6:0] <= 7'b000_0000;
                endcase
                if(point == 1)
                    ntr[7] <= 1;
                else
                    ntr[7] <= 0; 
            end
            else;
            if(number == 2)
            begin
                dn <= 8'b0100_0100;
                ntl <= 8'b0000_0000;
                case(digital[11:8])
                    0:ntr[6:0] <= 7'b011_1111;//0
                    1:ntr[6:0] <= 7'b000_0110;//1
                    2:ntr[6:0] <= 7'b101_1011;//2
                    3:ntr[6:0] <= 7'b100_1111;//3
                    4:ntr[6:0] <= 7'b110_0110;//4
                    5:ntr[6:0] <= 7'b110_1101;//5
                    6:ntr[6:0] <= 7'b111_1101;//6
                    7:ntr[6:0] <= 7'b000_0111;//7
                    8:ntr[6:0] <= 7'b111_1111;//8
                    9:ntr[6:0] <= 7'b110_1111;//9
                    default:ntr[6:0] <= 7'b000_0000;
                endcase
                if(point == 2)
                    ntr[7] <= 1;
                else
                    ntr[7] <= 0; 
            end
            else;                          
            if(number == 3)
            begin
                dn <= 8'b1000_1000;
                ntl <= 8'b0000_0000;
                case(digital[15:12])
                    0:ntr[6:0] <= 7'b011_1111;//0
                    1:ntr[6:0] <= 7'b000_0110;//1
                    2:ntr[6:0] <= 7'b101_1011;//2
                    3:ntr[6:0] <= 7'b100_1111;//3
                    4:ntr[6:0] <= 7'b110_0110;//4
                    5:ntr[6:0] <= 7'b110_1101;//5
                    6:ntr[6:0] <= 7'b111_1101;//6
                    7:ntr[6:0] <= 7'b000_0111;//7
                    8:ntr[6:0] <= 7'b111_1111;//8
                    9:ntr[6:0] <= 7'b110_1111;//9
                    default:ntr[6:0] <= 7'b000_0000;
                endcase
                if(point == 3)
                    ntr[7] <= 1;
                else
                    ntr[7] <= 0; 
            end
            else;
        end      
    end
endmodule
