module dds (
    input wire sys_clk,
    input wire sys_rst_n,
    input wire [3:0] wave_select,
    output wire [7:0] data_out
);
    parameter sin_wave = 4'b0001,   // sin wave
        squ_wave = 4'b0010,         // square wave
        tri_wave = 4'b0100,         // triangle wave
        saw_wave = 4'b1000;         // sawtooth wave
    parameter FREQ_CTRL = 32'd42949,
        PHASE_CTRL = 12'd1024;

    reg [31:0] fre_add;
    reg [11:0] rom_addr_reg;
    reg [13:0] rom_addr;

    // fre_add: phase accumulator
    always @(posedge sys_clk or negedge sys_rst_n) begin
        if (sys_rst_n == 1'b0)
            fre_add <= 32'd0;
        else 
            fre_add <= fre_add + FREQ_CTRL;
    end

    // rom_addr_reg: phase mudulator
    // rom_addr: read address of ROM
    always @(posedge sys_clk or negedge sys_rst_n) begin
        if (sys_rst_n == 1'b0)
            begin
                rom_addr_reg <= 12'd0;
                rom_addr <= 14'd0;
            end
        else
            case (wave_select)
                sin_wave: 
                    begin
                        rom_addr_reg <= fre_add[31:20] + PHASE_CTRL;
                        rom_addr <= rom_addr_reg;
                    end
                squ_wave:
                    begin
                        rom_addr_reg <= fre_add[31:20] + PHASE_CTRL;
                        rom_addr <= rom_addr_reg + 14'd4096;
                    end
                tri_wave:
                    begin
                        rom_addr_reg <= fre_add[31:20] + PHASE_CTRL;
                        rom_addr <= rom_addr_reg + 14'd8192;
                    end
                saw_wave:
                    begin
                        rom_addr_reg <= fre_add[31:20] + PHASE_CTRL;
                        rom_addr <= rom_addr_reg + 14'd12288;
                    end
                default: 
                    begin
                        rom_addr_reg <= fre_add[31:20] + PHASE_CTRL;
                        rom_addr <= rom_addr_reg;
                    end
            endcase
    end

    rom_16384x8 rom_16384x8_inst (
        .clka(sys_clk),
        .addra(rom_addr),
        .douta(data_out)
    );

endmodule