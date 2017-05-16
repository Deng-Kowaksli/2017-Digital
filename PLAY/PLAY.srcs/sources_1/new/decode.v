`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/03/19 16:22:48
// Design Name: 
// Module Name: decode
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


module decode(
    input CLK,
    input [7:0] in,
    input adin,
    output reg [7:0] show,
    output reg [2:0] out,
    output reg error,
    output reg sign,
    output reg sign1,
    output reg test,
    output reg[11:0] display_out,
    output reg[11:0] display_out2,
    //output reg tx,
    //output reg[2:0] digits,
    input button,
    input siginal
    );
    reg[3:0] dot;
    reg[3:0] dot1;
    reg [2:0] sel=0;
    reg [19:0]count=0;
    parameter T1MS=50000;
    parameter T2MS=100000000;
    reg [6:0]digit[0:9];
    reg [10:0]click;
    reg [3:0]show1;
    reg [3:0]show2;
    reg [3:0]show3;
    reg [3:0]show4;
    reg [3:0]show11;
    reg [3:0]show12;
    reg [3:0]show13;
    reg [3:0]show14;
    reg [15:0]press;
    reg [1:0]lose;
    reg [35:0]freh;
    reg [35:0]frel;
    reg [35:0]frell;
    reg [20:0]finfre;
    reg [35:0]count1;
    reg [20:0]counts;
    reg sigin;
    reg zero;
    reg clear;
    wire clks;
    reg [4:0]sseq;
    reg [9:0]txseq;
    wire [15:0]outdata;
    reg [11:0]voltage;
    parameter addr = 'h11;
    xadc_1 AD1(.vauxp1(adin),.vauxn1(0),.do_out(outdata),.daddr_in(addr),.dclk_in(CLK),.den_in(1));
    always@(*)
    begin
        digit[0] <= 7'b1111110;
        digit[1] <= 7'b0110000;
        digit[2] <= 7'b1101101;
        digit[3] <= 7'b1111001;
        digit[4] <= 7'b0110011;
        digit[5] <= 7'b1011011;
        digit[6] <= 7'b1011111;
        digit[7] <= 7'b1110000;
        digit[8] <= 7'b1111111;
        digit[9] <= 7'b1111011;
        show<=in;
    end
    always@(posedge CLK)
    begin
        case(sel)
            0:display_out<=dot1[0]<<11|4'b0001<<7|digit[show11];
            1:display_out<=dot1[1]<<11|4'b0010<<7|digit[show12];
            2:display_out<=dot1[2]<<11|4'b0100<<7|digit[show13];
            3:display_out<=dot1[3]<<11|4'b1000<<7|digit[show14];
        endcase  
        case(sel)
            0:display_out2<=dot[0]<<11|4'b0001<<7|digit[show1];
            1:display_out2<=dot[1]<<11|4'b0010<<7|digit[show2];
            2:display_out2<=dot[2]<<11|4'b0100<<7|digit[show3];
            3:display_out2<=dot[3]<<11|4'b1000<<7|digit[show4];
        endcase
    end
    always@(posedge CLK)
        begin
            count<=count+1;
            if(count==T1MS)
                begin
                test <= !test;
                count<=0;
                sel<=sel+1;
                if(sel==4)
                   sel<=0;
                end
        end
     always@(posedge CLK)
        begin
            //sign <= button;
            if(button==1)
            begin
            sign <= 1;
            press <= press+1;
            end
            else
            begin
            sign <= 0;
            press <= 0;
            lose <=1;
            end
            if(press==10000&&lose==1)
            begin
                lose <=0;
                press <= 0;
                click <= click+1;
                /*show4 <= click/1000;
                show3 <= (click-click/1000*1000)/100;
                show2 <= (click-click/100*100)/10;
                show1 <= click-click/10*10;*/
            end
            voltage = outdata[15:4];
            show4 <= voltage/1000;
            show3 <= (voltage-voltage/1000*1000)/100;
            show2 <= (voltage-voltage/100*100)/10;
            show1 <= voltage-voltage/10*10;
            
        end
    always@(posedge CLK)
    begin
    sign1 <= siginal;
    if(siginal)
    begin
        freh <= freh+1;
        frell <=0;
        //finfre <= freh;
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
        //finfre <= frel;
        clear <= 1;
        if(frel>=1_000_000)
        begin
        show14 <= frel/1000000;
        show13 <= (frel-frel/1000000*1000000)/100000;
        show12 <= (frel-frel/100000*100000)/10000;
        show11 <= (frel-frel/10000*10000)/1000;
        dot1 <= 4'b1000;
        out <= 3'b100;
        end
        else if(frel>=100_000)
        begin
        show14 <= frel/100000;
        show13 <= (frel-frel/100000*100000)/10000;
        show12 <= (frel-frel/10000*10000)/1000;
        if(((frel-frel/100*100)/10)>4)
        show11 <= (frel-frel/1000*1000)/100+1;
        else
        show11 <= (frel-frel/1000*1000)/100;
        dot1 <= 4'b0010;
        out <= 3'b010;
        end
        else if(frel>=10_000)
        begin
        show14 <= frel/10000;
        show13 <= (frel-frel/10000*10000)/1000;
        show12 <= (frel-frel/1000*1000)/100;
        if((frel-frel/10*10)>4)
        show11 <= (frel-frel/100*100)/10+1;
        else
        show11 <= (frel-frel/100*100)/10;
        dot1 <= 4'b0100;
        out <= 3'b010;
        end
        else
        begin
        show14 <= frel/1000;
        show13 <= (frel-frel/1000*1000)/100;
        show12 <= (frel-frel/100*100)/10;
        show11 <= frel-frel/10*10;
        dot1 <= 4'b0000;
        out <= 3'b001;
        end
    end
    if(clear == 1)
    begin
        clear <= 0;
        frel <= 0;
    end
    end
endmodule
