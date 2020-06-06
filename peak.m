%peak-filter

function y=peak(x,fc,Q,G,Fs)

    wc=2*pi*fc;
    wb=wc/Q;
    T=1/(2*Fs);
    d=-cos(2*pi*fc/Fs);
    V0=10^(G/20);
    H0=V0-1;
    
    if(V0>1)
    
        a=(tan(wb*T/2)-1)/(tan(wb*T/2)+1);
    end     
    if(V0<1)
    
        a=(V0*tan(wb*T/2)-1)/(V0*tan(wb*T/2)+1);
    end
num=[-a d*(1-a) 1];
den=[1 d*(1-a) -a];
N=freqz(num,1,1000);
[D]=freqz(den,1,1000);
[A2,w]=freqz(num,den,1000);

H=1+(H0/2)*(1-A2);
X=freqz(x,1,1000);

Y=H.*X;

y=ifft(ifftshift(Y));
pyy=pwelch(y);


figure(1)
subplot(2,2,1);
plot(log10(w/pi), 20*log10(abs(H)));
xlabel('log10(w/pi)');
ylabel('Magnitude(dB)');
title('Magnitude Response');
subplot(2,2,2);
plot(log10(w/pi), angle(H));
xlabel('log10(w/pi)');
ylabel('Phase');
title('Phase Response');
subplot(2,2,3);
plot(log10(w/pi), -angle(H)/w);

xlabel('log10(w/pi)');
ylabel('Tp');
title('Phase delay');
[Tg,w2]=grpdelay((H0*(D-N)),(2*D));
 
  subplot(2,2,4);
  plot(log10(w2/pi), (Tg));
 xlabel('log10(w/pi)');
 ylabel('Tg');
  title('Group delay');

 figure(2)
plot(10*log10(pyy));
title('Power spectral Density');
end