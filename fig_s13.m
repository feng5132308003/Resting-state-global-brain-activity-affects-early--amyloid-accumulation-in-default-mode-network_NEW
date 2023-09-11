clear
load('figs13_new_1.mat','cp_s*','csf_ptau_s*','csf_tau_s*','csf_abeta_s*','suvr_s*','id_test*','cp_208_regr','idx_s*')

cp_s1=cp_208_regr(idx_s1);
cp_s2=cp_208_regr(idx_s2);
cp_s3=cp_208_regr(idx_s3);


figure('color','w'),
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
dc=zeros(length(cp_208_regr),1);
dc(idx_s1)=1;
dc(idx_s2)=2;
dc(idx_s3)=3;

[B,dev,stats] = mnrfit(cp_208_regr,dc,'model','ordinal')
stats.p(end)


%%

figure('color','w','Position', [500 500 1800 2500]),
ax=subplot(251),
[r1,p1]=corr(cp_s1,suvr_s1,'rows','pairwise','type','spearman');
plot(cp_s1,suvr_s1,'.','MarkerSize',30,'MarkerEdgeColor',[0.6350 0.6350 0.6350]),
title(['r1=',num2str(r1),'  p1=',num2str(p1)]),
%xlim([-.8 .4]),xticks([-0.8 -0.4 0 0.4])
h2 = lsline(ax);
h2.LineWidth = 3;
h2.Color = 'k';
set(gca,'fontsize', 20),
set(gca,'linewidth',3),
box off,


ax=subplot(2,5,6),
[r3,p3]=corr(cp_s3,suvr_s3,'rows','pairwise','type','spearman');
plot(cp_s3,suvr_s3,'.','MarkerSize',30,'MarkerEdgeColor',[0 0.4470 0.7410]),
title(['r3=',num2str(r3),'  p3=',num2str(p3)]),
%xlim([-.8 .4]),xticks([-0.8 -0.4 0 0.4])
h2 = lsline(ax);
h2.LineWidth = 3;
h2.Color = 'k';
set(gca,'fontsize', 20),
set(gca,'linewidth',3),
box off,
%%


%figure('color','w','Position', [100 100 1800 550]),
ax=subplot(253),
[r1,p1]=corr(cp_s1,csf_abeta_s1,'rows','pairwise','type','spearman');
plot(cp_s1,csf_abeta_s1,'.','MarkerSize',30,'Color',[0.6350 0.6350 0.6350]),
title(['r1=',num2str(r1),'  p1=',num2str(p1)]),
%xlim([-.8 .4]),xticks([-0.8 -0.4 0 0.4])
h2 = lsline(ax);
h2.LineWidth = 3;
h2.Color = 'k';
set(gca,'fontsize', 20),
set(gca,'linewidth',3),
box off,

ax=subplot(2,5,8),
[r3,p3]=corr(cp_s3,csf_abeta_s3,'rows','pairwise','type','spearman');
plot(cp_s3,csf_abeta_s3,'.','MarkerSize',30,'Color',[0 0.4470 0.7410]),
title(['r3=',num2str(r3),'  p3=',num2str(p3)]),
%xlim([-.8 .4]),xticks([-0.8 -0.4 0 0.4]),ylim([4.4 5.3]),
h2 = lsline(ax);
h2.LineWidth = 3;
h2.Color = 'k';
set(gca,'fontsize', 20),
set(gca,'linewidth',3),
box off,


%%



%figure('color','w','Position', [500 500 1800 550]),
ax=subplot(2,5,4),
[r1,p1]=corr(cp_s1,csf_tau_s1,'rows','pairwise','type','spearman');
plot(cp_s1,csf_tau_s1,'.','MarkerSize',30,'MarkerEdgeColor',[0.6350 0.6350 0.6350]),
title(['r1=',num2str(r1),'  p1=',num2str(p1)]),
%xlim([-.8 .4]),xticks([-0.8 -0.4 0 0.4])
h2 = lsline(ax);
h2.LineWidth = 3;
h2.Color = 'k';
set(gca,'fontsize', 20),
set(gca,'linewidth',3),
box off,

ax=subplot(2,5,9),
[r3,p3]=corr(cp_s3,csf_tau_s3,'rows','pairwise','type','spearman');
plot(cp_s3,csf_tau_s3,'.','MarkerSize',30,'Color',[0 0.4470 0.7410]),
title(['r3=',num2str(r3),'  p3=',num2str(p3)]),
%xlim([-.8 .4]),xticks([-0.8 -0.4 0 0.4]),ylim([3.5 6.2]),
h2 = lsline(ax);
h2.LineWidth = 3;
h2.Color = 'k';
set(gca,'fontsize', 20),
set(gca,'linewidth',2.6),
box off,
%%



%figure('color','w','Position', [500 500 1800 550]),
ax=subplot(2,5,5),
[r1,p1]=corr(cp_s1,csf_ptau_s1,'rows','pairwise','type','spearman');
plot(cp_s1,csf_ptau_s1,'.','MarkerSize',30,'MarkerEdgeColor',[0.6350 0.6350 0.6350]),
title(['r1=',num2str(r1),'  p1=',num2str(p1)]),
%xlim([-.8 .4]),xticks([-0.8 -0.4 0 0.4])
h2 = lsline(ax);
h2.LineWidth = 3;
h2.Color = 'k';
set(gca,'fontsize', 20),
set(gca,'linewidth',3),
box off,


ax=subplot(2,5,10),
[r3,p3]=corr(cp_s3,csf_ptau_s3,'rows','pairwise','type','spearman');
plot(cp_s3,csf_ptau_s3,'.','MarkerSize',30,'Color',[0 0.4470 0.7410]),
title(['r3=',num2str(r3),'  p3=',num2str(p3)]),
%xlim([-.8 .4]),xticks([-0.8 -0.4 0 0.4]),ylim([2.5 5.2]),
h2 = lsline(ax);
h2.LineWidth = 3;
h2.Color = 'k';
set(gca,'fontsize', 20),
set(gca,'linewidth',3),

box off,

%%
longi=load('figs13_new_2.mat','cp_s*','suvr_longi_s*')

ax=subplot(252),
[r1,p1]=corr(longi.cp_s1,longi.suvr_longi_s1,'rows','pairwise','type','spearman')
plot(longi.cp_s1,longi.suvr_longi_s1,'.','MarkerSize',30,'Color',[0.6350 0.6350 0.6350]),
title(['r1=',num2str(r1),'  p1=',num2str(p1)]),
%xlim([-.8 .4]),xticks([-0.8 -0.4 0 0.4])
h2 = lsline(ax);
h2.LineWidth = 3;
h2.Color = 'k';
set(gca,'fontsize', 20),
set(gca,'linewidth',3),
box off,

ax=subplot(2,5,7),
[r3,p3]=corr(longi.cp_s3,longi.suvr_longi_s3,'rows','pairwise','type','spearman')%
plot(longi.cp_s3,longi.suvr_longi_s3,'.','MarkerSize',30,'Color',[0 0.4470 0.7410]),
title(['r3=',num2str(r3),'  p3=',num2str(p3)]),
%xlim([-.8 .4]),xticks([-0.8 -0.4 0 0.4]),%ylim([-0.02 0.08])
h2 = lsline(ax);
h2.LineWidth = 3;
h2.Color = 'k';
set(gca,'fontsize', 20),
set(gca,'linewidth',3),
box off,

