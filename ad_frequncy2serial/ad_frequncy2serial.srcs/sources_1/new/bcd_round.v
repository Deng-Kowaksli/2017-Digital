`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

// Engineer: ������ 
// Module Name: bcd_4round
// Description: ��λbcdת4λbcd�������������ʾ���Զ��������������С����λ�á�

//////////////////////////////////////////////////////////////////////////////////


module bcd_4round(
    input [27:0] bcd_in,//��λbcd����
    output reg [15:0] bcd_out,//4λbcd���
    output reg [3:0] dots//4λС����λ�����
    );
    always@(*)
    begin
        if(bcd_in[27:16] == 0)
        begin
            bcd_out <= bcd_in[15:0];
            dots <= 'b0000;
        end
        else if(bcd_in[27:20] == 0)
        begin
            bcd_out[15:4] <= bcd_in[19:8];
            dots <= 'b0100;
            if(bcd_in[3:0]>=5)
                bcd_out[3:0] <= bcd_in[7:4]+1;
            else
                bcd_out[3:0] <= bcd_in[7:4];
        end
        else if(bcd_in[27:24] == 0)
            begin
                bcd_out[15:4] <= bcd_in[23:12];
                dots <= 'b0010;
                if(bcd_in[7:4]>=5)
                    bcd_out[3:0] <= bcd_in[11:8]+1;
                else
                    bcd_out[3:0] <= bcd_in[11:8];
            end
        else
            begin
                bcd_out[15:4] <= bcd_in[27:16];
                dots <= 'b1000;
                if(bcd_in[11:8]>=5)
                    bcd_out[3:0] <= bcd_in[15:12]+1;
                else
                    bcd_out[3:0] <= bcd_in[15:12];
             end
    end
endmodule
