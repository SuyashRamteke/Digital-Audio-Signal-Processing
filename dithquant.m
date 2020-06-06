
%non-subtractive dither

%e0 : 1-bit rectangular non-subtractive dither
%e  : 2-bit triangular non-subtractive dither

function [q2]=dithquant(w)
del=1;
r0=1*rand(1,256)-0.5;
r2=1*rand(1,256)-0.5;
dith=r0+r2;

w0=w+r0;
w2=(w+dith);
q0=del*floor((w0/del)+(del/2));

%2-bit LSB
q2=(2*del)*floor((w2/2*del)+(del))-1;
e0=q0-w0;
e2=(q2-w2);

[Sw0,f4]=pwelch(w0,hann(256),128,1024,44100,'centered');
[Sw,f0]=pwelch(w2,hann(256),128,1024,44100,'centered');
[Sq0,f2]=pwelch(q0,hann(256),128,1024,44100,'centered');
[Sq,f1]=pwelch(q2,hann(256),128,1024,44100,'centered');
[Se0,f5]=pwelch(e0,hann(256),128,1024,44100,'centered');
[Se,f]=pwelch(e2,hann(256),128,1024,44100,'centered');
[Re0,k0]=xcorr(e0,10,'unbiased');
[Re2,k2]=xcorr(e2,10,'unbiased');

figure(3);
subplot(3,2,1);
plot(w0);
xlabel("t");
ylabel("w0(t)--> original signal");
title("TIME-DOMAIN VIEW - rectangular 1-LSB");
subplot(3,2,2);
plot(w2);
xlabel("t");
ylabel("w(t)--> original signal");
title("TIME-DOMAIN VIEW - triangular 2-LSB");
subplot(3,2,3);
plot(q0,'m');
xlabel("t");
ylabel("q0(t)--> quantized value");
subplot(3,2,4);
plot(q2,'m');
xlabel("t");
ylabel("q(t)--> quantized value");
subplot(3,2,5)
plot(e0,'r');
xlabel("t");
ylabel("e0(t)--> quantization error");
subplot(3,2,6)
plot(e2,'r');
xlabel("t");
ylabel("e(t)--> quantization error");

%PSD Plots
figure(4);
subplot(3,2,1)
  plot(f4,10*log10(Sw0),'g');
  xlabel("f(hz)");
ylabel("Sw0(f)--> original signal");
title("PSD Rectangular 1-LSB");
subplot(3,2,2)
  plot(f0,10*log10(Sw),'g');
  xlabel("f(hz)");
ylabel("Sw(f)--> original signal");
title("PSD Triangular 2-LSB"); 
subplot(3,2,3)
  plot(f2,10*log10(Sq0),'y');
  xlabel("f(hz)");
ylabel("Sq0(f)--> quantized signal");
subplot(3,2,4)
  plot(f1,10*log10(Sq),'y');
  xlabel("f(hz)");
ylabel("Sq(f)--> quantized signal");

subplot(3,2,5)
  plot(f5,10*log10(Se0),'k');
xlabel("f(hz)");
ylabel("Se0(f)--> error signal");
subplot(3,2,6)
  plot(f,10*log10(Se),'k');
xlabel("f(hz)");
ylabel("Se(f)--> error signal");

%ACF Plots
figure(6)
subplot(2,1,1);
stem(k0,Re0);
title("ACF");
subplot(2,1,2);
stem(k2,Re2);