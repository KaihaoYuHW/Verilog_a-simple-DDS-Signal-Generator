# dds

## module diagram

![dds_module](https://github.com/KaihaoYuHW/Verilog_a-simple-DDS-Signal-Generator/blob/main/doc/dds_module.png)

## signals

|     name     | width(bit) |   type   |                         description                          |
| :----------: | :--------: | :------: | :----------------------------------------------------------: |
|   sys_clk    |     1      |  input   |                    system clock of 50Mhz                     |
|  sys_rst_n   |     1      |  input   |                            reset                             |
| wave_select  |     4      |  input   | default = 4'b0000; sin wave = 4'b0001; square wave = 4'b0010; triangle wave = 4'b0100; sawtooth wave = 4'b1000 |
|   data_out   |     8      |  output  |               samples of 4 waves stored in ROM               |
|   fre_add    |     32     | internal |               the output of phase Accumulator                |
| rom_addr_reg |     12     | internal |                the output of phase Modulator                 |
|   rom_addr   |     14     | internal |                       rom_addr = addra                       |
|     clka     |     1      | internal |                        clka = sys_clk                        |
|    douta     |     8      | internal |                       douta = data_out                       |

## waveform

![dds_waveform1](https://github.com/KaihaoYuHW/Verilog_a-simple-DDS-Signal-Generator/blob/main/doc/dds_waveform1.png)

![dds_waveform2](https://github.com/KaihaoYuHW/Verilog_a-simple-DDS-Signal-Generator/blob/main/doc/dds_waveform2.png)
