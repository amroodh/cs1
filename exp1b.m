N = 1000;
M = 50;
M_arr = [1:51];
Rxav = zeros(1,M+1);
Ryav = zeros(1,M+1);
Sxav = zeros(1,M+1);
Syav = zeros(1,M+1);

for i=1:10
end

X = rand(1,N) - (1/2);
Y(1) = 0;

for n=2:N
    Y(n) = 0.9*Y(n-1) + X(n);
end;

Rx = Rx_est(X,M);
Ry = Rx_est(Y,M);
Sx = fftshift(abs(fft(Rx)));
Sy = fftshift(abs(fft(Ry)));
Rxav = Rxav + Rx;
Ryav = Ryav + Ry;
Sxav = Sxav + Sx;
Syav = Syav + Sy;

echo off;

echo on;
Rxav = Rxav/10;
Ryav = Ryav/10;
Sxav = Sxav/10;
Syav = Syav/10;

plot(linspace(-5,5,51), Syav)
function[Rx] = Rx_est(X,M)

N = 1000;
Rx = zeros(1,M+1);
for m=1:M+1
    for n=1:N-m+1
        Rx(m) = Rx(m) + X(n)*X(n+m-1);
    end
    Rx(m) = Rx(m)/(N-m+1);
end
end