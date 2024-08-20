clc
clear
close all
x0=[0.1 -0.1 0 0 0 -0.5 2 0 0 0 0 0 0 0 0 0 0 0 0];
%********************* Case 1********************
color=('brgkmcy'); %颜色属性
linetype=cell(5,1);
linetype{1}='-'; % 线型专属属性
linetype{2}='--';
linetype{3}=':';
linetype{4}='-.';
linetype{5}='-.d';
startype=('od*x+vp'); % 点标记专属属性
%********************* Case 1********************
for i=1
    switch i
        case 1
            sim('UAVSlung1.slx',[0 16]); % proposed controller
        case 2
            sim('UAVSlung2.slx',[0 16]);  % classical sliding mode +super-twisting sliding mode control
        case 3
            sim('UAVSlung3.slx',[0 16]); % proposed sliding mode +discontiunous sliding mode control
    end
t=tout1;
x=State1.signals.values(:,5);
y=State1.signals.values(:,6);
z=State1.signals.values(:,7);
a=State1.signals.values(:,1);
b=State1.signals.values(:,2);
% out.State.signals.values
% out.Surface.signals.values
sx=Surface1.signals.values(:,1);
sy=Surface1.signals.values(:,2);
sz=Surface1.signals.values(:,3);
Fx=Surface1.signals.values(:,7);
Fy=Surface1.signals.values(:,8);
Fz=Surface1.signals.values(:,9);
p=Surface1.signals.values(:,4);
q=Surface1.signals.values(:,5);

dx=Est_D.signals.values(:,1);
dy=Est_D.signals.values(:,2);
dz=Est_D.signals.values(:,3);

figure (1)
            subplot(5,1,1)
            plot(t,x,[num2str(color(i)), num2str(linetype{i})],'linewidth',1)
            hold on;
            grid on;
            subplot(5,1,2)
            plot(t,y,[num2str(color(i)), num2str(linetype{i})],'linewidth',1)
            hold on;
            grid on;
            subplot(5,1,3)
            plot(t,z,[num2str(color(i)), num2str(linetype{i})],'linewidth',1)
            hold on;
            grid on;
     
            subplot(5,1,4)
            plot(t,a*180/pi,[num2str(color(i)), num2str(linetype{i})],'linewidth',1)
            grid on;
            hold on;
            subplot(5,1,5)
            plot(t,b*180/pi,[num2str(color(i)), num2str(linetype{i})],'linewidth',1)
            hold on;
            grid on;

 figure (2)
            subplot(5,2,1)
            plot(t,Fx,[num2str(color(i)), num2str(linetype{i})],'linewidth',1)
            xlim([0 16]); hold on; grid on;
            subplot(5,2,2)
            plot(t,Fx,[num2str(color(i)), num2str(linetype{i})],'linewidth',1)
            xlim([2 2.4]); hold on; grid on;

            subplot(5,2,3)
            plot(t,Fy,[num2str(color(i)), num2str(linetype{i})],'linewidth',1)
            xlim([0 16]);hold on;  grid on;
            subplot(5,2,4)
            plot(t,Fy,[num2str(color(i)), num2str(linetype{i})],'linewidth',1)
            xlim([2 2.4])
            hold on; grid on;
            
            subplot(5,2,5)
            plot(t,Fz,[num2str(color(i)), num2str(linetype{i})],'linewidth',1)
            xlim([0 16]);hold on; grid on;
            subplot(5,2,6)
            plot(t,Fz,[num2str(color(i)), num2str(linetype{i})],'linewidth',1)
            xlim([2 2.4]);  hold on;   grid on;
            
            subplot(5,2,7)
            plot(t,p*180/pi,[num2str(color(i)), num2str(linetype{i})],'linewidth',1)
            xlim([0 16]);grid on; hold on;
            subplot(5,2,8)
            plot(t,p*180/pi,[num2str(color(i)), num2str(linetype{i})],'linewidth',1)
            xlim([2 2.4]); grid on; hold on;
            
            subplot(5,2,9)
            plot(t,q*180/pi,[num2str(color(i)), num2str(linetype{i})],'linewidth',1)
            xlim([0 16]);hold on; grid on;
            subplot(5,2,10)
            plot(t,q*180/pi,[num2str(color(i)), num2str(linetype{i})],'linewidth',1)
            xlim([2 2.4]); hold on; grid on;
  figure (3)
            subplot(3,1,1)
            plot(t,sx,[num2str(color(i)), num2str(linetype{i})],'linewidth',1)
            hold on;
            grid on;
            subplot(3,1,2)
            plot(t,sy,[num2str(color(i)), num2str(linetype{i})],'linewidth',1)
            hold on;
            grid on;
            subplot(3,1,3)
            plot(t,sz,[num2str(color(i)), num2str(linetype{i})],'linewidth',1)
            hold on;
            grid on;

  figure (4)
            subplot(3,1,1)
            plot(t,dx,[num2str(color(i)), num2str(linetype{i})],'linewidth',1)
            hold on;
            grid on;
            subplot(3,1,2)
            plot(t,dy,[num2str(color(i)), num2str(linetype{i})],'linewidth',1)
            hold on;
            grid on;
            subplot(3,1,3)
            plot(t,dz,[num2str(color(i)), num2str(linetype{i})],'linewidth',1)
            hold on;
            grid on;
    
end
figure (1)
subplot(5,1,1)
% xlabel('$\textup{t}\ [s]$','Interpreter','latex');
ylabel('$\textup{x}\ [m]$','Interpreter','latex');

set(gca, 'Fontname', 'Times New Roman', 'Fontsize', 9);
%             % set(gcf,'Position',[300 300 800 800]);
set(get(gca,'XLabel'),'Fontname', 'Times New Roman','FontSize',9);
set(get(gca,'YLabel'),'Fontname', 'Times New Roman','FontSize',9);
legend('(38)','(37)','(28)','Orientation','Horizon')
subplot(5,1,2)
% xlabel('$\textup{t}\ [s]$','Interpreter','latex');
ylabel('$\textup{y}\ [m]$','Interpreter','latex');
set(gca, 'Fontname', 'Times New Roman', 'Fontsize', 9);
%             % set(gcf,'Position',[300 300 800 800]);
set(get(gca,'XLabel'),'Fontname', 'Times New Roman','FontSize',9);
set(get(gca,'YLabel'),'Fontname', 'Times New Roman','FontSize',9);
subplot(5,1,3)
% xlabel('$\textup{t}\ [s]$','Interpreter','latex');
ylabel('$\textup{z}\ [m]$','Interpreter','latex');
set(gca, 'Fontname', 'Times New Roman', 'Fontsize', 9);
%             % set(gcf,'Position',[300 300 800 800]);
set(get(gca,'XLabel'),'Fontname', 'Times New Roman','FontSize',9);
set(get(gca,'YLabel'),'Fontname', 'Times New Roman','FontSize',9);

subplot(5,1,4)
% xlabel('$\textup{t}\ [s]$','Interpreter','latex');
ylabel('$\alpha\ [deg]$','Interpreter','latex');
% legend('(11)','(12)')
set(gca, 'Fontname', 'Times New Roman', 'Fontsize', 9);
%             % set(gcf,'Position',[300 300 800 800]);
set(get(gca,'XLabel'),'Fontname', 'Times New Roman','FontSize',9);
set(get(gca,'YLabel'),'Fontname', 'Times New Roman','FontSize',9);
subplot(5,1,5)
xlabel('$\textup{t}\ [s]$','Interpreter','latex');
ylabel('$\beta\ [deg]$','Interpreter','latex');
set(gca, 'Fontname', 'Times New Roman', 'Fontsize', 9);
% set(gcf,'Position',[500 500 800 800]);
% set(gcf,'Position',[0,0,500,500]);
set(gcf,'units', ' centimeters ','Position',[2,2,10.5,8])



figure (2)
subplot(5,2,1)
xticks([0 4 8 12 16])
xticklabels({'0','4','8','12','16'})
% xlabel('$\textup{t}\ [s]$','Interpreter','latex');
ylabel('$\textup{u}_x\ [N]$','Interpreter','latex');

set(gca, 'Fontname', 'Times New Roman', 'Fontsize', 9);
%             % set(gcf,'Position',[300 300 800 800]);
set(get(gca,'XLabel'),'Fontname', 'Times New Roman','FontSize',9);
set(get(gca,'YLabel'),'Fontname', 'Times New Roman','FontSize',9);
subplot(5,2,3)
xticks([0 4 8 12 16])
xticklabels({'0','4','8','12','16'})
% xlabel('$\textup{t}\ [s]$','Interpreter','latex');
ylabel('$\textup{u}_y\ [N]$','Interpreter','latex');
set(gca, 'Fontname', 'Times New Roman', 'Fontsize', 9);
%             % set(gcf,'Position',[300 300 800 800]);
set(get(gca,'XLabel'),'Fontname', 'Times New Roman','FontSize',9);
set(get(gca,'YLabel'),'Fontname', 'Times New Roman','FontSize',9);
subplot(5,2,5)
xticks([0 4 8 12 16])
xticklabels({'0','4','8','12','16'})
% xlabel('$\textup{t}\ [s]$','Interpreter','latex');
ylabel('$\textup{u}_z\ [N]$','Interpreter','latex');
set(gca, 'Fontname', 'Times New Roman', 'Fontsize', 9);
%             % set(gcf,'Position',[300 300 800 800]);
set(get(gca,'XLabel'),'Fontname', 'Times New Roman','FontSize',9);
set(get(gca,'YLabel'),'Fontname', 'Times New Roman','FontSize',9);

subplot(5,2,7)
% xlabel('$\textup{t}\ [s]$','Interpreter','latex');
xticks([0 4 8 12 16])
xticklabels({'0','4','8','12','16'})
ylabel('$\phi_d\ [deg]$','Interpreter','latex');
set(gca, 'Fontname', 'Times New Roman', 'Fontsize', 9);
%             % set(gcf,'Position',[300 300 800 800]);
set(get(gca,'XLabel'),'Fontname', 'Times New Roman','FontSize',9);
set(get(gca,'YLabel'),'Fontname', 'Times New Roman','FontSize',9);
subplot(5,2,9)
xticks([0 4 8 12 16])
xticklabels({'0','4','8','12','16'})
xlabel('$\textup{t}\ [s]$','Interpreter','latex');
ylabel('$\theta_d\ [deg]$','Interpreter','latex');
set(gca, 'Fontname', 'Times New Roman', 'Fontsize', 9);
set(get(gca,'XLabel'),'Fontname', 'Times New Roman','FontSize',9);
set(get(gca,'YLabel'),'Fontname', 'Times New Roman','FontSize',9);

subplot(5,2,2)

% xlabel('$\textup{t}\ [s]$','Interpreter','latex');
ylabel('$\textup{u}_x\ [N]$','Interpreter','latex');

set(gca, 'Fontname', 'Times New Roman', 'Fontsize', 9);
%             % set(gcf,'Position',[300 300 800 800]);
set(get(gca,'XLabel'),'Fontname', 'Times New Roman','FontSize',9);
set(get(gca,'YLabel'),'Fontname', 'Times New Roman','FontSize',9);
subplot(5,2,4)
% xlabel('$\textup{t}\ [s]$','Interpreter','latex');
ylabel('$\textup{u}_y\ [N]$','Interpreter','latex');
set(gca, 'Fontname', 'Times New Roman', 'Fontsize', 9);
%             % set(gcf,'Position',[300 300 800 800]);
set(get(gca,'XLabel'),'Fontname', 'Times New Roman','FontSize',9);
set(get(gca,'YLabel'),'Fontname', 'Times New Roman','FontSize',9);
subplot(5,2,6)
% xlabel('$\textup{t}\ [s]$','Interpreter','latex');
ylabel('$\textup{u}_z\ [N]$','Interpreter','latex');
set(gca, 'Fontname', 'Times New Roman', 'Fontsize', 9);
%             % set(gcf,'Position',[300 300 800 800]);
set(get(gca,'XLabel'),'Fontname', 'Times New Roman','FontSize',9);
set(get(gca,'YLabel'),'Fontname', 'Times New Roman','FontSize',9);

subplot(5,2,8)
% xlabel('$\textup{t}\ [s]$','Interpreter','latex');

ylabel('$\phi_d\ [deg]$','Interpreter','latex');
set(gca, 'Fontname', 'Times New Roman', 'Fontsize', 9);
%             % set(gcf,'Position',[300 300 800 800]);
set(get(gca,'XLabel'),'Fontname', 'Times New Roman','FontSize',9);
set(get(gca,'YLabel'),'Fontname', 'Times New Roman','FontSize',9);

subplot(5,2,10)
xlabel('$\textup{t}\ [s]$','Interpreter','latex');
ylabel('$\theta_d\ [deg]$','Interpreter','latex');
set(gca, 'Fontname', 'Times New Roman', 'Fontsize', 9);
set(get(gca,'XLabel'),'Fontname', 'Times New Roman','FontSize',9);
set(get(gca,'YLabel'),'Fontname', 'Times New Roman','FontSize',9);
set(gcf,'units', ' centimeters ','Position',[2,2,10.5,10])


figure (3)
set(gcf,'units', ' centimeters ','Position',[2,2,10.5,10])
subplot(3,1,1)
% xlabel('$\textup{t}\ [s]$','Interpreter','latex');
ylabel('${s_x}$','Interpreter','latex');

set(gca, 'Fontname', 'Times New Roman', 'Fontsize', 9);
%             % set(gcf,'Position',[300 300 800 800]);
set(get(gca,'XLabel'),'Fontname', 'Times New Roman','FontSize',9);
set(get(gca,'YLabel'),'Fontname', 'Times New Roman','FontSize',9);
legend('(28)','Orientation','Horizon')
subplot(3,1,2)
% xlabel('$\textup{t}\ [s]$','Interpreter','latex');
ylabel('${s_y}$','Interpreter','latex');
set(gca, 'Fontname', 'Times New Roman', 'Fontsize', 9);
%             % set(gcf,'Position',[300 300 800 800]);
set(get(gca,'XLabel'),'Fontname', 'Times New Roman','FontSize',9);
set(get(gca,'YLabel'),'Fontname', 'Times New Roman','FontSize',9);
subplot(3,1,3)
 xlabel('$\textup{t}\ [s]$','Interpreter','latex');
ylabel('${s_z}$','Interpreter','latex');
set(gca, 'Fontname', 'Times New Roman', 'Fontsize', 9);
%             % set(gcf,'Position',[300 300 800 800]);
set(get(gca,'XLabel'),'Fontname', 'Times New Roman','FontSize',9);
set(get(gca,'YLabel'),'Fontname', 'Times New Roman','FontSize',9);

figure (4)
set(gcf,'units', ' centimeters ','Position',[2,2,10.5,10])
subplot(3,1,1)
% xlabel('$\textup{t}\ [s]$','Interpreter','latex');
ylabel('${e_{dx}}$','Interpreter','latex');

set(gca, 'Fontname', 'Times New Roman', 'Fontsize', 9);
%             % set(gcf,'Position',[300 300 800 800]);
set(get(gca,'XLabel'),'Fontname', 'Times New Roman','FontSize',9);
set(get(gca,'YLabel'),'Fontname', 'Times New Roman','FontSize',9);
% legend('(28)','Orientation','Horizon')
subplot(3,1,2)
% xlabel('$\textup{t}\ [s]$','Interpreter','latex');
ylabel('${e_{dy}}$','Interpreter','latex');
set(gca, 'Fontname', 'Times New Roman', 'Fontsize', 9);
%             % set(gcf,'Position',[300 300 800 800]);
set(get(gca,'XLabel'),'Fontname', 'Times New Roman','FontSize',9);
set(get(gca,'YLabel'),'Fontname', 'Times New Roman','FontSize',9);
subplot(3,1,3)
 xlabel('$\textup{t}\ [s]$','Interpreter','latex');
ylabel('${e_{dz}}$','Interpreter','latex');
set(gca, 'Fontname', 'Times New Roman', 'Fontsize', 9);
%             % set(gcf,'Position',[300 300 800 800]);
set(get(gca,'XLabel'),'Fontname', 'Times New Roman','FontSize',9);
set(get(gca,'YLabel'),'Fontname', 'Times New Roman','FontSize',9);