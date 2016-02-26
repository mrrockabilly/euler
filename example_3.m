%
% This code estimates the error of the fourth order numerical
% differentiation method and plots it as a function of the spatial step.
%
clear
figure(3)
clf reset
axes('position',[0.15,0.13,0.75,0.75])
%
h=2.^(-[1:20]);
n=size(h,2);
Th=zeros(1,n);
%
x=2.0;
for i=1:n,
  Th(i)=(-sin(x+2*h(i))+8*sin(x+h(i))-8*sin(x-h(i))+sin(x-2*h(i)))/(12*h(i));
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
axis([5.0e-7,8.0e-1,5.0e-16,5.0e-3])
set(gca,'fontsize',14)
set(gca,'xtick',10.^[-6:-1])
set(gca,'ytick',10.^[-14:2:-4])
xlabel('Spatial step size, h')
ylabel('Estimated error')
title('Fourth order method')
legend('Exact error','Estimated error','Location','NorthWest')
%
%
