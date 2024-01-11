`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:31:46 10/27/2022 
// Design Name: 
// Module Name:    key_filter 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module key_filter#(
        parameter CNT_max = 20'd99_9999
    )
    (
        input wire sys_clk,
        input wire sys_rst_n, 
        input wire key_in,
        output reg key_flag
    ); 

    reg [19:0] cnt_20ms; 

    always @(posedge sys_clk or negedge sys_rst_n) begin
        if (sys_rst_n == 1'b0)
            cnt_20ms <= 20'b0;
        else if (key_in == 1'b1)
            cnt_20ms <= 20'b0; 
        else if (cnt_20ms == CNT_max && key_in == 1'b0)
            cnt_20ms <= cnt_20ms;
        else
            cnt_20ms <= cnt_20ms + 1'b1;
    end

    always @(posedge sys_clk or negedge sys_rst_n) begin
        if (sys_rst_n == 1'b0)
            key_flag <= 1'b0; 
        else if (cnt_20ms == CNT_max - 1'b1) 
            key_flag <= 1'b1;
        else
            key_flag <= 1'b0;  
    end


endmodule
