clear
clc
close all
D=xlsread('12_5_2.xlsx');
t=D(:,1);
y=D(:,2);
x=D(:,3);
plot(y,x)
title('摆动轨迹');
xlabel('X位置[m]');
ylabel('Y位置[m]');
set(gca,'Fontsize',14)             %设置字体大小为14
set(gca,'FontWeight','bold')       %字体加粗
rho2=sqrt(x.^2+y.^2);
for m=1:79
    if x(m)>0 & y(m)>0
        tantho2(m)=abs(y(m)/x(m));
        tho2(m)=atan(tantho2(m))
    elseif x(m)<0 & y(m)<0
        tantho2(m)=abs(y(m)/x(m));
        tho2(m)=2*1.5708+atan(tantho2(m))
    elseif x(m)>0 & y(m)<0
        tantho2(m)=abs(y(m)/x(m));
        tho2(m)=4*1.5708-atan(tantho2(m))
    else
        tantho2(m)=abs(y(m)/x(m));
        tho2(m)=2*1.5708-atan(tantho2(m))
    end
end
polarplot(tho2,rho2)
hold on
polarplot(y1*pi/180,l.*cos(tho))
%%
% for T=1:1:232
%     plot(x(T),y(T),'r.','markersize',42)
%     hold on
%     pause(0.1)
%     hold on
