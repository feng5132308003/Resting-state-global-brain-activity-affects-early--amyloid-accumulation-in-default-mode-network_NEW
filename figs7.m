clear
load('cp_raw_144.mat','cp_gBOLD_CSF_raw208_sj_E2','age_tmp_208_sj_E2','gender_all_208_sj_E2','id_subj_early2','mean_fd_early','idx_s*')
conf3=[(age_tmp_208_sj_E2) (gender_all_208_sj_E2)];

conf4=[ones(size(conf3,1),1),conf3];
cp_208_regr=(diag(ones(size(conf4,1),1))-conf4*inv(conf4'*conf4)*(conf4)')*cp_gBOLD_CSF_raw208_sj_E2+nanmean(cp_gBOLD_CSF_raw208_sj_E2);
%%
idx_motion_low=find(mean_fd_early<=0.5);
mean_fd_early=mean_fd_early(idx_motion_low);
%%

cp_s1=mean_fd_early(idx_s1);
cp_s2=mean_fd_early(idx_s2);
cp_s3=mean_fd_early(idx_s3);


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
yticks([0 0.3 0.6]);
ylim([0 0.6]);
%%

figure('color','w','Position', [500 500 500 500]),
ax=subplot(121),
[r1,p1]=corr(mean_fd_early,cp_208_regr,'rows','pairwise','type','spearman');
plot(mean_fd_early,cp_208_regr,'.','MarkerSize',30,'MarkerEdgeColor',[0.6350 0.6350 0.6350]),
title(['r1=',num2str(r1),'  p1=',num2str(p1)]),
%xlim([-.8 .4]),xticks([-0.8 -0.4 0 0.4])
h2 = lsline(ax);
h2.LineWidth = 3;
h2.Color = 'k';
set(gca,'fontsize', 20),
set(gca,'linewidth',3),
box off,
hold on,
plot(cp_s1,cp_208_regr(idx_s1),'.','MarkerSize',30,'Color',[0.6350 0.6350 0.6350]),
plot(cp_s2,cp_208_regr(idx_s2),'.','MarkerSize',30,'Color',[0.8500 0.3250 0.0980]),
plot(cp_s3,cp_208_regr(idx_s3),'.','MarkerSize',30,'Color',[0 0.4470 0.7410]),