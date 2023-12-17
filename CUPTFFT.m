clc
clear
x=0:0.1*pi:100*pi;
y=sin(x)
plot(x,y)
set(gca,'XTick',[0:10*pi:100*pi])
