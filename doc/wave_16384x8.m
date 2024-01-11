clc;
clear all; 
F1=1; 
Fs=2^12; 
P1=0; 
N=2^12; 
t=[0:1/Fs:(N-1)/Fs]; 
ADC=2^7 - 1; 
A=2^7; 
s1=A*sin(2*pi*F1*t + pi*P1/180) + ADC; 
s2=A*square(2*pi*F1*t + pi*P1/180) + ADC; 
s3=A*sawtooth(2*pi*F1*t + pi*P1/180,0.5) + ADC; 
s4=A*sawtooth(2*pi*F1*t + pi*P1/180) + ADC; 

fild = fopen('wave_16384x8.coe','wt');

fprintf(fild, '%s\n','MEMORY_INITIALIZATION_RADIX=10;'); 
fprintf(fild, '%s\n','MEMORY_INITIALIZATION_VECTOR=');
for j = 1:4
    for i = 1:N
        if j == 1
            s0(i) = round(s1(i)); 
        end

        if j == 2 
            s0(i) = round(s2(i)); 
        end
 
        if j == 3 
            s0(i) = round(s3(i)); 
        end
 
        if j == 4 
            s0(i) = round(s4(i)); 
        end
 
        if s0(i) <0 
            s0(i) = 0
        end
 
        if j == 4 && i == N
            fprintf(fild, '%d',s0(i)); 
            fprintf(fild, '%s',';'); 
        else
            fprintf(fild, '%d',s0(i)); 
            fprintf(fild, '%s\n',','); 
        end
    end
end
fclose(fild);