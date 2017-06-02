`timescale 1ns / 1ps
module frequency2binary(
  input siginal,//输入信号管脚
  input CLK,
  output reg sign1,//信号示意
  output reg [20:0]finfre//binary频率输出
  );
  parameter T2MS=100000000;
      reg [35:0]freh;
      reg [35:0]frel;
      reg [35:0]frell;
      reg [35:0]count1;
      reg zero;
      reg clear;
always@(posedge CLK)
      begin
      sign1 <= siginal;
      if(siginal)
      begin
          freh <= freh+1;
          frell <=0;
      end
      else
          begin
          frell <= frell + 1;
          freh <= 0;
          if(frell==25)
          begin
          frell <=0;
          zero <=1;
          end
      end
      if(freh==25&&zero==1)
      begin
          frel <= frel+1;
          zero <=0;
          freh <= 0;
      end
      count1<=count1+1;
      if(count1==T2MS)
      begin
          count1<= 0;
          finfre <= frel;
          clear <= 1;
      end
      if(clear == 1)
      begin
          clear <= 0;
          frel <= 0;
      end
      end
endmodule
