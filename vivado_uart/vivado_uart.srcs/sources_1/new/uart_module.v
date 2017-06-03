`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/05/15 08:41:14
// Design Name: 
// Module Name: uart_module
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


module uart_module
( 
    CLK, RSTn, SW, KEY,
	RX_Pin_In, TX_Pin_Out, LED
    );
    input CLK, RSTn, RX_Pin_In;
    input KEY;
    input [7:0] SW;
    output TX_Pin_Out;
    output [7:0] LED;
    
    wire RX_Done_Sig;
    wire TX_Done_Sig;
    wire TX_En_Sig;
    wire RX_En_Sig;
    wire [7:0] RX_Data;
    wire dKEY;
    
    reg rTX_En_Sig;
    reg rRX_En_Sig;
    reg [7:0]rRX_Data;
    tx_module U1        //串口发送模块
    (
         .CLK(CLK), .RSTn(RSTn),
         .TX_Data(SW), .TX_En_Sig(TX_En_Sig),
         .TX_Done_Sig(TX_Done_Sig), .TX_Pin_Out(TX_Pin_Out)
    );
    
    rx_module U2          //串口接收模块
    (
        .CLK(CLK), .RSTn(RSTn),
        .RX_Pin_In(RX_Pin_In), .RX_En_Sig(RX_En_Sig),
        .RX_Done_Sig(RX_Done_Sig), .RX_Data(RX_Data)
    );
    
    debounce_module U3
    (
        .clk(CLK), .rst(RSTn), .pin_in(KEY), .pin_out(dKEY)
    );
    
    reg l_h_f1,l_h_f2;
    wire key_l_h;
    always@ (posedge CLK or negedge RSTn)
            if(!RSTn)
            begin
               l_h_f2 <=0;
               l_h_f1 <=0;
            end
            else
            begin
               l_h_f1   <= dKEY;
               l_h_f2   <= l_h_f1;
            end
     assign   key_l_h = l_h_f1 & !l_h_f2;     
     
    always@ (posedge CLK or negedge RSTn)
        if(!RSTn)
           rTX_En_Sig <=0;
        else
        begin
           if(TX_Done_Sig==1) 
             rTX_En_Sig <=0;
           else if(key_l_h==1)
             rTX_En_Sig <=1;
        end
     
        
     always@ (posedge CLK or negedge RSTn)
                if(!RSTn)
                    rRX_Data <=0;
                else
                   if(RX_Done_Sig) 
                     begin  rRX_Data <= RX_Data; rRX_En_Sig<=0; end
                   else
                     rRX_En_Sig<=1;
             
     assign  RX_En_Sig = rRX_En_Sig;
     assign  TX_En_Sig = rTX_En_Sig;
     assign  LED = rRX_Data;
endmodule
