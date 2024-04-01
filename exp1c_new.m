% Parameters
Fs = 1000;          % Sampling frequency
Fpass = [20, 200];  % Passband frequencies
Fstop = [10, 250];  % Stopband frequencies
Apass = 1;          % Passband ripple (dB)
Astop = 80;         % Stopband attenuation (dB)
N = 5000;           % Number of samples

% Design the bandpass filter
h = designfilt('bandpassiir', ...
    'StopbandFrequency1', Fstop(1), 'PassbandFrequency1', Fpass(1), ...
    'PassbandFrequency2', Fpass(2), 'StopbandFrequency2', Fstop(2), ...
    'StopbandAttenuation1', Astop, 'PassbandRipple', Apass, ...
    'StopbandAttenuation2', Astop, 'SampleRate', Fs);

% Generate white Gaussian noise
noise = randn(N, 1);

% Filter the noise
bandpass_signal = filter(h, noise);

% Compute power spectrum using FFT
bandpass_spectrum = abs(fft(bandpass_signal)).^2 / length(bandpass_signal);
frequencies = Fs * (0:(N/2)) / N;

% Plot power spectrum
plot(frequencies, 10*log10(bandpass_spectrum(1:N/2+1)))
title('Power Spectrum of Bandpass Process');
xlabel('Frequency (Hz)');
ylabel('Power/Frequency (dB/Hz)');
grid on;

% Set x-axis and y-axis limits
xlim([-0.05, 0.5]);
ylim([0, 35]);

% Set x-axis and y-axis tick intervals
xticks(-0.05:0.1:0.5);
yticks(0:5:35);
