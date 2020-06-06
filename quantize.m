%quantizer

function [q]=quantize(w)

del=1;
Fs=44100;
q=del*floor((w/del)+(del/2));
e=q-w;

[Sw,f0]=pwelch(w,hann(256),128,1024,Fs,'centered');
[Sq,f1]=pwelch(q,hann(256),128,1024,Fs,'centered');
[Se,f]=pwelch(e,hann(256),128,1024,Fs,'centered');
[Re,k]=xcorr(e,10,'unbiased');

figure(1);
subplot(3,1,1);
plot(w);
xlabel("t");
ylabel("w(t)--> original signal");
title("TIME-DOMAIN VIEW");
subplot(3,1,2);
plot(q,'m');
xlabel("t");
ylabel("q(t)--> quantized value");
subplot(3,1,3)
plot(e,'r');
xlabel("t");
ylabel("e(t)--> quantization error");

%PSD Plots
figure(2);
subplot(3,1,1)
  plot(f0,10*log10(Sw),'g');
  xlabel("f(hz)");
ylabel("Sw(f)--> original signal");
title("POWER SPECTRAL DENSITIES");
 subplot(3,1,2)
  plot(f1,10*log10(Sq),'y');
  
  xlabel("f(hz)");
ylabel("Sq(f)--> quantized signal");
subplot(3,1,3)
  plot(f,10*log10(Se),'k');
  
xlabel("f(hz)");
ylabel("Se(f)--> error signal");

%ACF plot
figure(5)
stem(k,Re);
title("ACF");