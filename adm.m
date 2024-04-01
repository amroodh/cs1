
l=1500;
t = linspace(0, 10, l);
Fs = 1/(10/(l));
amp = 5;
f = 2;
x1 = amp*sin(2*pi*f*t).*exp(-t);

[delta_out, delta_pred] = delta_adm_modulator(x1);

plot(t,x1);
title('ADM');
xlabel('Time(s)');
ylabel('Amplitude(V)');
hold on;
stairs(t,delta_pred');
legend('Input', 'Adaptive Delta Modulation');