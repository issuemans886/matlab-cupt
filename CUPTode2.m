clc
clear
%%设置初始值
tspan=[0,10];                      %步长
y0=[0,0];                          %初始值

[x,y]=ode45(@ode,tspan,y0);

%% 绘图
plot(x,y(:,1),'linewidth',2)
title('求解结果');
xlabel('X');
ylabel('Y');
set(gca,'Fontsize',14)             %设置字体大小为14
set(gca,'FontWeight','bold')       %字体加粗
grid on
hold on

%%  函数
function dy=ode(x,y)
k=0.2;
g=9.8;
m=1;
dy=zeros(2,1);
dy(1)=y(2);
dy(2)=g-k/m*y(2);
end