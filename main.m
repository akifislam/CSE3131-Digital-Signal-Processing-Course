clc;
clf;

tmin = 0;
tmax = 1;
t = tmin:0.0001:tmax;
length(t)
f1 = 10;
f2 = 20;

a1 = 1;
a2 = 0.5;

x = a1*sin(2*pi*f1*t) + a2*sin(2*pi*f2*t + 3*pi/4);

subplot(3,1,1);
plot(t, x);

% sampling
fs = 80;

T = 1/fs;
n = ceil(tmin/T) : 1 : floor(tmax/T);

xs = a1*sin(2*pi*f1* n*T) + a2*sin(2*pi*f2* n*T +3*pi/4);
length(xs)
hold on;
plot(n*T, xs, '.r');
title('Original Signal with sampled points')
hold off;

[N, X, res] = dft(n, xs, fs, 8);

Xmag = abs(X);
subplot(3,2,3);
stem(N*res, Xmag);
title('Magnitude of X(m).')

img = X * -1j;
subplot(3,2,5);
stem(N, real(img));
title('Imaginary part of X(m)')

subplot(3,2,4);
stem(N, real(X));
title('Real part of X(m)')

% Phase
y = round(real(img), 3);
x = round(real(X), 3);
% y = real(img);
% x = real(X);

phase = atan(y ./ x) * 180/pi;

% phase = angle(X*180/pi)

subplot(3,2,6);
stem(N, phase);
title('Phase of X(m) in degree')

