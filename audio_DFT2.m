[x,Fs]=audioread('Test_Signal_2.wav');
L=length(x);
[S,F,T]=spectrogram(x,hanning(2048),1024,4*L,Fs);
surf(T,F,abs(S),'edgecolor','none');
ylim([0 5000]);
axis tight;
view(0,90);