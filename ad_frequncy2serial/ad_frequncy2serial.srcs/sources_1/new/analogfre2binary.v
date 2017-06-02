`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

// Engineer: 邓剡梁
// Create Date: 2017/06/02 22:38:46
// Module Name: analogfre2binary
// Description: 模拟频率计，输入ad采集的电平值，输出整型后的方波和模拟信号的频率值。
// Waring: 测量范围0-1v。

//////////////////////////////////////////////////////////////////////////////////


module analogfre2binary(
  input [11:0]siginal,//ad输出数据输入
  input CLK,
  output reg sign1,//整形后输出
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
      if(siginal<500)
      begin
          sign1 <= 0;
          freh <= freh+1;
          frell <=0;
      end
      else
          begin
          sign1 <= 1;
          frell <= frell + 1;
          freh <= 0;
          if(frell==50)
          begin
          frell <=0;
          zero <=1;
          end
      end
      if(freh==50&&zero==1)
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
