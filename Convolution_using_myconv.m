% The point I make mistakes everytime : 
% Do not put 'InputSignal' where required 'rawInputSignal'

clc;

close all;

raw_inputSignal = [1,2,3,4,5,6];
raw_impulseSignal = [0,0,0,0,1,1,1,1,1,1,1,0,0,0,0,0];

y = myconv(raw_impulseSignal,raw_inputSignal);

subplot(3,2,1);
plot(raw_inputSignal);
title('Input Signal');
grid on;

subplot(3,2,2)
plot(raw_impulseSignal);
title('Impulse Signal');
grid on;

subplot(3,2,[3,4]);
stem(y);
grid on;

subplot(3,2,[5,6]);
func_conv = conv(raw_inputSignal,raw_impulseSignal);
stem(func_conv);



   
