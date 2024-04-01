a = 4; b= 12;
x = a+(b-a)*rand(1,10000);
[p,edges] = histcounts(x);
outcome = 0.5*(edges(1:end-1) +edges(2:end));
g = 1/(b-a)*ones(1,length(outcome));
bar(outcome,p);
hold on;
plot(outcome,g,'r-'); 
ylabel('probability')
title('PDF');
n = 2;
for i=1:n
    x(i,:) = a+(b-a)*rand(1,10000);
end
for i= 1:length(x(1,:))
    y(i) = sum(x(:,i));
end
[N,edges] = histcounts(y);
mu = mean(x(1,:));
sigma = sqrt(var(x(1,:)));
sum_mean = n*mu;
sum_dev = sqrt(n)*sigma;
f_theory = pdf('Normal',edges,sum_mean,sum_dev);
figure;
histogram(y);hold on;
plot(edges,f_theory,'r');
xlabel('sample sum');ylabel('frequency');
title('Pdf');