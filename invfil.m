function [x,x_inv]=invfil(f1,f2,T,Fs)

t=0:1/Fs:T;
w1=f1/(2*pi);
w2=f2/(2*pi);
L=T/(log(w2/w1));
K=w1*L;
w=(K/L)*exp(t/L);
x=sin(K*(exp(t/L)-1));
A=0.5.^(log2(w/w1));               %normalizing for 6db/octave
X=fft(x);
X_inv=1./X;
x_inv=ifft(X_inv);
x_inv=A.*x_inv;
end



