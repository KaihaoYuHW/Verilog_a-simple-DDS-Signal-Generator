# key_control

## module diagram

![key_control_module](https://github.com/KaihaoYuHW/Verilog_a-simple-DDS-Signal-Generator/blob/main/doc/key_control_module.png)

## signals

|    name     | width(bit) |   type   |                         description                          |
| :---------: | :--------: | :------: | :----------------------------------------------------------: |
|   sys_clk   |     1      |  input   |                    system clock of 50Mhz                     |
|  sys_rst_n  |     1      |  input   |                            reset                             |
|     key     |     4      |  input   |      select wave. Every time can only press one button       |
| wave_select |     4      |  output  | default = 4'b0000; sin wave = 4'b0001; square wave = 4'b0010; triangle wave = 4'b0100; sawtooth wave = 4'b1000 |
|   key_in    |     1      | internal | key_filter_inst0: key_in = key[0]; key_filter_inst1: key_in = key[1]; key_filter_inst2: key_in = key[2]; key_filter_inst3: key_in = key[3]; |
|    key0     |     1      | internal | Flag signal shows that man has already pressed key[0]. When key0=1, key[0] is steady. |
|    key1     |     1      | internal | Flag signal shows that man has already pressed key[1]. When key1=1, key[1] is steady. |
|    key2     |     1      | internal | Flag signal shows that man has already pressed key[2]. When key2=1, key[2] is steady. |
|    key3     |     1      | internal | Flag signal shows that man has already pressed key[3]. When key3=1, key[3] is steady. |

