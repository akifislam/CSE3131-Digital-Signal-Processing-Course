clc;
clf;

t = 0:0.0001:1;

%Signal-1 Properties
a1 = 1;
f1 = 10; %Hz


% Signal-1 Plotting
% signal_1 = a1*sin(2*pi*f1*t);
% plot(t,signal_1);

%Signal-2 Properties
a2 = 0.5;
f2 = 20; %Hz

% Signal-2 Plotting
% signal_2 = a2*sin(2*pi*f2*t);
% plot(t,signal_2);


xt = a1*sin(2*pi*f1*t)+ 0.5*sin(2*pi*f2*t + 3*pi/4);
% plot(t,xt);
title('Continous Input Signal')

Fs = 80; %Hz
N = 0:1/Fs:1;

xn = a1*sin(2*pi*f1*N)+ 0.5*sin(2*pi*f2*N + 3*pi/4);
subplot(3,2,[1,2]);
hold on;
plot(t,xt,"b");
plot(N,xn,"o","LineWidth",2);
hold off;
title('Sampled Input Signal');


%DFT
% 8 POINT DFT
%learning to write a function in matlab

tmin = min(t);
tmax = max(t);
N = ceil(tmin/T) : 1 : floor(tmax/T);
[NN,X,res] = dft(N,xn,Fs,64);

subplot(3,2,3);
Xmag = abs(X);
stem(res*NN,Xmag);
title('Magnitude of X');

subplot(3,2,4);
stem(NN, real(X));
title('Real part of X(m)')

img = X * -1j;
subplot(3,2,5);
stem(NN, real(img));
title('Imaginary part of X(m)')

subplot(3,2,6);

% Phase
y = round(real(img), 3);
x = round(real(X), 3);
% y = real(img);
% x = real(X);

phase = atan(y ./ x) * 180/pi;

% phase = angle(X*180/pi)

% subplot(3,2,6);
% stem(NN, phase);
title('Phase of X(m) in degree')

%Signal Reconstruction
disp('Reconstruction');

Xmag = Xmag(1:4);
Xmag = sort(Xmag,'descend');

gotFreq = [];

for i=1:length(Xmag)
    if round(Xmag(i))~=0
        gotFreq = [gotFreq,Xmag(i)]
%     end if
    end
end

subplot(3,2,6);
Inverse_DFT = ifft(X)
plot(NN,Inverse_DFT);
title('Inverse DFT');






