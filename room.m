%room
clc;
clear all;
close all;
[x0,x1]=invfil(10,23000,2,48000);
[S0,F0,T0]=spectrogram(x0,hanning(2048),512,8192,48000);
figure(1)
surf(T0,F0,log10(abs(S0)),'edgecolor','none'); axis tight; view(0,90);
title('Spectrogram of exponential sweep sinusoid');
[S1,F1,T1]=spectrogram(x1,hanning(2048),512,8192,48000);
ylim([0 200000]);
figure(2)
surf(T1,F1,log10(abs(S1)),'edgecolor','red'); axis tight; view(0,90);
title('Spectrogram of exponential inverse filter');
ylim([0 200000]);

[r,Fs2]=audioread('Big_Hall.wav');
r0=conv(x0,r(:,1));
r1=conv(r0,x1);
R=fft(r);
R1=fft(r1);

figure(3)
subplot(2,1,1);
plot(log10(abs(R)));
title('Magnitude response');
subplot(2,1,2);
plot(log10(abs(R1)));   

figure(4)

subplot(2,1,1)
plot(angle(R));
title('Phase response');
subplot(2,1,2);
plot(angle(R1));   