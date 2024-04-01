echo on
N=1000;
M=50;
Rx_av=zeros(1,M+ 1 );
Sx_av=zeros(1,M+ 1);
for j=1:10, % Take the ensemble average over ten realizations
end;
X=rand(1,N)-1/2; % N i.i.d. uniformly distributed random variables
% between -112 and 112.
Rx=Rx_est(X,M); % autocorrelation of the realization
Sx=fftshift(abs(fft(Rx))); % power spectrum of the realization
Rx_av=Rx_av+Rx;
Sx_av=Sx_av+Sx;
echo off ;
% sum of the autocorrelations
% sum of the spectrums
echo on ;
Rx_av=Rx_av/10;
Sx_av=Sx_av/10;
% ensemble average autocorrelation
% ensemble average spectrum
function [Rx]=Rx_est(X,M)
% [Rx]=Rx_est(X,M)
% RX_EST estimates the autocorrelation of the sequence of random
% variables given in X. Only Rx(O), Rx(l), ... , Rx( M) are computed.
% Note that Rx(m) actually means Rx(m-1).
N=length(X);
Rx=zeros(1,M+1);
for rn=1:M+ 1
for n=1:N-rn+1
Rx(m)=Rx(m)+X(n)*X(n+m-1);
end
Rx(m)=Rx(m)/(N-rn+1);
end
end