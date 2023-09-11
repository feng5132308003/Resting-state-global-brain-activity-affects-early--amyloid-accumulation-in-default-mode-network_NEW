clear
load('fig_s1b_replace.mat','r_gs3')
%%

SEM_bold_csf = std(r_gs3')/sqrt(size(r_gs3,2));

figure('color','w'),
ax=subplot(211),
plot([-12:3:12],flip(nanmean(r_gs3')));

e=errorbar([-12:3:12],flip(mean(r_gs3')),SEM_bold_csf,'MarkerSize',10, ...
    'MarkerEdgeColor','red','MarkerFaceColor','red'),
e.Color=[0.6350 0.6350 0.6350];
e.MarkerFaceColor=[0.6350 0.6350 0.6350];
xlim([-12,12]);
h2 = lsline(ax);
h2.LineWidth = 3;
h2.Color = 'k';
set(gca,'fontsize', 30),
set(gca,'linewidth',3),
box off,