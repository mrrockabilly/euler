%
% This code estimates the error of the first order numerical
% differentiation method and plots it as a function of the spatial step.
%
clear
figure(1)
clf reset
axes('position',[0.15,0.13,0.75,0.75])
%
h=2.^(-[1:24]);
n=size(h,2);
Th=zeros(1,n);
%
x=2.0;
for i=1:n,
  Th(i)=(sin(x+h(i))-sin(x))/h(i);
end
%
err_est=abs(Th(1:n-1)-Th(2:n))/(1-0.5)+1.0e-16;
T_ext=cos(x);
err_ext=abs(Th-T_ext);
%
loglog(h, err_ext,'r-','linewidth',2.0)
hold on
loglog(h(1:n-1), err_est,'bs','Markerfacecolor','b')
%
axis([5.0e-8,8.0e-1,2.0e-8,5.0e-1])
set(gca,'fontsize',14)
set(gca,'xtick',10.^[-7:-1])
set(gca,'ytick',10.^[-7:-1])
xlabel('Spatial step size, h')
ylabel('Estimated error')
title('First order method')
legend('Exact error','Estimated error','Location','NorthWest')
%
%
