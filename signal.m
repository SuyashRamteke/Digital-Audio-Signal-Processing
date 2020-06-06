
%signal testing
clc;
clear all;
close all;
Fs=44100;
t=0:1/Fs:255/Fs;
f=1e3;

%different types of function. When you run the code press the number
%corresponding to the signal you want to test
disp("You have the following choices : 1.sinusoidal, 2.exponential, 3.linear, 4.logarithmic 5.multiple sinusoids 6. Filtered RP");
prompt='Enter the corresponding number of signal type you want to quantize!!';
x=input(prompt);
if(x==1)
    w=2*sin(2*pi*f*t);
end
if(x==2)
    w=exp(t*f);
end 
if(x==3)
    w=t*f;
end
if(x==4)
    w=log(f*t);
end
if(x==5)
    w=3*cos(2*pi*f*t)+4*cos(2*pi*(f*2)*t);
end
if(x==6)
    delt=2*sqrt(3);
    q=delt*(randn(1,length(t))-0.5);
    
    w=filter([1 2 1],1,q);
end
% plot(t,w);
% axis([0 1000 -2 2]);
quantize(w);
dithquant(w);