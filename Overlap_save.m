%OLS
x=1:1:15;
h=[2 3 3 2];
y=conv(x,h);
y1=conv(x(1:5),h);              %No zero padding
y3=conv(x(6:10),h);

y5=conv(x(11:15),h);

L=5;    %chosen so that N=(L+Nfft-1) is a power of 2


Nh=length(h);
Nfft=L+Nh-1;
X1=fft(x(1:5),Nfft);
X2=fft(x(6:10),Nfft);
X3=fft(x(11:15),Nfft);
h_zp=[h zeros(1,(Nfft-Nh))];     %zero-padding
H=fft(h_zp);
Y2=X1.*H;
y2=ifft(Y2);
Y4=X2.*H;
y4=ifft(Y4);
Y6=X3.*H;
y6=ifft(Y6);

figure(1)
subplot(2,1,1);
stem(y1);
title('First five elements');
subplot(2,1,2);
stem(y2);

figure(2)
subplot(2,1,1);
stem(y3);
title('Second five elements');
subplot(2,1,2);
stem(y4);

figure(3)
subplot(2,1,1);
stem(y5);
title('Third five elements');
subplot(2,1,2);
stem(y6);

figure(4);
stem(y);