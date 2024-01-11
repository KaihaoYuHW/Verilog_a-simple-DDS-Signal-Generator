clc; 
clear all; 
F1=1; 
Fs=2^12; 
P1=0; 
N=2^12; 
t=[0:1/Fs:(N-1)/Fs]; 
ADC=2^7 - 1;
A=2^7; 

s=A*sin(2*pi*F1*t + pi*P1/180) + ADC;
plot(s); 

fild = fopen('sin_wave_4096x8.coe','wt');

fprintf(fild, '%s\n','MEMORY_INITIALIZATION_RADIX=10;'); 
fprintf(fild, '%s\n','MEMORY_INITIALIZATION_VECTOR='); 
for i = 1:N
    s0(i) = round(s(i)); 
    if s0(i) <0 
        s0(i) = 0
    end
    if i == N
        fprintf(fild, '%d',s0(i)); 
        fprintf(fild, '%s',';'); 
    else
        fprintf(fild, '%d',s0(i)); 
        fprintf(fild, '%s\n',','); 
    end 
end
fclose(fild);