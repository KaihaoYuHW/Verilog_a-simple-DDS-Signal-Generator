# a simple DDS Signal Generator
## project structure
- "doc": the information for each module (see .md)

- "rtl": the implementation of all modules (see .v)

- "sim": all testbenches of each module

***
## Principle

DDS is Direct Digital Synthesizer, also called signal generator. It is used to generate various signal waveforms such as sin, sawtooth, square waves, and signals of different frequencies.

![dds_architecture](https://github.com/KaihaoYuHW/Verilog_a-simple-DDS-Signal-Generator/blob/main/doc/dds_architecture.png)

- CLK: system clock
- F_WORD: It is an integer and determines the output signal's frequency. The larger value of output signal frequency is, the smaller value of lower output signal frequency is.
- P_WORD: It is an integer controlling the phase offset of the output signal. 
- output: frequency is fOUT

## Experiment Goals

Design a simple DDS signal generator using an FPGA and an externally high-speed AD/DA (Analog-to-Digital/Digital-to-Analog) converter. The system use button to select 4 kinds of waveform (sine wave, square wave, triangle wave, and sawtooth wave). In addition, the generator should be able to adjust frequency and phase.

## Design

The design of the DDS signal generator involves four main components. The D/A converter is handled by an externally high-speed AD/DA board. The remaining three components, namely the phase accumulator, phase modulator, and waveform data table ROM, are managed by the FPGA. 

![top_dds](https://github.com/KaihaoYuHW/Verilog_a-simple-DDS-Signal-Generator/blob/main/doc/top_dds.png)

- Inside the key control module, four key filter modules are instantiated to get the four steady input key signals. 
- The filtered signals from the four keys are then combined as a waveform selection signal, which is an input of DDS module. 
- In DDS module, a ROM IP core is instantiated, storing signals of sin wave, square wave, triangle wave, and sawtooth wave in sequential order. Based on the input waveform selection signal, the corresponding signal waveform is read from the ROM, and the samples of waveform's amplitude is output. 
- This output is then sent to the AD/DA board. The board generates an analog signal corresponding to the input digital signal in order to represent the selected waveform.
- Adjustments to the output signal's frequency and phase can be achieved by changing parameters in the DDS module.

## implementation

![dds_waveform1](https://github.com/KaihaoYuHW/Verilog_a-simple-DDS-Signal-Generator/blob/main/doc/dds_waveform1.png)
