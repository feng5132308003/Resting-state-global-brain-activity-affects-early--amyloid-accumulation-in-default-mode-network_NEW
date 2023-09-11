
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
%%

cp_s1=cp_208_regr(idx_s1);
cp_s2=cp_208_regr(idx_s2);
cp_s3=cp_208_regr(idx_s3);


 [~,p1,~,tstat1]=ttest2(cp_s2,cp_s1)
 [~,p2,~,tstat2]=ttest2(cp_s3,cp_s1)
 [~,p3,~,tstat3]=ttest2(cp_s3,cp_s2)

group=[ones(size(cp_s1));2*ones(size(cp_s2));3*ones(size(cp_s3))];
colors(3,:)=[0.6350 0.6350 0.6350];
colors(2,:)=[0.8500 0.3250 0.0980];
colors(1,:)=[0 0.4470 0.7410];

h=boxplot([cp_s1;cp_s2;cp_s3],group,'Notch','on','Widths',0.5);
set(h,'linewidth',2,'Color',[0.5 0.5 0.5])
set(gca,'XTickLabel',{'s1','s2','s3'});
h2=findobj(gca,'Tag','Box');
for j=1:3
    patch(get(h2(j),'Xdata'),get(h2(j),'YData'), colors(j,:),'FaceAlpha',0.8);
end
set(gca,'fontsize', 30),
set(gca,'linewidth',2);
yticks([-0.6 -0.3 0 0.3]);
ylim([-0.7 0.3]);


%%


[B,dev,stats] = mnrfit(cp_208_regr,dc,'model','ordinal')
stats.p(end)

%[r,p]=corr(cp_208_regr,dc)
%%
suvr_s1=cor_abeta_suvr_comp_208_sj_E2(idx_s1);
suvr_s2=cor_abeta_suvr_comp_208_sj_E2(idx_s2);
suvr_s3=cor_abeta_suvr_comp_208_sj_E2(idx_s3);


figure('color','w','Position', [500 500 1800 2500]),
ax=subplot(351),
[r1,p1]=corr(cp_s1,suvr_s1,'rows','pairwise','type','spearman');
plot(cp_s1,suvr_s1,'.','MarkerSize',30,'MarkerEdgeColor',[0.6350 0.6350 0.6350]),
title(['r1=',num2str(r1),'  p1=',num2str(p1)]),
xlim([-.8 .4]),xticks([-0.8 -0.4 0 0.4])
h2 = lsline(ax);
h2.LineWidth = 3;
h2.Color = 'k';
set(gca,'fontsize', 20),
set(gca,'linewidth',3),
box off,

ax=subplot(356),
[r2,p2]=corr(cp_s2,suvr_s2,'rows','pairwise','type','spearman'),%,'type','spearman'
plot(cp_s2,suvr_s2,'.','MarkerSize',30,'MarkerEdgeColor',[0.8500 0.3250 0.0980]),
title(['r2=',num2str(r2),'  p2=',num2str(p2)]),
xlim([-.8 .4]),xticks([-0.8 -0.4 0 0.4])
h2 = lsline(ax);
h2.LineWidth = 3;
h2.Color = 'k';
set(gca,'fontsize', 20),
set(gca,'linewidth',3),
box off,

ax=subplot(3,5,11),
[r3,p3]=corr(cp_s3,suvr_s3,'rows','pairwise','type','spearman');
plot(cp_s3,suvr_s3,'.','MarkerSize',30,'MarkerEdgeColor',[0 0.4470 0.7410]),
title(['r3=',num2str(r3),'  p3=',num2str(p3)]),
xlim([-.8 .4]),xticks([-0.8 -0.4 0 0.4])
h2 = lsline(ax);
h2.LineWidth = 3;
h2.Color = 'k';
set(gca,'fontsize', 20),
set(gca,'linewidth',3),
box off,
%%
csf_abeta_208_lg=log(csf_abeta_208_sj_E2);%

csf_abeta_s1=csf_abeta_208_lg(idx_s1);
csf_abeta_s2=csf_abeta_208_lg(idx_s2);
csf_abeta_s3=csf_abeta_208_lg(idx_s3);

%figure('color','w','Position', [100 100 1800 550]),
ax=subplot(353),
[r1,p1]=corr(cp_s1,csf_abeta_s1,'rows','pairwise','type','spearman');
plot(cp_s1,csf_abeta_s1,'.','MarkerSize',30,'Color',[0.6350 0.6350 0.6350]),
title(['r1=',num2str(r1),'  p1=',num2str(p1)]),
xlim([-.8 .4]),xticks([-0.8 -0.4 0 0.4])
h2 = lsline(ax);
h2.LineWidth = 3;
h2.Color = 'k';
set(gca,'fontsize', 20),
set(gca,'linewidth',3),
box off,

ax=subplot(3,5,8),
[r2,p2]=corr(cp_s2,csf_abeta_s2,'rows','pairwise','type','spearman'),%
plot(cp_s2,csf_abeta_s2,'.','MarkerSize',30,'Color',[0.8500 0.3250 0.0980]),
title(['r2=',num2str(r2),'  p2=',num2str(p2)]),
xlim([-.8 .4]),xticks([-0.8 -0.4 0 0.4])
h2 = lsline(ax);
h2.LineWidth = 3;
h2.Color = 'k';
set(gca,'fontsize', 20),
set(gca,'linewidth',3),
box off,

ax=subplot(3,5,13),
[r3,p3]=corr(cp_s3,csf_abeta_s3,'rows','pairwise','type','spearman');
plot(cp_s3,csf_abeta_s3,'.','MarkerSize',30,'Color',[0 0.4470 0.7410]),
title(['r3=',num2str(r3),'  p3=',num2str(p3)]),
xlim([-.8 .4]),xticks([-0.8 -0.4 0 0.4]),ylim([4.4 5.3]),
h2 = lsline(ax);
h2.LineWidth = 3;
h2.Color = 'k';
set(gca,'fontsize', 20),
set(gca,'linewidth',3),
box off,


%%
lii=1;

csf_tau_208_lg=log(csf_tau_208_sj_E2);%

csf_tau_s1=csf_tau_208_lg(idx_s1,lii);
csf_tau_s2=csf_tau_208_lg(idx_s2,lii);
csf_tau_s3=csf_tau_208_lg(idx_s3,lii);


%figure('color','w','Position', [500 500 1800 550]),
ax=subplot(3,5,4),
[r1,p1]=corr(cp_s1,csf_tau_s1,'rows','pairwise','type','spearman');
plot(cp_s1,csf_tau_s1,'.','MarkerSize',30,'MarkerEdgeColor',[0.6350 0.6350 0.6350]),
title(['r1=',num2str(r1),'  p1=',num2str(p1)]),
xlim([-.8 .4]),xticks([-0.8 -0.4 0 0.4])
h2 = lsline(ax);
h2.LineWidth = 3;
h2.Color = 'k';
set(gca,'fontsize', 20),
set(gca,'linewidth',3),
box off,

ax=subplot(3,5,9),
[r2,p2]=corr(cp_s2,csf_tau_s2,'rows','pairwise','type','spearman'),%
plot(cp_s2,csf_tau_s2,'.','MarkerSize',30,'Color',[0.8500 0.3250 0.0980]),
title(['r2=',num2str(r2),'  p2=',num2str(p2)]),
xlim([-.8 .4]),xticks([-0.8 -0.4 0 0.4])
h2 = lsline(ax);
h2.LineWidth = 3;
h2.Color = 'k';
set(gca,'fontsize', 20),
set(gca,'linewidth',3),
box off,

ax=subplot(3,5,14),
[r3,p3]=corr(cp_s3,csf_tau_s3,'rows','pairwise','type','spearman');
plot(cp_s3,csf_tau_s3,'.','MarkerSize',30,'Color',[0 0.4470 0.7410]),
title(['r3=',num2str(r3),'  p3=',num2str(p3)]),
xlim([-.8 .4]),xticks([-0.8 -0.4 0 0.4]),ylim([3.5 6.2]),
h2 = lsline(ax);
h2.LineWidth = 3;
h2.Color = 'k';
set(gca,'fontsize', 20),
set(gca,'linewidth',2.6),
box off,
%%

csf_p_tau_208_lg=log(csf_p_tau_208_sj_E2);%

csf_ptau_s1=csf_p_tau_208_lg(idx_s1,lii);
csf_ptau_s2=csf_p_tau_208_lg(idx_s2,lii);
csf_ptau_s3=csf_p_tau_208_lg(idx_s3,lii);


%figure('color','w','Position', [500 500 1800 550]),
ax=subplot(3,5,5),
[r1,p1]=corr(cp_s1,csf_ptau_s1,'rows','pairwise','type','spearman');
plot(cp_s1,csf_ptau_s1,'.','MarkerSize',30,'MarkerEdgeColor',[0.6350 0.6350 0.6350]),
title(['r1=',num2str(r1),'  p1=',num2str(p1)]),
xlim([-.8 .4]),xticks([-0.8 -0.4 0 0.4])
h2 = lsline(ax);
h2.LineWidth = 3;
h2.Color = 'k';
set(gca,'fontsize', 20),
set(gca,'linewidth',3),
box off,

ax=subplot(3,5,10),
[r2,p2]=corr(cp_s2,csf_ptau_s2,'rows','pairwise','type','spearman'),%,'type','spearman'
plot(cp_s2,csf_ptau_s2,'.','MarkerSize',30,'Color',[0.8500 0.3250 0.0980]),
title(['r2=',num2str(r2),'  p2=',num2str(p2)]),
xlim([-.8 .4]),xticks([-0.8 -0.4 0 0.4])
h2 = lsline(ax);
h2.LineWidth = 3;
h2.Color = 'k';
set(gca,'fontsize', 20),
set(gca,'linewidth',3),
box off,

ax=subplot(3,5,15),
[r3,p3]=corr(cp_s3,csf_ptau_s3,'rows','pairwise','type','spearman');
plot(cp_s3,csf_ptau_s3,'.','MarkerSize',30,'Color',[0 0.4470 0.7410]),
title(['r3=',num2str(r3),'  p3=',num2str(p3)]),
xlim([-.8 .4]),xticks([-0.8 -0.4 0 0.4]),ylim([2.5 5.2]),
h2 = lsline(ax);
h2.LineWidth = 3;
h2.Color = 'k';
set(gca,'fontsize', 20),
set(gca,'linewidth',3),
box off,


%%
figure('color','w','Position', [10 10 800 400]),

[r,p]=corr(cor_abeta_suvr_comp_208_sj_E2,csf_abeta_208_sj_E2,'rows','pairwise');
ax=subplot(121),plot(cor_abeta_suvr_comp_208_sj_E2,csf_abeta_208_sj_E2,'.','MarkerSize',30,'Color',[0 0 0]),
h2 = lsline(ax);
h2.LineWidth = 3;
h2.Color = 'k';
title(['r123=',num2str(r),'  p123=',num2str(p)]),
hold on,
plot(suvr_s1,csf_abeta_208_sj_E2(idx_s1),'.','MarkerSize',30,'Color',[0.6350 0.6350 0.6350]),
plot(suvr_s2,csf_abeta_208_sj_E2(idx_s2),'.','MarkerSize',30,'Color',[0.8500 0.3250 0.0980]),
plot(suvr_s3,csf_abeta_208_sj_E2(idx_s3),'.','MarkerSize',30,'Color',[0 0.4470 0.7410]),
hline(192),vline(0.872)
set(gca,'fontsize', 20),
set(gca,'linewidth',3),
box off,
xlim([0.6 1.4]),