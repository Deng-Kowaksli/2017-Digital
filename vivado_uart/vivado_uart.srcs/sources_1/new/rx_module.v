`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/05/14 21:23:49
// Design Name: 
// Module Name: rx_module
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


module rx_module             //串口接收模块
(
    CLK, RSTn,
    RX_Pin_In, RX_En_Sig,
	RX_Done_Sig, RX_Data
);

     input CLK;
	 input RSTn;
	 
	 input RX_Pin_In;
	 input RX_En_Sig;
	 
	 output [7:0]RX_Data;
	 output RX_Done_Sig;
	 
	 
	 /**********************************/
	 
	 wire H_L_Sig;
	 wire BPS_CLK;
	 wire Count_Sig; 
	 
	 rx_detect_module U1
	 (
	     .CLK( CLK ),
		  .RSTn( RSTn ),
		  .RX_Pin_In( RX_Pin_In ),   
		  .H_L_Sig( H_L_Sig )         
	 );
	 
	 /**********************************/
	 
	 rx_bps_module U2
	 (
	     .CLK( CLK ),
		  .RSTn( RSTn ),
		  .Count_Sig( Count_Sig ),   
		  .BPS_CLK( BPS_CLK )        
	 );
	 
	 /**********************************/
	 
	 rx_control_module U3
	 (
	     .CLK( CLK ),
		  .RSTn( RSTn ),
		  
		  .H_L_Sig( H_L_Sig ),      
		  .RX_En_Sig( RX_En_Sig ), 
		  .RX_Pin_In( RX_Pin_In ),  
		  .BPS_CLK( BPS_CLK ),      
		  
		  .Count_Sig( Count_Sig ),   
		  .RX_Data( RX_Data ),       
		  .RX_Done_Sig( RX_Done_Sig ) 
		  
	 );
	 
	 /************************************/
	 

endmodule

