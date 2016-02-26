%
% This code uses the Euler method to solve y'=-a*y+0.25*t^2
% from t=0 to t=5 with a=2. Then it plots the numerical solution
%
clear
clf reset
axes('position',[0.15,0.13,0.75,0.75])
%

y0=1;
h=0.05;
%
n=5/h;
t=[0:n]*h;
y=zeros(1,n+1);
y(1)=y0;
%
for j=1:n,
  y(j+1)=y(j)+h*(-sin(y(j))+2*t(j)*sin(4*t(j)));
end
%
plot(t,y,'k-','linewidth',1.0)
%
%set(gca,'fontsize',14)
%axis([0,5,-2,2])
%set(gca,'xtick',[0:1:5])
%set(gca,'ytick',[-2:0.5:2])
xlabel('t')
ylabel('y')
title('Euler method')
%
