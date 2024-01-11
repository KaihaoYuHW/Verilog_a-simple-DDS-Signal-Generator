`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:17:58 01/10/2024
// Design Name:   dds
// Module Name:   E:/IC_design/Verilog/FPGA_S6/top_dds/sim/tb_dds.v
// Project Name:  top_dds
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: dds
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_dds;

	// Inputs
	reg sys_clk;
	reg sys_rst_n;
	reg [3:0] wave_select;

	// Outputs
	wire [7:0] data_out;

	// Instantiate the Unit Under Test (UUT)
	dds uut (
		.sys_clk(sys_clk), 
		.sys_rst_n(sys_rst_n), 
		.wave_select(wave_select), 
		.data_out(data_out)
	);

	initial begin
		// Initialize Inputs
		sys_clk = 1'b1;
		sys_rst_n <= 1'b0;
		wave_select <= 4'b0000;
		#200;
		sys_rst_n <= 1'b1;
		#10000;
		wave_select <= 4'b0001;
		#8000000;
		wave_select <= 4'b0010;
		#8000000;
		wave_select <= 4'b0100;
		#8000000;
		wave_select <= 4'b1000;
		#8000000;
		wave_select <= 4'b0000;
		#8000000;
	end

	always #10 sys_clk = ~sys_clk;
      
endmodule

