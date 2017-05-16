`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/03/20 09:47:40
// Design Name: 
// Module Name: seg_display
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


//**********   get_number   ************//
module get_number(clk, rst, number_data, one_data, ten_data, hundred_data, thousand_data);

input   clk, rst;
input   [15:0]  number_data;
output  [3:0]   one_data, ten_data, hundred_data, thousand_data;

reg [31:0] rone_data, rten_data, rhundred_data, rthousand_data;

always@(posedge clk or negedge rst)
    if(!rst)
    begin
       rone_data     <= 32'd0;
       rten_data     <= 32'd0; 
       rhundred_data <= 32'd0;
       rthousand_data<= 32'd0;
    end
    else
    begin
       rone_data      <= number_data%10;
       rthousand_data <= number_data/1000;
       rhundred_data  <= number_data%1000/100;
       rten_data      <= number_data%100/10;
     end
assign   one_data     = rone_data[3:0];
assign   ten_data     = rten_data[3:0];
assign   hundred_data = rhundred_data[3:0];
assign   thousand_data= rthousand_data[3:0];
     
endmodule


//**********   transform_code   ************//
module transform_code(clk, rst, one_data, ten_data, hundred_data, thousand_data,
                      one_seg_data, ten_seg_data, hundred_seg_data, thousand_seg_data);
input  clk, rst;
input  [3:0] one_data, ten_data, hundred_data, thousand_data;
output [7:0] one_seg_data, ten_seg_data, hundred_seg_data, thousand_seg_data;
reg [7:0]    rone_seg_data, rten_seg_data, rhundred_seg_data, rthousand_seg_data;
parameter  _0 = 8'b00111111, _1 = 8'b00000110, _2 = 8'b01011011, 
	         _3 = 8'b01001111, _4 = 8'b01100110, _5 = 8'b01101101, 
		     _6 = 8'b01111101, _7 = 8'b00000111, _8 = 8'b01111111,
		     _9 = 8'b01101111;
		   
always@(posedge clk or negedge rst)
    if(!rst)
    begin
        rone_seg_data     <= 8'b0000_0000;
    end
    else
        case(one_data)
            4'd0 : rone_seg_data    <= _0;
            4'd1 : rone_seg_data    <= _1;
            4'd2 : rone_seg_data    <= _2;
            4'd3 : rone_seg_data    <= _3;
            4'd4 : rone_seg_data    <= _4;
            4'd5 : rone_seg_data    <= _5;
            4'd6 : rone_seg_data    <= _6;
            4'd7 : rone_seg_data    <= _7;
            4'd8 : rone_seg_data    <= _8;
            4'd9 : rone_seg_data    <= _9;
        endcase
      
always@(posedge clk or negedge rst)
            if(!rst)
            begin
                rten_seg_data     <= 8'b0000_0000;
            end
            else
                case(ten_data)
                    4'd0 : rten_seg_data    <= _0;
                    4'd1 : rten_seg_data    <= _1;
                    4'd2 : rten_seg_data    <= _2;
                    4'd3 : rten_seg_data    <= _3;
                    4'd4 : rten_seg_data    <= _4;
                    4'd5 : rten_seg_data    <= _5;
                    4'd6 : rten_seg_data    <= _6;
                    4'd7 : rten_seg_data    <= _7;
                    4'd8 : rten_seg_data    <= _8;
                    4'd9 : rten_seg_data    <= _9;
                endcase
always@(posedge clk or negedge rst)
                    if(!rst)
                    begin
                        rhundred_seg_data     <= 8'b0000_0000;
                    end
                    else
                        case(hundred_data)
                            4'd0 : rhundred_seg_data    <= _0;
                            4'd1 : rhundred_seg_data    <= _1;
                            4'd2 : rhundred_seg_data    <= _2;
                            4'd3 : rhundred_seg_data    <= _3;
                            4'd4 : rhundred_seg_data    <= _4;
                            4'd5 : rhundred_seg_data    <= _5;
                            4'd6 : rhundred_seg_data    <= _6;
                            4'd7 : rhundred_seg_data    <= _7;
                            4'd8 : rhundred_seg_data    <= _8;
                            4'd9 : rhundred_seg_data    <= _9;
                        endcase
                        
always@(posedge clk or negedge rst)
                            if(!rst)
                            begin
                                rthousand_seg_data     <= 8'b0000_0000;
                            end
                            else
                                case(thousand_data)
                                    4'd0 : rthousand_seg_data    <= _0;
                                    4'd1 : rthousand_seg_data    <= _1;
                                    4'd2 : rthousand_seg_data    <= _2;
                                    4'd3 : rthousand_seg_data    <= _3;
                                    4'd4 : rthousand_seg_data    <= _4;
                                    4'd5 : rthousand_seg_data    <= _5;
                                    4'd6 : rthousand_seg_data    <= _6;
                                    4'd7 : rthousand_seg_data    <= _7;
                                    4'd8 : rthousand_seg_data    <= _8;
                                    4'd9 : rthousand_seg_data    <= _9;
                                endcase
                                
assign  one_seg_data= rone_seg_data;
assign  ten_seg_data= rten_seg_data;
assign  hundred_seg_data= rhundred_seg_data;
assign  thousand_seg_data= rthousand_seg_data;
            
endmodule

//**********   transform_code   ************//
module smg_scan(clk, rst,one_seg_data, ten_seg_data, hundred_seg_data, thousand_seg_data,
                row_scan_sig, column_scan_sig);
             
input clk,rst;
input [7:0] one_seg_data, ten_seg_data, hundred_seg_data, thousand_seg_data;
output [7:0] row_scan_sig;
output [3:0] column_scan_sig;
reg [19:0] count;
reg [2:0] count_column;
reg [7:0] rrow_scan_sig;
reg [3:0] rcolumn_scan_sig;
parameter t_5ms = 20'd99_999;
//parameter t_5ms = 5;
always@(posedge clk or negedge rst)
    if(!rst)
    begin
        count<=0;
    end
    else if(count==t_5ms)
        count<=0;
    else
        count<= count + 1;
    
always@(posedge clk or negedge rst) 
      if(!rst)
      begin
       count_column<=0;
      end
      else if(count_column==4)
      begin
        count_column<=0;
      end
      else if(count==t_5ms)
        count_column <= count_column+1;
        
always@(posedge clk or negedge rst)    
     if(!rst)
     begin
      rrow_scan_sig<=0;
      rcolumn_scan_sig<=0;
     end
     else if(count==t_5ms)
       case(count_column)
            3'd0: begin
                     rcolumn_scan_sig <= 4'b0001;
                     rrow_scan_sig<=one_seg_data;
                  end
            3'd1: begin
                     rcolumn_scan_sig<=4'b0010;
                     rrow_scan_sig<=ten_seg_data;                 
                  end
            3'd2: begin
                     rcolumn_scan_sig<=4'b0100;                
                     rrow_scan_sig<=hundred_seg_data;                 
                  end
            3'd3: begin
                    rcolumn_scan_sig<=4'b1000;
                     rrow_scan_sig<=thousand_seg_data;                 
                  end
         endcase
assign column_scan_sig= rcolumn_scan_sig;
assign row_scan_sig =rrow_scan_sig;
endmodule                     