%dc-offset

Fs=44100;
f=1:1e4;
b=[0.99893 -0.99893];
a=[1 -0.9978628];

[h]=freqz(b,a,f,Fs);

figure(1);
plot(log10(f), 20*log10(abs(h)));
xlabel('Logarithm of frequency');
ylabel('Magnitude in dB');

b1=[0 1];
a1=[1 -1];
[h1]=freqz(b1,a1,f,Fs);

figure(2);

plot(log10(f), 20*log10(abs(h1)));
xlabel('Logarithm of frequency');
ylabel('Magnitude in dB');
