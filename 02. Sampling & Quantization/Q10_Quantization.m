clc;
clf;
%Continuous / Input Signal
t = 0:0.0001:1;
f = 2;
A = 20;
xt = A*sin(2*pi*f*t);

grid on;
title('Continous / Input Analogue Signal')

subplot(3,1,1);
plot(t,xt);
axis([0 t(end) -A-2 A+2])

%Sampling
Fs = 80; %Sampling at 3x of Input Frequency
n = 0:1/Fs:1;
xn = A*sin(2*pi*f*n);
subplot(3,1,2);

hold on;

stem(n,xn,"b--.");
plot(n,xn,"black");
axis([0 n(end) -A-2 A+2])

% Quantization
% Formula : (Amx-Amin)/2^N
no_of_bits = 3;
total_quantized_level = 2^no_of_bits;
A_max = max(xn);
A_min = min(xn);
step_size = (A_max - A_min)/total_quantized_level;
xn
xq = round(xn/step_size)*step_size


subplot(3,1,3);
plot(n,xq,"r");
grid on;
axis([0,t(end),A_min-4,A_max+4])
