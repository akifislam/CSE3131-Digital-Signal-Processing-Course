function y = myconv(raw_inputSignal, raw_impulseSignal)

    convolution_size = length(raw_inputSignal)+length(raw_impulseSignal)-1;


    inputSignal = [raw_inputSignal,zeros(1,length(raw_impulseSignal))];
    impulseSignal = [raw_impulseSignal, zeros(1,length(raw_inputSignal))];

    y = zeros(1,convolution_size);

    for n = 1:convolution_size
        for k=1:n
            y(n) = y(n) + (inputSignal(k) * impulseSignal(n-k+1));
        end
    end

   
    
    
