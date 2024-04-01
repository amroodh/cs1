echo on
a=randn(1,500);
[sqnr16,aquan16,code16]=mula_pcm(a,16,255);
[sqnr64,aquan64,code64]=mula_pcm(a,64,255);
[sqnr128,aquan128,code128]=mula_pcm(a,128,255);
pause % Press a key to see the SQNR for N = 16.
sqnr16
pause % Press a key to see the SQNR for N = 64.
sqnr64
pause % Press a key to see the SQNR for N = 128.
sqnr128
pause % Press a key to see the plot of the signal and its quantized versions.
subplot(2,1,1)
plot(a-aquan64)
subplot(2,1,2)
plot(a,aquan64)