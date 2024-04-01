t = 0:0.01:10;
a = sin(t);
[sqnr8, aquan8, code8] = u_pcm(a, 8);
[sqnr16, aquan16, code16] = u_pcm(a, 16);
disp('SQNR for N = 8:');
disp(sqnr8);
disp('SQNR for N = 16:');
disp(sqnr16);
plot(t, a, '-', t, aquan8, '-.', t, aquan16, '-', t, zeros(1, length(t)));
legend('Original Signal', '8 Level Quantized Signal', '16 Level Quantized Signal');
title('Signal and Quantized Versions');
xlabel('Time');
ylabel('Amplitude');
function [sqnr, a_quan, code] = u_pcm(a, n)
amax = max(abs(a));
a_quan = a / amax;
b_quan = a_quan;
d = 2 / n;
q = d * (0:n-1) - (n-1)/2*d;
for i = 1:n
indices = (q(i) - d/2 <= a_quan) & (a_quan <= q(i) + d/2);
a_quan(indices) = q(i) * ones(1, sum(indices));
b_quan(a_quan == q(i)) = (i-1) * ones(1, sum(a_quan == q(i)));
end
a_quan = a_quan * amax;
num_bits = ceil(log2(n));
code = zeros(length(a), num_bits);
for i = 1:length(a)
for j = num_bits:-1:0
if fix(b_quan(i) / 2^j) == 1
code(i, (num_bits - j) + 1) = 1;
b_quan(i) = b_quan(i) - 2^j;
end
end
end
sqnr = 20 * log10(norm(a) / norm(a - a_quan));
end