% clc
% clear
%% 设置初始值
tspan=[0,15];                       %步长
y0=[pi/2,0];                        %初始值
m=0.0017*15;                        %磁棒质量
g=9.8;                              %重力加速度
l=0.005*15;                         %磁棒长度
r=0.005;                            %磁棒半径
rho=0.00000018;                     %磁棒电阻率
B=0.8;                              %磁场强度
u=1.05;                             %相对介电常数
u0=pi*4e-7;                         %真空磁导率
I=1.25*m*r^2+1/3*m*l^2;             %转动惯量
L=sqrt(r^2+(l/2)^2);                %力距
% THO=atan(2*r/l);                  %形态固定角
K=(pi*r^2)^2*B^2*sqrt(2*rho/(u0*u))/16/pi/rho;  
[x,y]=ode45(@ode,tspan,y0);


%% 绘图
plot(x,y(:,1),'linewidth',2)
% title('理论实验对比');
xlabel('时间 [s]');
ylabel('摆动角度[rad]');
set(gca,'Fontsize',14)                %设置字体大小为14
set(gca,'FontWeight','bold')          %字体加粗
grid on
hold on
% plot(T,-THO,'linewidth',2)
hold on
% scatter(T,THO,'r','linewidth',2)
legend('5mm','6mm°','8mm°')
set(gca,'Fontsize',14)                %设置字体大小为14
set(gca,'FontWeight','bold')          %字体加粗


%%  函数
function dy=ode(x,y)
m=0.0017*15;                            %磁棒质量
g=9.8;                                  %重力加速度
l=0.005*15;                             %磁棒长度
r=0.004; 
rho=0.00000018;
B=2.2;
u=1.05;
u0=pi*4e-7;
I=1.25*m*r^2+1/3*m*l^2;                 %转动惯量
L=sqrt(r^2+(l/2)^2);                    %力距
% THO=atan(2*r/l);                      %形态固定角
K=(pi*r^2)^2*B^2*sqrt(2*rho/(u0*u))/16/pi/rho;  
dy=zeros(2,1);
dy(1)=y(2);
dy(2)=-0.6*m*g*L/I*sin(y(1))-K/I*y(2)^0.5-320*sin(y(1));
end