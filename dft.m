function [n, x, res] = dft(n1, x1, fs, N)
res = fs/N
e = exp(1);

n = n1(1:N);
x = x1(1:N);
X = zeros(1, N);
for i= 0:N-1
    for k= 0:N-1
        X(i + 1) = X(i + 1) + x(k + 1)*e^((-1j*2*pi*i*k)/N);
    end
end

x = X;

end