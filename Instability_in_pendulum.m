clc
clear
close all
r=1;
p=0.2;
theta=0; V=0;
theta_per=0.01;  V_per=0;
[t,y]=ode45(@(t,y) [y(2); (-sin(y(1))+(r*sin(y(1))*cos(y(1)))-p*y(2))],0:0.1:100,[theta,V]);
[t,y2]=ode45(@(t,y2) [y2(2); (-sin(y2(1))+(r*sin(y2(1))*cos(y2(1)))-p*y2(2))],0:0.1:100,[theta+theta_per,V+V_per]);
%[t,y3]=ode45(@(t,y3) [y3(2); (r*((cos(theta)^2)-(sin(theta)^2))-cos(theta)*y3(1)-p*y3(2))],0:0.1:1000,[theta_per,V_per]);
figure(1)
subplot(2,1,1)
plot(t,y(:,1))
hold on
plot(t,y2(:,1))
ylabel('\theta in radian')
xlabel('time')
legend('Base state, \theta','Perturbation, \theta')
title('Rotating Pedulum Stability Analysis',['Base State [',num2str(theta),', ',num2str(V),'], p=',num2str(p),', r=',num2str(r),' Perturbation=[',num2str(theta_per),', ',num2str(V_per),']'])
% title('\theta in radian')
% ylim([-1 2])
hold off
% plot(t,y3(:,1))
subplot(2,1,2)
% figure(2)
plot(t,y(:,2),'--')
hold on
plot(t,y2(:,2),'--')
% title('Velocity')
ylabel('Tangential Velocity')
xlabel('time')
legend('Base state, V','Perturbation, V')
%ylim([-10e-06 10e-06])
x=cos(y2(:,1))
z=sin(y2(:,1))
j=0
% for i=1:10:length(z)-50
%     figure(2)
%     title('Ball Motion')
%     ezplot('(1-x.^2).^0.5',[-1,1])
%     hold on
%     plot(x(i),z(i),'o')
%     pause(0.1)
%     plot(x(i+10),z(i+10),'o')
%     pause(0.1)
%     plot(x(i+20),z(i+20),'o')
%     pause(0.1)
%     plot(x(i+30),z(i+30),'o')
%     pause(0.1)
%     plot(x(i+40),z(i+40),'o')
%     pause(0.1)
%     plot(x(i+50),z(i+50),'o')
%     pause(0.1)
% end
% ezplot('(0.8660/0.5)*x',[0,1])
% xlim([-1 1])
% ylim([0 1])
% title('Ball Motion')
r_=0:0.2:2;
p_=0:0.1:1;
for i=1:length(r_)
    for j=1:length(p_)
     s1(i,j)=(-p_(j)+(sqrt((p_(j)^2)+4*(r_(i)-1))))/2;
     s2(i,j)=(-p_(j)-(sqrt((p_(j)^2)+4*(r_(i)-1))))/2;
    end
end
z1=real(s1)
z2=real(s2)
figure(3)
subplot(1,2,1)
for i=1:length(r_)
    for j=1:length(p_)
     if z1(i,j)<0
         plot(p_(j),r_(i),'o','color','g')
         xlim([0,p_(end)])
         ylim([0,r_(end)])
         hold on
     elseif z1(i,j)>0
         plot(p_(j),r_(i),'*','color','r')
         xlim([0,p_(end)])
         ylim([0,r_(end)])
         hold on
     else 
        plot(p_(j),r_(i),'diamond','color','k')
        xlim([0,p_(end)])
        ylim([0,r_(end)])
        hold on 
     end
     title('Characteristic value s1')
     xlabel('p')
     ylabel('r')
    end
end
hold off
subplot(1,2,2)
for i=1:length(r_)
    for j=1:length(p_)
     if z2(i,j)<0
         plot(p_(j),r_(i),'o','color','g')
         xlim([0,p_(end)])
         ylim([0,r_(end)])
         hold on
     elseif z2(i,j)>0
         plot(p_(j),r_(i),'*','color','r')
         xlim([0,p_(end)])
         ylim([0,r_(end)])
         hold on
     else 
        plot(p_(j),r_(i),'diamond','color','k')
        xlim([0,p_(end)])
        ylim([0,r_(end)])
        hold on 
     end
     title('Characteristic value s2')
     xlabel('p')
     ylabel('r')
    end
end


