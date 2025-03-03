t=0:0.01:10;

a=sin(t);


[sqnr,aquan] = mula_pcm(a,64,255);
display(sqnr);
plot(a);hold on
plot(aquan)
legend('Original Signal','Quantized Signal');

function [sqnr,a_quan,code]=mula_pcm(a,n,mu)
    [y,maximum]=mulaw(a,mu);
    [sqnr,y_q]=u_pcm(y,n);
    a_quan=invmulaw(y_q,mu);
    a_quan=maximum*a_quan;
    sqnr=20*log10(norm(a)/norm(a-a_quan));
end

function [y,a]=mulaw(x,mu)
    a=max(abs(x));
    y=(log(1+mu*abs(x/a))./log(1+mu)).*sign(x);
end

function x=invmulaw(y,mu)
    x=(((1+mu).^(abs(y))-1)./mu).*sign(y);
end

function [sqnr, a_quan] = u_pcm(a, n)
    amax = max(abs(a));
    a_quan = a / amax;
  
    d = 2 / n;
    q = d * (0:n-1) - (n-1)/2*d;

    for i = 1:n
        indices = (q(i) - d/2 <= a_quan) & (a_quan <= q(i) + d/2);
        a_quan(indices) = q(i) * ones(1, sum(indices));
    end
    a_quan = a_quan * amax;
    sqnr = 20 * log10(norm(a) / norm(a - a_quan));
end



