[x,Fs]=audioread('Test_Signal_1.wav');
L=length(x);            %collect 2048 samples
x1=x(1:L);
w=rectwin(L);
y=x1.*(w);
omega=-pi:2*pi/(4*L):pi-2*pi/(4*L);
Y=fftshift(fft(y,4*L));
plot(omega,20*log10(abs(Y)));