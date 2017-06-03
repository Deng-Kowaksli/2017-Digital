`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/05/15 09:29:48
// Design Name: 
// Module Name: debounce_module
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


module detect_module( clk, rst, pin_in, h_l_sig, l_h_sig
    );
    
    input clk, rst, pin_in;
    output h_l_sig, l_h_sig;
    
    parameter T1MS= 20'd99_999 ;
    
    reg [19:0] count;
    reg is_en;
    reg h_l_f1, h_l_f2, l_h_f1, l_h_f2;
    
    always@(posedge clk or negedge rst)
        if(!rst)
        begin
            count <= 0;
            is_en <= 0;
        end
        else if (count == T1MS)
            is_en <= 1;
        else
            count <= count + 1;
            
    always@(posedge clk or negedge rst)
        if(!rst)
        begin
           h_l_f1     <= 1'b1;
           h_l_f2     <= 1'b1; 
           l_h_f1     <= 1'b0;
           l_h_f2     <= 1'b0;
        end
        else
        begin
            h_l_f1     <= pin_in;
            h_l_f2     <= h_l_f1;
            l_h_f1     <= pin_in;
            l_h_f2     <= l_h_f1;   
        end
     
     assign h_l_sig =  is_en ? (h_l_f2 & (!h_l_f1)):0 ;
     assign l_h_sig =  is_en ? ((!l_h_f2) & h_l_f1):0 ;
endmodule


module delay_module( clk, rst, pin_out, h_l_sig, l_h_sig
    );
    
    input clk, rst,  h_l_sig, l_h_sig;
    output pin_out;
    
    parameter T1MS= 20'd99_999;
    
    reg [19:0] count;
    reg is_count;
    reg rpin_out;
    reg [1:0] i;
    reg [3:0]count_ms;
    
    always@(posedge clk or negedge rst)
         if(!rst)
            count = 20'd0;
         else if(is_count && count==T1MS)
            count <= 0; 
         else if(is_count)
            count <= count + 1;
         else if(!is_count)
            count <= 0;
            
            
     always@(posedge clk or negedge rst)
         if(!rst)
            count_ms <= 4'd0;       
         else if(is_count && count==T1MS)
            count_ms <= count_ms+1;
         else if(!is_count)
            count_ms <= 4'd0;
         else if(count_ms==10) 
            count_ms <= 4'd0;
            
     always@(posedge clk or negedge rst)
         if(!rst)
         begin
            is_count <= 1'b0;
            rpin_out <= 1'b0;
            i <= 2'd0;
         end       
         else 
            case(i)
                2'd0:
                    if(h_l_sig) i <= 2'd1;
                    else if(l_h_sig) i<= 2'd2;
                2'd1:
                    if(count_ms == 4'd10)
                    begin
                        is_count <= 1'b0;
                        rpin_out <= 1'b0;
                        i <= 2'd0;
                    end
                    else
                        is_count <= 1'b1;
                2'd2:
                    if(count_ms == 4'd10)
                    begin
                        is_count <= 1'b0;
                        rpin_out <= 1'b1;
                        i <= 2'd0;
                     end
                     else
                     is_count <= 1'b1;
              endcase
           
       assign pin_out = rpin_out;
endmodule


module debounce_module(clk, rst, pin_in, pin_out);
    input clk,rst,pin_in;
    output pin_out;
    
    wire h_l_sig, l_h_sig;
    
    detect_module U1 (
        .clk(clk), .rst(rst), .pin_in(pin_in),
        .h_l_sig(h_l_sig), .l_h_sig(l_h_sig)
    );
    
    delay_module U2 ( 
        .clk(clk), .rst(rst), .pin_out(pin_out),
        .h_l_sig(h_l_sig), .l_h_sig(l_h_sig)
    );
endmodule

