clear
clc
close all
D=xlsread('16_5.xlsx');
t=D(:,1);
X=D(:,2);
Y=D(:,3);
l=0.005*15;
[m,n]=size(D)
for W=1:1:m
    if X(W)>0
        THO(W)=asin(sqrt(X(W)^2+Y(W)^2)/l)
    else
        THO(W)=asin(sqrt(X(W)^2+Y(W)^2)/(-l))
    end
end
T=t-1.91-0.6583;
plot(T,THO,'linewidth',2)
xlabel('时间[s]');
ylabel('角度[rad]');
set(gca,'Fontsize',14)                %设置字体大小为14
set(gca,'FontWeight','bold')          %字体加粗
