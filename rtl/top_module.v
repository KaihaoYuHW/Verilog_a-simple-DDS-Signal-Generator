module top_module (
    input wire sys_clk,
    input wire sys_rst_n,
    input wire [3:0] key,
    output wire [7:0] dac_data,
    output wire dac_clk
);

    wire [3:0] wave_select;

    // dac_clk is the clock for DAC
    assign dac_clk = ~sys_clk;
    
    key_control key_control_inst (
        .sys_clk(sys_clk),
        .sys_rst_n(sys_rst_n),
        .key(key),
        .wave_select(wave_select)
    );

    dds dds_inst (
        .sys_clk(sys_clk),
        .sys_rst_n(sys_rst_n),
        .wave_select(wave_select),
        .data_out(dac_data)
    );
    
endmodule