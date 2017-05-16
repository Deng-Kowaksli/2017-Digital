`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/04/11 18:21:35
// Design Name: 
// Module Name: add
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


module add(
    input clk,
    input [11:0] sw,
    output reg [7:0] led,
    output reg tc
    );
    reg [26:0] count;
    always@(posedge clk)
    begin
        if(sw[3]==0)
        begin
            tc <= 0;
            led <= 8'b0000_0000;
        end
        else;
        if(sw[3]==1 && sw[2]==1 && sw[1]==0);
        if(sw[3]==1 && sw[2]==1 && sw[1]==1 && sw[0]==0)
            tc <= 0;
        else;
        if(count == 99999999)
        begin
            count <= 0;
            if(sw[3]==1 && sw[2]==0)
            led <= sw[11:4];
            else;
            if(sw[3]==1 && sw[2]==1 && sw[1]==1 && sw[0]==1)
            begin
                if(led == 8'b1111_1111)
                begin
                    led <= 8'b0;
                    tc <= 0;
                end
                else
                    if(led == 8'b1111_1110)
                    begin
                        led <= led+1;
                        tc <= 1;
                    end
                    else
                        led <= led+1;                
            end
        end
        else
            count <= count+1;
    end
endmodule
