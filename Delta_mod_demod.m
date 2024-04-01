clc
close all
clear all
a=2;%amplitude
t=0:2*pi/50:2*pi;%0 to 2pi with equal interval 2pi/50
x=a*sin(t);
l=length(x);
plot(x,'r')
delta=0.2;
hold on
xn =0;
for i=1:l
    if x(i)>xn(i)
        d(i)=1;
        xn(i+1)= xn(i) +delta;%move up by delta
    else
        d(i)=0;
        xn(i+1)=xn(i)-delta;%move down by delta
    end
end
stairs(xn)% plot it in the form of stairs
hold on
for i=1:d
if d(i)>xn(i)
    d(i)=0;
    xn(i+1)=xn(i)-delta;
else
    d(i)=1;
    xn(i+1) =xn(i)+delta;
end
end
plot(xn,'c')
xlabel('time');
ylabel('amplitude');
title('delta modulation and demodulation');
legend('original signal','quantized signal','reconstructed signal');
