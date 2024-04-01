central_limit_theorem(2, 10000);
function central_limit_theorem(N, num_trials)
% Simulate rolling N fair dice num_trials times
rolls = zeros(num_trials, N);
for i = 1:num_trials
% Roll N fair dice
rolls(i, :) = randi([1, 6], 1, N);
end
% Calculate the sum of each set of N dice rolls
sums = sum(rolls, 2);
% Plot the histogram
figure;
histogram(sums, 'Normalization', 'probability', 'BinWidth', 1, 'EdgeColor', 'w');
% Set plot labels and title
title(sprintf('Central Limit Theorem for Rolling %d Fair Dice %d times', N, num_trials));
xlabel('Sum of Dice Rolls');
ylabel('Probability');
end
