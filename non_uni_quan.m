t=0:0.01:10;
a=sin(t);
[sqnr,aquan,code] = mula_pcm(a,16,255);
display(sqnr);
plot(t,a,'-',t,aquan,'-.');
legend('Original Signal','Quantized Signal');