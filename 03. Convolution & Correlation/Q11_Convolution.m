clc; 
close all;
clf;

%Input Signal
raw_inputSignal=[1,2,1,1,3,1,0,2,4,1,1,2,1,1,1,1,2,3,1,1];
raw_impulseSignal = [1,1,1,1,0,1,0,1,0,0,2,1,1];

%Input Size
raw_input_len = length(raw_inputSignal);
raw_impulse_len = length(raw_impulseSignal);


convolution_size = raw_input_len + raw_impulse_len - 1;

%Making the length of input & impluse signal same
inputSignal = [raw_inputSignal, zeros(1, raw_impulse_len)];
impulseSignal = [raw_impulseSignal, zeros(1, raw_input_len)];

%Initialize Output Signal
outputSignal = zeros(1, convolution_size);

% Convolution operations 
for i = 1 : convolution_size
    for k = 1 : i
        outputSignal(i) = outputSignal(i) + (inputSignal(k) * impulseSignal(i - k + 1));
    end
end

% function generated convolution
fun_gen_outputSignal = conv(raw_inputSignal, raw_impulseSignal);


% Plot
subplot(3,2,1);
plot(raw_inputSignal);
title('Input Signal');
grid on;

subplot(3,2,2);
plot(raw_impulseSignal);
title('Impulse Signal');
grid on;

subplot(3,2,[3,4]);
plot(outputSignal);
% plot(outputSignal, LineWidth=1);
title('Convolution Output Signal');
grid on;

subplot(3,2,[5,6]);
plot(fun_gen_outputSignal);
% plot(outputSignal2, LineWidth=1);
title('Convolution Output Signal with Built-in Function');
grid on;




