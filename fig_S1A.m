%% 
clear

load('bold_csf_tmp.mat','bold_tmp','csf_tmp');

figure('color','w','position',[100 200 2000 500]),
yyaxis left,
plot(1:130,bold_tmp,'o-','MarkerFaceColor','g','MarkerSize',3,'LineWidth',2),
ylim([-1.2 2.2]);
yyaxis right,
plot(1:130,csf_tmp-1,'o-','MarkerFaceColor','red','MarkerSize',3,'LineWidth',2),
ylim([-1 0.5]),legend('gsl','csf')
ax = gca;
ax.YAxis(1).Color = [0.47 0.67 0.19];%'g'
ax.YAxis(2).Color = 'r';
ax.YAxis(1).LineWidth = 1.5;   
ax.YAxis(2).LineWidth = 1.5;   
set(gca,'linewidth',3),