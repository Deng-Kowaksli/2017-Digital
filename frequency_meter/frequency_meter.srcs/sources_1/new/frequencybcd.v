`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/05/09 14:08:10
// Design Name: 
// Module Name: frequencybcd
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


module frequencybcd(
    input clk,
    input rst,
    input [23:0] frequencymeasure,
    (* KEEP = "TRUE" *)output reg [27:0] frequencybcd
//    ,(* KEEP = "TRUE" *)output reg [28:0] bcd
//    ,(* KEEP = "TRUE" *)output reg [4:0] count
    );
    (* KEEP = "TRUE" *)reg [4:0] count;
    (* KEEP = "TRUE" *)reg [28:0] bcd;
    always@(posedge clk)
    begin
        if(!rst)
        begin
            frequencybcd <= 0;
            count <= 0;
            bcd <= 0;
        end
        else
        begin
            if(count == 24)
            begin
                frequencybcd <= bcd[27:0];
                count <= 0;
                bcd <= 0;
            end
            else
            begin
                if(bcd[3:0]>4)
                    bcd[4:1] <= bcd[3:0]+3;
                else
                    bcd[4:1] <= bcd[3:0];
                if(bcd[7:4]>4)
                    bcd[8:5] <= bcd[7:4]+3;
                else
                    bcd[8:5] <= bcd[7:4];
                if(bcd[11:8]>4)
                    bcd[12:9] <= bcd[11:8]+3;
                else
                    bcd[12:9] <= bcd[11:8];
                if(bcd[15:12]>4)
                    bcd[16:13] <= bcd[15:12]+3;
                else
                    bcd[16:13] <= bcd[15:12]; 
                if(bcd[19:16]>4)
                    bcd[20:17] <= bcd[19:16]+3;
                else
                    bcd[20:17] <= bcd[19:16];                    
                if(bcd[23:20]>4)
                    bcd[24:21] <= bcd[23:20]+3;
                else
                    bcd[24:21] <= bcd[23:20];
                if(bcd[27:24]>4)
                    bcd[28:25] <= bcd[27:24]+3;
                else
                    bcd[28:25] <= bcd[27:24];                                      
                bcd[0] <= frequencymeasure[23-count];
                count <= count+1;
            end
        end
    end
endmodule
