%%
%计算
A=7+7              %加法
A=7-7              %减法
A=7*7              %乘法
A=7/7              %除法
A=7^7              %次方
A=factorial(3)     %阶乘
A=abs(-7)          %绝对值
A=sqrt(7)          %开根号

%%
%矩阵运算
A=[1 2 3;4 5 6;7 8 9]      %创建矩阵
A=A'                       %矩阵的转置
A=zeros(3)                 %创建零矩阵（用于预设）
A=ones(3)                  %创建一矩阵
A=[1 2 3]; B=[4 5 6];
C=A+B                       
C=A-B
C=A.*B
C=A./B                     %矩阵运算保证维度一致，且乘除运算前要用（.）
C=sqrt(A)
C=abs(A)
C=factorial(A)             %利用矩阵可以同时处理多个数据
C=mean(B)                  %取平均值

%%
%数据处理
clc                        %清除命令区
clear                      %清除工作区
D=xlsread('追点1');        %将Excel内数据导入到matlab并以矩阵形式存储到D里面
L=length(D)                %提取数据长度

%%
%数据索引
E=(1,1)                    %提取第一行第一列数据
t=D(:,1)                   %提取第一列数据（其中：代表从1到最后）
y=D(:,3)                   %提取第三列数据
C=[0 1 1 1;1 1 1 2;1 1 1 3]
[m,n]=find(C==2)           %找出数据中的特定值
[m,n]=find(C==min(min(C))) %找出数据中的最小值
[m,n]=find(C==max(max(C))) %找出数据中的最大值

%%
%基本语法
i=1:1:100                  %生成列表（一维矩阵），第一个：前是开始位置，中间是步长，最后是终止位置
i=linspace(1,100)          %生成1到100步长默认为1
%for循环
clc
clear
for n=1:1:10
    D(n)=n
end                  

%if语法
clc
clear
A=2;B=3;
if A>B
    disp('A大于B')
else
    disp('B大于A')
end

%作业：for与if循环的嵌套

%%
%绘图
x=1:1:100;
y=1:1:100;
plot(x,y)       %绘制x与y的关系图（将散点图自动连成线),一般用于理论解
scatter(x,y)    %绘制x与y的散点图，一般用于绘制实验数据

plot(x,y)
plot(x,y,'linewidth',2)         %加粗线条
title('关系图');                %添加标题
xlabel('时间[s]')               %添加横坐标名称
ylabel('位移[m]')               %添加纵坐标名称
set(gca,'Fontsize',14)          %设置字体大小为14
set(gca,'FontWeight','bold')    %字体加粗
grid on                         %加上格线

plot(x,y)
hold on
scatter(x,y)                    %将两幅图画在一起

subplot(2,1,1)
plot(x,y)
subplot(2,1,2)
scatter(x,y)                    %分割画布操作

plot(x,y,'r')                   %改变颜色

plot(x,y)
hold on
scatter(x,y)                    
legend('理论','实验')           %绘制标识

semilogx(x,y)                   %将x坐标改为对数形式
set(gca,'XTick',[0:10*pi:100*pi]) %标注x轴的间隔和始末
set(gca,'xtickLabel',{'0','π','2π','3π','4π'})
%%
%ode45求解微分方程（需要新建一个脚本运行）
clc
clear
%设定预设值
t=linspace(0,10);
x0=[1 0];
[t,x] = ode45(@p,t,x0);
%画图
plot(t,x(:,1),'-o',t,x(:,2),'-o')
title('求解谐振子模型');
xlabel('时间 t');
ylabel('求解值');
legend('位移','速度')
%输入方程
function dxdt = p(t,x)
k=1;
m=2;
dxdt = [x(2); 
    -k*x(1)/m];
end 

%%
%差分法求解偏微分方程



%%
%快速傅里叶变化
clear
clc
close all
%时域
Fs = 60;                   %视频帧数
D=xlsread('追点1');        %导入数据
t=D(:,1);                  %提取时间数据
y=D(:,3);                  %提取y坐标数据
L=length(y)                %提取数据长度
%绘制时域
figure(1)
plot(t, y);
title('时域');
xlabel('时间[s]')
ylabel('振幅[m]')
set(gca,'Fontsize',14)          %设置字体大小为14
set(gca,'FontWeight','bold')    %字体加粗
Y=fft(y);                       %进行傅里叶变化                      
% numel(find(isnan(y)))         %查找错误数据个数
% ind_nan = find(isnan(y))      %查找错误数据位置 
%频域
P2=abs(Y);                 
plot(t, P2);
P1=P2(1:L/2+1);                
P1(2:end-1)=2*P1(2:end-1);
f=Fs*(0:(L/2))/L;               %取出实频
%绘制频域
figure(2)
plot(f,P1)
title('频域');
xlabel('频率[Hz]')
ylabel('振幅[m]')
set(gca,'Fontsize',14)                %设置字体大小为14
set(gca,'FontWeight','bold')          %字体加粗

%%
%数据拟合


%%
%积分
function result = integral(x,y,c)
    result = [];
    for i=1:1:length(y)
        c=y(i)*(x(2)-x(1))+c ; 
        result(end+1) = c;
    end
end                                  %定义积分函数并存储在matlab运行文件夹中即可调用
clear
clc
close all
V0=3.5;                     %初始切向速度
r=0.005;                    %磁棒半径                 
m=0.0017*12;                %磁棒质量
f=0.0175;                   %滚动摩擦力大小
t=0:0.01:4.08;              %求解时间
W=V0/r-f/(r*m)*t;           %角速度衰减
y1 = integral(t,W,1);       %角速度积分求得进动角度
%第一个位置为积分区间，第二个位置为被积函数，第三个位置为存储被积函数的初始值

%%
%自学
help %在help后面加语法matlab会自动显示语法用法和解释
doc  %在命令窗口输入会打开matlab的官方教程界面
%百分之80的问题基本上都能在网上查找到，一下代码在CSDN上都有现成的代码，碰到问题可以通过以上途径解决
%个人学习matlab推荐看一遍速成的基本语法教学，然后是看台大郭彦甫的教程，个人非常喜欢。




















