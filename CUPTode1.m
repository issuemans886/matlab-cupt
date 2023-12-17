clc
clear
%%设置初始值
tspan=[0,10];                  %步长
y0=[2];                        %初始值
[x,y]=ode45(@ode,tspan,y0);

%% 绘图
plot(x,y,'linewidth',2)
title('求解结果');
xlabel('X');
ylabel('Y');
set(gca,'Fontsize',14)             %设置字体大小为14
set(gca,'FontWeight','bold')       %字体加粗
grid on
hold on

%%  函数
function dy=ode(x,y)
dy=sqrt(sin(x))/exp(-x)*x^(1/7)
end