%schroeder
function [y_out]=reverb(x,Tr)
Fs=44000;
T=1/Fs;
m1=1500;
m2=2000;
m3=2500;
m4=3000;
m5=0.005/T;
m6=0.0017/T;
g1=10^(-3*m2*T/Tr);
g2=10^(-3*m2*T/Tr);
g3=10^(-3*m3*T/Tr);
g4=10^(-3*m4*T/Tr);
g5=0.7;
g6=0.7;
g7=0.7;
% ts = -1;
% z = tf('z',ts);
% 
% sys=1 + g7*((1/(z^m1-g1))+(1/(z^m2-g2))+(1/(z^m3-g3))+(1/(z^m4-g4)))*(1-g5*z^m5)*(1-g6*z^m6)/((z^m5-g5)*(z^m6-g6));
% 
% h=iztrans(sys);
b1=[zeros(1,m1-1) 1];
a1=[1 zeros(1,m1-2) -g1];
b2=[zeros(1,m2-1) 1];
a2=[1 zeros(1,m2-2) -g2];
b3=[zeros(1,m3-1) 1];
a3=[1 zeros(1,m3-2) -g3];
b4=[zeros(1,m4-1) 1];
a4=[1 zeros(1,m4-2) -g4];
b5=[-g5 zeros(1,218) 1];
a5=[1 zeros(1,round(m5-2)) -g5];
b6=[-g6 zeros(1,78) 1];
a6=[1 zeros(1,round(m6-2)) -g6];
b7=g7;
a7=1;

y1=filter(b1,a1,x);
y2=filter(b2,a2,x);
y3=filter(b3,a3,x);
y4=filter(b4,a4,x);
y5=y1+y2+y3+y4;
y6=filter(b5,a5,y5);
y7=filter(b6,a6,y6);

y_out=filter(b7,a7,y7)+x;
Y_out=fft(y_out);
X=fft(x);
H=Y_out./X;
h=ifft(H);

plot(h,'yellow');
title('Impulse Response');

sound(y_out);
end