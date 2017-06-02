`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/05/09 15:59:05
// Design Name: 
// Module Name: frequencycalculate
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


module frequencycalculate(
    input [27:0] frequencybcd,
    input clk,
    (* KEEP = "TRUE" *)output reg [2:0] point,
    (* KEEP = "TRUE" *)output reg [15:0] digital,
    (* KEEP = "TRUE" *)output reg [7:0] led
    );
    always@(posedge clk)
    begin
        if(frequencybcd<8'h10)//一位数
        begin  
            point <= 0;
            digital[15:12] <= 10;
            digital[11:8] <= 10;
            digital[7:4] <= 10;
            digital[3:0] <= frequencybcd[3:0];
            led <= 8'b1000_0000;
        end
        else;
        if(frequencybcd<12'h100&&frequencybcd>4'h9)//两位数
        begin
            point <= 0;
            digital[15:12] <= 10;
            digital[11:8] <= 10;
            digital[7:4] <= frequencybcd[7:4];
            digital[3:0] <= frequencybcd[3:0];
            led <= 8'b1000_0000;
        end
        else;
    if(frequencybcd<16'h1000&&frequencybcd>8'h99)//三位数
    begin
        point <= 0;
        digital[15:12] <= 10;
        digital[11:8] <= frequencybcd[11:8];
        digital[7:4] <= frequencybcd[7:4];
        digital[3:0] <= frequencybcd[3:0];
        led <= 8'b1000_0000;
    end
    else;
    if(frequencybcd<20'h10000&&frequencybcd>12'h999)//四位数
    begin
        point <= 0;
        digital[15:12] <= frequencybcd[15:12];
        digital[11:8] <= frequencybcd[11:8];
        digital[7:4] <= frequencybcd[7:4];
        digital[3:0] <= frequencybcd[3:0];
        led <= 8'b1000_0000;
    end
    else;
    if(frequencybcd<24'h100000&&frequencybcd>16'h9999)//五位数
    begin
        if(frequencybcd[3:0]>4)
        begin
            if(frequencybcd[7:4]==9)
            begin
                if(frequencybcd[11:8]==9)
                begin
                    if(frequencybcd[15:12]==9)
                    begin
                        if(frequencybcd[19:16]==9)
                        begin
                            point <= 1;
                            digital[15:12] <= 1;
                            digital[11:0] <= 0;
                        end
                        else
                        begin
                            point <= 2;
                            digital[15:12] <= frequencybcd[19:16]+1;
                            digital[11:0] <= 0;
                        end
                    end
                    else
                    begin
                        point <= 2;
                        digital[15:12] <= frequencybcd[19:16]%10;
                        digital[11:8] <= frequencybcd[15:12]+1;
                        digital[7:0] <= 0;
                    end
                end
                else
                begin
                    point <= 2;
                    digital[15:12] <= frequencybcd[19:16];
                    digital[11:8] <= frequencybcd[15:12];
                    digital[7:4] <= frequencybcd[11:8]+1;
                    digital[3:0] <= 0;
                end
            end
            else
            begin
                point <= 2;
                digital[15:12] <= frequencybcd[19:16];
                digital[11:8] <= frequencybcd[15:12];
                digital[7:4] <= frequencybcd[11:8];
                digital[3:0] <= frequencybcd[7:4]+1;                            
            end
        end
        else
        begin
            point <= 2;
            digital[15:12] <= frequencybcd[19:16];
            digital[11:8] <= frequencybcd[15:12];
            digital[7:4] <= frequencybcd[11:8];
            digital[3:0] <= frequencybcd[7:4];                        
        end
        led <= 8'b0100_0000;
    end
    else;
    if(frequencybcd<28'h1000000&&frequencybcd>20'h99999)//六位数
    begin
        if(frequencybcd[7:4]>4)
        begin
            if(frequencybcd[11:8]==9)
            begin
                if(frequencybcd[15:12]==9)
                begin
                    if(frequencybcd[19:16]==9)
                    begin
                        if(frequencybcd[23:20]==9)
                        begin
                            point <= 3;
                            digital[15:12] <= 1;
                            digital[11:0] <= 0;
                            led <= 8'b0010_0000;
                        end
                        else
                        begin
                            point <= 1;
                            digital[15:12] <= frequencybcd[23:20]+1;
                            digital[11:0] <= 0;
                            led <= 8'b0100_0000; 
                        end
                    end
                    else
                    begin
                        point <= 1;
                        digital[15:12] <= frequencybcd[23:20];
                        digital[11:8] <= frequencybcd[19:16]+1;
                        digital[7:0] <= 0;
                        led <= 8'b0100_0000; 
                    end
                end
                else
                begin
                    point <= 1;
                    digital[15:12] <= frequencybcd[23:20];
                    digital[11:8] <= frequencybcd[19:16];
                    digital[7:4] <= frequencybcd[15:12]+1;
                    digital[3:0] <= 0;
                    led <= 8'b0100_0000; 
                end
            end
            else
            begin
                point <= 1;
                digital[15:12] <= frequencybcd[23:20];
                digital[11:8] <= frequencybcd[19:16];
                digital[7:4] <= frequencybcd[15:12];
                digital[3:0] <= frequencybcd[11:8]+1;
                led <= 8'b0100_0000;                             
            end
        end
        else
        begin
            point <= 1;
            digital[15:12] <= frequencybcd[23:20];
            digital[11:8] <= frequencybcd[19:16];
            digital[7:4] <= frequencybcd[15:12];
            digital[3:0] <= frequencybcd[11:8];
            led <= 8'b0100_0000;                        
        end                        
    end
    else;
    if(frequencybcd<28'h2000500&&frequencybcd>24'h999999)//七位数
    begin
        if(frequencybcd[11:8]>4)
        begin
            if(frequencybcd[15:12]==9)
            begin
                if(frequencybcd[19:16]==9)
                begin
                    if(frequencybcd[23:20]==9)
                    begin
                        if(frequencybcd[27:20]==9)
                        begin
                            point <= 2;
                            digital[15:12] <= 1;
                            digital[11:0] <= 0;
                        end
                        else
                        begin
                            point <= 3;
                            digital[15:12] <= frequencybcd[27:24]+1;
                            digital[11:0] <= 0;
                        end
                    end
                    else
                    begin
                        point <= 3;
                        digital[15:12] <= frequencybcd[27:24];
                        digital[11:8] <= frequencybcd[23:20]+1;
                        digital[7:0] <= 0;
                    end
                end
                else
                begin
                    point <= 3;
                    digital[15:12] <= frequencybcd[27:24];
                    digital[11:8] <= frequencybcd[23:20];
                    digital[7:4] <= frequencybcd[19:16]+1;
                    digital[3:0] <= 0; 
                end
            end
            else
            begin
                point <= 3;
                digital[15:12] <= frequencybcd[27:24];
                digital[11:8] <= frequencybcd[23:20];
                digital[7:4] <= frequencybcd[19:16];
                digital[3:0] <= frequencybcd[15:12]+1;                           
            end
        end
        else
        begin
            point <= 3;
            digital[15:12] <= frequencybcd[27:24];
            digital[11:8] <= frequencybcd[23:20];
            digital[7:4] <= frequencybcd[19:16];
            digital[3:0] <= frequencybcd[15:12];                      
        end
        led <= 8'b0010_0000;                        
    end
    else;                
    if(frequencybcd>28'h2000499)//超量程
    begin
        point <= 4;
        digital[15:12] <= 10;
        digital[11:8] <= 10;
        digital[7:4] <= 10;
        digital[3:0] <= 10;
        led <= 8'b0000_0000;                        
    end
    else;
    end
endmodule
