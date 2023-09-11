clear
%% figure 3D
load('fig3D.mat','longi_pet_diff_sj_E_s2','r_test2_s2','id_subj_s2_19')

figure('color','w','Position', [10 10 500 1000]),
ax=subplot(211),
[r2,p2]=corr(longi_pet_diff_sj_E_s2,(r_test2_s2),'rows','pairwise','type','spearman')%
plot(longi_pet_diff_sj_E_s2,(r_test2_s2'),'.','MarkerSize',30,'MarkerEdgeColor',[0.8500 0.3250 0.0980]), 
title(['r=',num2str(r2),'p=',num2str(p2)])
h2 = lsline(ax);
h2.LineWidth = 3;
h2.Color = 'k';
set(gca,'fontsize', 30),
set(gca,'linewidth',3),
box off,