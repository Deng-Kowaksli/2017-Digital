`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/06/02 23:32:17
// Design Name: 
// Module Name: bcd_4round
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


module bcd_4round(
    input [27:0] bcd_in,
    output reg [15:0] bcd_out
    );
    always@(*)
    begin
        if(bcd_in[27:16] == 0)
            bcd_out <= bcd_in[15:0];
        else if(bcd_in[27:20] == 0)
        begin
            bcd_out[15:4] <= bcd_in[19:8];
            if(bcd_in[3:0]>=5)
                bcd_out[3:0] <= bcd_in[7:4]+1;
            else
                bcd_out[3:0] <= bcd_in[7:4];
        end
        else if(bcd_in[27:24] == 0)
            begin
                bcd_out[15:4] <= bcd_in[23:12];
                if(bcd_in[7:4]>=5)
                    bcd_out[3:0] <= bcd_in[11:8]+1;
                else
                    bcd_out[3:0] <= bcd_in[11:8];
            end
        else
            begin
                bcd_out[15:4] <= bcd_in[27:16];
                if(bcd_in[11:8]>=5)
                    bcd_out[3:0] <= bcd_in[15:12]+1;
                else
                    bcd_out[3:0] <= bcd_in[15:12];
             end
    end
endmodule
