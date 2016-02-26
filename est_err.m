%
% This code uses the Euler method to solve y'=-a*y+0.25*t^2
% with time step h=0.1 and h=0.05. Then it estimates the error
% and plots the estimated error as a function of time. 
%
clear
clf reset
%
a=2;
y0=2;
h=0.1;
%
% Run with h
%
n=5/h;
t=[0:n]*h;
y=zeros(1,n+1);
y(1)=y0;
for j=1:n,
  y(j+1)=y(j)+h*(-a*y(j)+0.25*t(j)^2);
end
h1=h;
n1=n;
t1=t;
y1=y;
%
% Run with h/2
%
h=h/2;
n=5/h;
t=[0:n]*h;
y=zeros(1,n+1);
y(1)=y0;
for j=1:n,
  y(j+1)=y(j)+h*(-a*y(j)+0.25*t(j)^2);
end
h2=h;
n2=n;
t2=t;
y2=y;
%
% Error at t=5
err_t5=abs(y1(n1+1)-y2(n2+1))/(1-0.5);
disp(' ')
disp(['  The estimated error for h = ',num2str(h1),'  at t = 5 is'])
disp(['        Error = ',num2str(err_t5,'%16.8e'),'.'])
disp(' ')
%
% Error as a function of time
err_est=abs(y1-y2(1:2:n2+1))/(1-0.5);
y_ext=exp(-a*t1)*y0+1/(4*a)*t1.^2-1/(2*a^2)*t1+1/(2*a^3)*(1-exp(-a*t1));
err_ext=abs(y1-y_ext);
%
plot(t1,err_est,'bd','linewidth', 2.0)
hold on
plot(t1,err_ext,'r-','linewidth', 2.0)
legend('Estimated error','Exact error')
set(gca,'fontsize',14)
axis([0, 5, 0, 0.1])
set(gca,'xtick',[0:1:5])
set(gca,'ytick',[0:0.01:0.1])
xlabel('Time')
ylabel('Error')
title('Euler method')
%
