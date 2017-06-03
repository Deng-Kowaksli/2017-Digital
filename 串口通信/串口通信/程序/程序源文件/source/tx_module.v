`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/05/14 22:00:36
// Design Name: 
// Module Name: tx_module
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

module tx_module
(
     CLK, RSTn,
	 TX_Data, TX_En_Sig,
	 TX_Done_Sig, TX_Pin_Out
);
 
      input CLK;
	  input RSTn;
	  input [7:0]TX_Data;
	  input TX_En_Sig;
	  output TX_Done_Sig;
	  output TX_Pin_Out;
	  
	  
	  /********************************/
	  
	  wire BPS_CLK;
	  
	  tx_bps_module U1
	  (
	       .CLK( CLK ),
			.RSTn( RSTn ),
			.Count_Sig( TX_En_Sig ),    
			.BPS_CLK( BPS_CLK )         
	  );
	  
	  /*********************************/
	  
	  tx_control_module U2
	  (
	      .CLK( CLK ),
			.RSTn( RSTn ),
			.TX_En_Sig( TX_En_Sig ),    
			.TX_Data( TX_Data ),        
			.BPS_CLK( BPS_CLK ),        
			.TX_Done_Sig( TX_Done_Sig ),  
			.TX_Pin_Out( TX_Pin_Out )     
	  );
	  
	  /***********************************/

endmodule
