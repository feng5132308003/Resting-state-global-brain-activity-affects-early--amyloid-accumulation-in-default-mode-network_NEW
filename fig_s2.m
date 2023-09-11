%% figure 1-1
clear
tmp1=readtable('cp_144.xlsx');

tmp2=double(string(table2cell(tmp1(:,[2:7]))));

cp_208_regr=tmp2(:,1);% the coupling, adjusted with age and gender
dc=tmp2(:,2); % diease condition
cor_abeta_suvr_comp_208_sj_E2=tmp2(:,3);% cortical abeta SUVR
csf_abeta_208_sj_E2=tmp2(:,4);% csf abeta
csf_tau_208_sj_E2=tmp2(:,5);%csf tau
csf_p_tau_208_sj_E2=tmp2(:,6);%csf p-tau


idx_s1=find(dc==1);
idx_s2=find(dc==2);
idx_s3=find(dc==3);

cp_s2=cp_208_regr(idx_s2);
ab_s2=cor_abeta_suvr_comp_208_sj_E2(idx_s2);
csf_ab_s2=csf_abeta_208_sj_E2(idx_s2);
csf_tau_s2=csf_tau_208_sj_E2(idx_s2);
csf_ptau_s2=csf_p_tau_208_sj_E2(idx_s2);

%%

figure('color','w','Position', [500 500 1800 800]),
ax=subplot(231),
[r1,p1]=corr(ab_s2,csf_ab_s2,'rows','pairwise','type','spearman');
plot(ab_s2,csf_ab_s2,'.','MarkerSize',30,'MarkerEdgeColor',[0.6350 0.6350 0.6350]),
title(['r1=',num2str(r1),'  p1=',num2str(p1)]),
%xlim([-.8 .4]),xticks([-0.8 -0.4 0 0.4])
h2 = lsline(ax);
h2.LineWidth = 3;
h2.Color = 'k';
set(gca,'fontsize', 20),
set(gca,'linewidth',3),
box off,

ax=subplot(232),
[r1,p1]=corr(ab_s2,csf_tau_s2,'rows','pairwise','type','spearman');
plot(ab_s2,csf_tau_s2,'.','MarkerSize',30,'MarkerEdgeColor',[0.6350 0.6350 0.6350]),
title(['r1=',num2str(r1),'  p1=',num2str(p1)]),
%xlim([-.8 .4]),xticks([-0.8 -0.4 0 0.4])
h2 = lsline(ax);
h2.LineWidth = 3;
h2.Color = 'k';
set(gca,'fontsize', 20),
set(gca,'linewidth',3),
box off,


ax=subplot(233),
[r1,p1]=corr(ab_s2,csf_ptau_s2,'rows','pairwise','type','spearman');
plot(ab_s2,csf_ptau_s2,'.','MarkerSize',30,'MarkerEdgeColor',[0.6350 0.6350 0.6350]),
title(['r1=',num2str(r1),'  p1=',num2str(p1)]),
%xlim([-.8 .4]),xticks([-0.8 -0.4 0 0.4])
h2 = lsline(ax);
h2.LineWidth = 3;
h2.Color = 'k';
set(gca,'fontsize', 20),
set(gca,'linewidth',3),
box off,
%%
conf3=[(ab_s2)];
conf4=[ones(size(conf3,1),1),conf3];
cp_s2_regr_abeta=(diag(ones(size(conf4,1),1))-conf4*inv(conf4'*conf4)*(conf4)')*cp_s2+nanmean(cp_s2);

ax=subplot(234),
[r1,p1]=corr(cp_s2_regr_abeta,csf_ab_s2,'rows','pairwise','type','spearman');
plot(cp_s2_regr_abeta,csf_ab_s2,'.','MarkerSize',30,'MarkerEdgeColor',[0.6350 0.6350 0.6350]),
title(['r1=',num2str(r1),'  p1=',num2str(p1)]),
xlim([-.8 .4]),xticks([-0.8 -0.4 0 0.4])
h2 = lsline(ax);
h2.LineWidth = 3;
h2.Color = 'k';
set(gca,'fontsize', 20),
set(gca,'linewidth',3),
box off,

ax=subplot(235),
[r1,p1]=corr(cp_s2_regr_abeta,csf_tau_s2,'rows','pairwise','type','spearman');
plot(cp_s2_regr_abeta,csf_tau_s2,'.','MarkerSize',30,'MarkerEdgeColor',[0.6350 0.6350 0.6350]),
title(['r1=',num2str(r1),'  p1=',num2str(p1)]),
xlim([-.8 .4]),xticks([-0.8 -0.4 0 0.4])
h2 = lsline(ax);
h2.LineWidth = 3;
h2.Color = 'k';
set(gca,'fontsize', 20),
set(gca,'linewidth',3),
box off,


ax=subplot(236),
[r1,p1]=corr(cp_s2_regr_abeta,csf_ptau_s2,'rows','pairwise','type','spearman');
plot(cp_s2_regr_abeta,csf_ptau_s2,'.','MarkerSize',30,'MarkerEdgeColor',[0.6350 0.6350 0.6350]),
title(['r1=',num2str(r1),'  p1=',num2str(p1)]),
xlim([-.8 .4]),xticks([-0.8 -0.4 0 0.4])
h2 = lsline(ax);
h2.LineWidth = 3;
h2.Color = 'k';
set(gca,'fontsize', 20),
set(gca,'linewidth',3),
box off,

