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
%(b)Generation of samples of Lowpass Processes

Rxav=zeros(1,M+1);
Ryav=zeros(1,M+1);
Sxav=zeros(1,M+1);
Syav=zeros(1,M+1);
for i=1:10,
end;
X=rand(1,N)-(1/2);

Y(1)=0;
for n=2:N
Y(n)=0.9*Y(n-1)+X(n);
end;
Rx=Rx_est(X,M);
Ry=Rx_est(Y,M);
Sx=fftshift(abs(fft(Rx)));
Sy=fftshift(abs(fft(Ry)));
Rxav=Rxav+Rx;
Ryav=Ryav+Ry;
Sxav=Sxav+Sx;
Syav=Syav+Sy;
echo off;
echo on;
Rxav=Rxav/10;
Ryav=Ryav/10;
Sxav=Sxav/10;
Syav=Syav/10;
% Take the ensemble average over ten realizations.
% Generate a uniform number sequence on (-112,112).
% Note that Y(n) means Y(n-1).
% autocorrelation of {Xn}
% autocorrelation of {Yn}
% power spectrum of {Xn}
% power spectrum of {Yn}

%(c) Generation of samples of Bandpass Processes
N=1000; % number of samples
for i=1:2:N
end
m=0; sgma=1;
[Xl(i), Xl(i+1)]=gngauss;
[X2(i), X2(i+ 1)]=gngauss;
echo off ;
echo on ;
A=[1 -0.9];
B=1;
Xc=filter(B,A,Xl);
Xs=filter(B,A,X2);
fc=1000/pi;
for i=1 :N
% standard Gaussian input noise processes
% lowpass filter parameters
% carrier frequency
band_pass_process(i)=Xc(i) * cos(2*pi *fc*i)-Xs(i) * sin(2*pi*fc* i);
echo off ;
end
echo on;
% T=l is assumed.
% Determine the autocorrelation and the spectrum of the bandpass process.

M=50;
bpp_autoco=Rx_est(band_pass_process,M);
bpp_spectrum=fftshift(abs(fft(bpp_autocorr)));
% Plotting commands follow.

%GNGAUSS generates two independent Gaussian random variables with meanm and standard
deviation sgma.
function [gsrvl ,gsrv2]=gngauss(m,sgma)
u=rand;
z=sgma*(sqrt(2*log(1/(1-u))));
u=rand;
gsrvl=m+z*cos(2*pi*u);
gsrv2=m+z*sin(2*pi*u);
end