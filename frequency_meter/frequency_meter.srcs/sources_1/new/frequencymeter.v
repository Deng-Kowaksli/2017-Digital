`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/05/9 13:54:25
// Design Name: 
// Module Name: frequencymeter
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


module frequencymeasure(
    input clk,
    input rst,
    input measure,
    (* KEEP = "TRUE" *)output reg [23:0] frequencymeasure
    );
    (* KEEP = "TRUE" *)reg [26:0] count;//100M倍频
    (* KEEP = "TRUE" *)reg [23:0] frequency;//记录翻转次数（低至高）（上限10M）
    (* KEEP = "TRUE" *)reg signm;//异步清零
    (* KEEP = "TRUE" *)reg signc;//异步清零
    always@(posedge measure)
    begin
        if(!rst)
        begin
            frequency <= 0;
            signc <= 0;
        end
        else
        begin
            if(signm == 1)
            begin
                frequency <= 0;
                signc <= 0;
            end
            else
            begin
                frequency <= frequency+1;
                signc <= 1;
            end
        end
    end           
    always@(posedge clk)
    begin
        if(!rst)
        begin
            count <= 0;
            signm <= 0;
        end
        else
        begin
            if(signc == 1&&signm == 1)
            begin
                count <= 0;
            end
            else
            begin
                if(count == 99999999)
                begin
                    count <= 0;
                    frequencymeasure <= frequency;
                    signm <= 1;
                end
                else 
                begin    
                    count <= count+1;  
                    signm <= 0;
                end    
            end
        end
    end
endmodule
