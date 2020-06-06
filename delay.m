%delay
Fs=1000;
omega=-pi:2*pi/Fs:pi;

Tp0=(-1./omega)*atan(-sin(omega)/cos(omega));
Tp1=(-1./omega)*atan(0);
Tp2=(-1./omega)*atan(3*sin(omega)/(5*cos(omega)+4));

Tg0=1./(1+2*cos(omega));
Tg1=0./(2+2*cos(omega));
Tg2=-3./(5+4*cos(omega));

subplot(3,2,1);
plot(omega,Tp0);
xlabel('omega');
ylabel('Tp0');
title('phase delay')
subplot(3,2,2);
plot(omega,Tg0);
xlabel('omega');
ylabel('Tg0');
title('group delay');
subplot(3,2,3);
plot(omega,Tp1);
xlabel('omega');
ylabel('Tp1');
subplot(3,2,4);
plot(omega,Tg1);
xlabel('omega');
ylabel('Tg1');
subplot(3,2,5);
plot(omega,Tp2);
xlabel('omega');
ylabel('Tp2');
subplot(3,2,6);
plot(omega,Tg2);
xlabel('omega');
ylabel('Tg2');
