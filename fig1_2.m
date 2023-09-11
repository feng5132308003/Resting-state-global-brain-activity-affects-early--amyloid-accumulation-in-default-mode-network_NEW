
%% figure 1-2
clear
tmp1=readtable('cp_112.xlsx');

tmp2=double(string(table2cell(tmp1(:,[2:4]))));

cp_112_regr=tmp2(:,1);% the coupling, adjusted with age and gender
dc=tmp2(:,2); % diease condition
longi_cor_abeta_suvr_112=tmp2(:,3);% longi cortical abeta SUVR


idx_s1=find(dc==1);
idx_s2=find(dc==2);
idx_s3=find(dc==3);
%%
suvr_longi_s1=longi_cor_abeta_suvr_112(idx_s1);
suvr_longi_s2=longi_cor_abeta_suvr_112(idx_s2);
suvr_longi_s3=longi_cor_abeta_suvr_112(idx_s3);

cp_s1=cp_112_regr(idx_s1);
cp_s2=cp_112_regr(idx_s2);
cp_s3=cp_112_regr(idx_s3);

figure('color','w','Position', [500 500 1800 550]),
ax=subplot(352),
[r1,p1]=corr(cp_s1,suvr_longi_s1,'rows','pairwise','type','spearman')
plot(cp_s1,suvr_longi_s1,'.','MarkerSize',30,'Color',[0.6350 0.6350 0.6350]),
title(['r1=',num2str(r1),'  p1=',num2str(p1)]),
xlim([-.8 .4]),xticks([-0.8 -0.4 0 0.4])
h2 = lsline(ax);
h2.LineWidth = 3;
h2.Color = 'k';
set(gca,'fontsize', 30),
set(gca,'linewidth',3),
box off,

ax=subplot(357),
[r2,p2]=corr(cp_s2,suvr_longi_s2,'rows','pairwise','type','spearman'),%,'type','spearman'
plot(cp_s2,suvr_longi_s2,'.','MarkerSize',30,'Color',[0.8500 0.3250 0.0980]),
title(['r2=',num2str(r2),'  p2=',num2str(p2)]),
xlim([-.8 .4]),xticks([-0.8 -0.4 0 0.4]),ylim([-0.02 0.08])
h2 = lsline(ax);
h2.LineWidth = 3;
h2.Color = 'k';
set(gca,'fontsize', 30),
set(gca,'linewidth',3),
box off,

ax=subplot(3,5,12),
[r3,p3]=corr(cp_s3,suvr_longi_s3,'rows','pairwise','type','spearman')%
plot(cp_s3,suvr_longi_s3,'.','MarkerSize',30,'Color',[0 0.4470 0.7410]),
title(['r3=',num2str(r3),'  p3=',num2str(p3)]),
xlim([-.8 .4]),xticks([-0.8 -0.4 0 0.4]),%ylim([-0.02 0.08])
h2 = lsline(ax);
h2.LineWidth = 3;
h2.Color = 'k';
set(gca,'fontsize', 30),
set(gca,'linewidth',3),
box off,