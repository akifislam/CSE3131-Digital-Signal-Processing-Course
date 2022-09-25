close all;

% A 10Hz Input Signal Sampled at 500Hz
Fs = 500;
f = 10;
n = 0:1/Fs:1;
x = sin(2*pi*f*n);

subplot(3,2,1);
plot(n,x);
title('Input Signal')

%Adding Noise with the Signal
subplot(3,2,2);
noise = rand(1,length(x));
y = x +noise;
plot(n,y);
title('Signal with Noise');

% FFT
L = length(y);
NFFT = 2^nextpow2(L);
y_fft = abs(fft(y,NFFT))

%Creating Frequency Axis
freq = Fs/2*linspace(0,1,NFFT/2+1);

subplot(3,2,[3,4]);
plot(freq,y_fft(1:NFFT/2+1));
title('FFT of Noisy Signal');

% Filter | Bandpass 8 to 12 Hz
o = 5; %order
wn = [8 12]*2/Fs;% cutoff freq 8 & 12 Hz, normalized % frequency by multiplying  2/Fs
[b,a] = butter(o,wn,'bandpass');

[h,w] = freqz(b,a,1024,Fs);
subplot(3,2,5);
plot(w,20*log10(abs(h)));
grid on;

subplot(3,2,6);

%Filtering
y = filter(b,a,y);
plot(n,y);
