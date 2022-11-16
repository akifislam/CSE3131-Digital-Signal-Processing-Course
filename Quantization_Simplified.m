close all;

t = 0:0.001:1;

f = 10;
xt = sin(2*pi*f*t);

subplot(3,1,1);
plot(t,xt);
title(['Original Signal  ' num2str(f) '  Hz']);
grid on;

Fs = 60;
N = 0:1/Fs:1;
xn = sin(2*pi*f*N);
subplot(3,1,2);
plot(N,xn,"r--o");
title(['Sampled Signal at Fs =   ' num2str(Fs) '  Hz']);
grid on;

no_of_bits = 2;
total_level = 2*no_of_bits;
step_size = (max(xn) - min(xn))/total_level;

xq = (round(xn/step_size))*step_size;

subplot(3,1,3);
plot(N,xq,'black');
title(['Quantized Signal at bits :' num2str(no_of_bits)]);
grid on;
