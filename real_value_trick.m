%realvaluetrick
function [X] = real_value_trick(x)


N=length(x);              %must be a power of 2
n=0:N/2-1;
x_even(n+1)=x(2*(n+1)-1);
x_odd(n+1)=x(2*(n+1));
g(n+1)=(x_even(n+1)) + 1j*(x_odd(n+1));


k=0:N/2-1;

G=fft(g,N/2);
GC=fft(conj(g),N/2);

X_even(k+1)=0.5*(G(k+1)+(GC(k+1)));
X_odd(k+1)=1j*0.5*(-G(k+1)+(GC(k+1)));


X(k+1)=X_even(k+1)+exp(-1j*2*pi*(k)/N).*X_odd(k+1);
X(k+1+N/2)=X_even(k+1)-exp(-1j*2*pi*(k)/N).*X_odd(k+1);

X0=fft(x,N);

figure(1)
subplot(2,1,1);
plot(log10(abs(X)));
title('Magnitude response')

subplot(2,1,2);
plot(log10(abs(X0)),'red');

figure(2)
subplot(2,1,1);
plot(angle(X));
title('Phase response')

subplot(2,1,2);
plot(angle(X0),'green');

end