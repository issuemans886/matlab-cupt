clear
clc
close all
global r theta z;
B_z=[];
B_x=[];
B_y=[];
B=[];
theta=rand;
for j=1:51
     z=0.12+0.001*(j-1);
     for i=1:101
         r=-0.05+0.001*(i-1);
    B_z(i,j)=integral2(@Hz,0,2*pi,0,0.12);
    B_y(i,j)=integral2(@Hy,0,2*pi,0,0.12);
    B_x(i,j)=integral2(@Hx,0,2*pi,0,0.12);
    B(i,j)=sqrt(B_z(i,j).^2+B_y(i,j).^2+B_x(i,j).^2);
end
end

%% 绘图

[z,r]=meshgrid(0.12:0.001:0.17,-0.05:0.001:0.05);
C=B;
mesh(z,r,1000*B,1000*C);
colorbar
grid minor;
xlim([0.12 0.17])
hold on

%% 函数

function f=Hx(theta_0,z_0)
global z r theta 
a=0.0125;%磁铁半径
Br=1.46;%剩磁
f=Br./4/pi.*a*cos(theta_0).*(z-z_0)./(r.*r+a*a-2*a*r.*cos(theta-theta_0)+(z-z_0).^2).^(1.5);
end
function f=Hy(theta_0,z_0)
global z r theta  
a=0.0125;%磁铁半径
Br=1.46;%剩磁
f=Br./4/pi.*a*sin(theta_0).*(z-z_0)./(r.*r+a*a-2*a*r.*cos(theta-theta_0)+(z-z_0).^2).^(1.5);
end
function f=Hz(theta_0,z_0)
global z r theta 
a=0.0125;%磁铁半径
Br=1.46;%剩磁
f=Br./4/pi.*(a-r.*cos(theta-theta_0))./(r.^2+a^2-2*a.*r.*cos(theta-theta_0)+(z-z_0).^2).^(3/2);
end
