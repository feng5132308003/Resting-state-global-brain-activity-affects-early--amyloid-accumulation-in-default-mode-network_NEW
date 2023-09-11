load('fig_s11_new.mat','longi_pet_diff_sj_E_s2','r_test2_s2')

figure('color','w'),
ax=subplot(121),
[r2,p2]=corr(longi_pet_diff_sj_E_s2,(r_test2_s2),'rows','pairwise','type','spearman')%
plot(longi_pet_diff_sj_E_s2,(r_test2_s2'),'.','MarkerSize',30,'MarkerEdgeColor',[0.8500 0.3250 0.0980]), 
title(['r=',num2str(r2),'p=',num2str(p2)])
h2 = lsline(ax);
h2.LineWidth = 3;
h2.Color = 'k';
set(gca,'fontsize', 20),
set(gca,'linewidth',3),
box off,

