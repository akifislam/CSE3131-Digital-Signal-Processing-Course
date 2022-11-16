% Correlation from Convolution using myconv function

close all;

fs1 = 64;
fs2 = 64;

N1 = 0:1/fs1:1;
N2 = 0:1/fs2:1;

firstSignal = sin(2*pi*5*N1);
secondSignal = flip(sin(2*pi*5*N2));

subplot(3,2,1);
plot(firstSignal);

subplot(3,2,2);
plot(secondSignal);

% Correlation from Convolution
y = myconv(firstSignal,secondSignal);
lag = -(length(secondSignal)-1):1:(length(secondSignal)-1);

subplot(3,2,[3,4]);
plot(lag,y);

%Function Generated
subplot(3,2,[5,6]);
[gen, lagg] = xcorr(firstSignal, secondSignal);
plot(lagg,gen);
