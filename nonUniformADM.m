% Step 1: Generate a sequence of random variables
num_samples = 500; % Number of samples
random_sequence = randn(1, num_samples); % Generate random sequence with Gaussian distribution

% Step 2: Define the µ-law quantization function


% Step 3: Quantize the sequence using 16, 64, and 128 quantization levels with µ = 255
mu = 255; % µ-law parameter
quantization_levels = [16, 64, 128]; % Quantization levels

quantized_signals = cell(1, numel(quantization_levels));
errors = cell(1, numel(quantization_levels));

for i = 1:numel(quantization_levels)
    quantized_signals{i} = mu_law_quantization(random_sequence, mu, quantization_levels(i));
    errors{i} = random_sequence - quantized_signals{i};
end

% Step 4: Plot the error and the input-output relation for each quantizer
for i = 1:numel(quantization_levels)
    figure;
    subplot(2, 1, 1);
    plot(random_sequence, (quantized_signals{i}), '.');
    title(['Input-Output Relation for ', num2str(quantization_levels(i)), ' Quantization Levels']);
    xlabel('Input Signal');
    ylabel('Quantized Signal');
    grid on;
    
    subplot(2, 1, 2);
    stem(errors{i});
    title(['Error for ', num2str(quantization_levels(i)), ' Quantization Levels']);
    xlabel('Sample Index');
    ylabel('Error');
    grid on;
end

% Step 5: Determine the SQNR in each case
SQNR_values = zeros(1, numel(quantization_levels));

for i = 1:numel(quantization_levels)
    SQNR_values(i) = 20 * log10(var(random_sequence) / var(errors{i}));
end

disp('SQNR Values:');
disp(SQNR_values);
function quantized_signal = mu_law_quantization(signal, mu, levels)
    a = max(abs(signal)); % Maximum absolute value in the signal
    compressed_signal = sign(signal) .* log(1 + mu * abs(signal) / a) / log(1 + mu); % Compression
    quantized_signal = round((levels - 1) * compressed_signal / (2 * a)) * (2 * a) / (levels - 1); % Quantization
end