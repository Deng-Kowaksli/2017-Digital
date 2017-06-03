`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/05/14 21:36:15
// Design Name: 
// Module Name: rx_bps_module
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


module rx_bps_module
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
	 parameter Bps_9600    = 10418;
	 parameter Bps_9600_2    = 5209;
	 parameter Bps_115200  = 868;
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


/******************µçÆ½¼ì²âÄ£¿é***********************/
module rx_detect_module 
(
     CLK, RSTn,
	 RX_Pin_In,
	 H_L_Sig
);
     input CLK;
	 input RSTn;
	 input RX_Pin_In;
	 output H_L_Sig;
	 
	 /******************************/
	 
	 reg H_L_F1;
	 reg H_L_F2;
	 
	 always @ ( posedge CLK or negedge RSTn )
	     if( !RSTn )
		      begin
				    H_L_F1 <= 1'b1;
				    H_L_F2 <= 1'b1;
				end
		  else
		      begin
				    H_L_F1 <= RX_Pin_In;
					H_L_F2 <= H_L_F1;
				end
					
	
	assign H_L_Sig = H_L_F2 & !H_L_F1;
	
	
endmodule
