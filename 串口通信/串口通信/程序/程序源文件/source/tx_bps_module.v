`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/05/14 22:10:55
// Design Name: 
// Module Name: tx_bps_module
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


module tx_bps_module       //波特率计数模块
(
    CLK, RSTn,
	 Count_Sig, 
	 BPS_CLK
);

    input CLK;
	 input RSTn;
	 input Count_Sig;
	 output BPS_CLK;
	 
	 /***************************/
	 
	 parameter Bps_9600   = 10418;
	 parameter Bps_9600_2   = 5209;
     parameter Bps_115200 = 868;
     reg [13:0]Count_BPS;
	 
	 always @ ( posedge CLK or negedge RSTn )
	    if( !RSTn )
		     Count_BPS <= 14'd0;
		 else if( Count_BPS == Bps_9600 )
		     Count_BPS <= 14'd0;
		 else if( Count_Sig )
		     Count_BPS <= Count_BPS + 1'b1;
		 else
		     Count_BPS <= 14'd0;
			  
	 /********************************/

    assign BPS_CLK = ( Count_BPS == Bps_9600_2 ) ? 1'b1 : 1'b0;

    /*********************************/

endmodule