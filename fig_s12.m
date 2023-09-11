clear

load('test_control_SMC_1.mat')

figure('color','w','Position', [100 100 1800 1800]),
ax=subplot(431),

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
set(gca,'fontsize', 20),
set(gca,'linewidth',2);
yticks([-0.6 -0.3 0 0.2]);
ylim([-0.7 0.2]);
%%
dc=zeros(length(cp_208_regr),1);
dc(idx_s1)=1;
dc(idx_s2)=2;
dc(idx_s3)=3;

[B,dev,stats] = mnrfit(cp_208_regr,dc,'model','ordinal')
stats.p(end)

%%
ax=subplot(432),
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

ax=subplot(434),
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

ax=subplot(435),
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


ax=subplot(436),
[r2,p2]=corr(cp_s2,csf_p_tau_s2,'rows','pairwise','type','spearman'),
plot(cp_s2,csf_p_tau_s2,'.','MarkerSize',30,'Color',[0.8500 0.3250 0.0980]),
title(['r2=',num2str(r2),'  p2=',num2str(p2)]),
xlim([-.8 .4]),xticks([-0.8 -0.4 0 0.4])
h2 = lsline(ax);
h2.LineWidth = 3;
h2.Color = 'k';
set(gca,'fontsize', 20),
set(gca,'linewidth',3),
box off,



%%
clear
longi=load('test_control_SMC_2.mat')



ax=subplot(433),
[r2,p2]=corr(longi.cp_s2,longi.suvr_longi_s2,'rows','pairwise','type','spearman'),
plot(longi.cp_s2,longi.suvr_longi_s2,'.','MarkerSize',30,'Color',[0.8500 0.3250 0.0980]),
title(['r2=',num2str(r2),'  p2=',num2str(p2)]),
xlim([-.8 .4]),xticks([-0.8 -0.4 0 0.4]),%ylim([-0.02 0.08])
h2 = lsline(ax);
h2.LineWidth = 3;
h2.Color = 'k';
set(gca,'fontsize', 20),
set(gca,'linewidth',3),
box off,
%%
clear
load('test_control_SMC_3.mat')

[r12_tmp,p12_tmp]=corr((tmp1),(tmp2),'rows','pairwise','type','spearman'),%palm_inormal%
[r12_tmp2,p12_tmp2]=corr((tmp3),(tmp4),'rows','pairwise','type','spearman'),%

ax=subplot(437),
plot(tmp1,tmp2,'.','MarkerSize',30,'MarkerEdgeColor',[1 0.0 0.0]), %
title(['r=',num2str(r12_tmp),'p=',num2str(p12_tmp)]),yticks([0 0.04 0.08]),xlim([-0.5 .2])
h2 = lsline(ax);
h2.LineWidth = 3;
h2.Color = 'k';
set(gca,'fontsize', 20),
set(gca,'linewidth',3),
box off,

ax=subplot(438),
plot(tmp3,tmp4,'.','MarkerSize',30,'MarkerEdgeColor',[0 0 1]), 
title(['r=',num2str(r12_tmp2),'p=',num2str(p12_tmp2)]),yticks([-0.03 0 0.03 0.06]),xlim([-0.5 .2])
h2 = lsline(ax);
h2.LineWidth = 3;
h2.Color = 'k';
set(gca,'fontsize', 20),
set(gca,'linewidth',3),
box off,ylim([-0.02 0.06])
%% fig3
load('test_control_SMC_4.mat')


ax=subplot(439),
[r2,p2]=corr(longi_pet_diff_sj_E_s2,(r_test2_s2_regr),'rows','pairwise','type','spearman')%
plot(longi_pet_diff_sj_E_s2,(r_test2_s2_regr'),'.','MarkerSize',30,'MarkerEdgeColor',[0.8500 0.3250 0.0980]), 
title(['r=',num2str(r2),'p=',num2str(p2)])
h2 = lsline(ax);
h2.LineWidth = 3;
h2.Color = 'k';
set(gca,'fontsize', 20),
set(gca,'linewidth',3),
box off,
%%
clear
load('fig4_control_SMC.mat')

ax=subplot(4,3,10),
[r2,p2]=corr((csf_abeta_s2),(fc_dmn_gs_s2),'rows','pairwise','type','spearman'),%,'type','spearman'%%palm_inormal
plot(csf_abeta_s2,fc_dmn_gs_s2,'.','MarkerSize',30,'Color',[1 0 0]),

h2 = lsline(ax);
h2.LineWidth = 3;
h2.Color = 'k';

hold on,
[r2,p2]=corr((csf_abeta_s2),fc_dmn_gsr_s2,'rows','pairwise','type','spearman'),
plot(csf_abeta_s2,fc_dmn_gsr_s2,'o','MarkerSize',8,'Color',[1, 0, 0, 0.1]),
lsline,

set(gca,'fontsize', 20),
set(gca,'linewidth',3),
box off,



%% test 4


ax=subplot(4,3,11),
[r2,p2]=corr((csf_abeta_s2),(fc_sm_gs_s2),'rows','pairwise','type','spearman'),
plot(csf_abeta_s2,fc_sm_gs_s2,'.','MarkerSize',30,'Color',[0 0 .9]),

h2 = lsline(ax);
h2.LineWidth = 3;
h2.Color = 'k';

hold on,
[r2,p2]=corr((csf_abeta_s2),fc_sm_gsr_s2,'rows','pairwise','type','spearman'),
plot(csf_abeta_s2,fc_sm_gsr_s2,'o','MarkerSize',8,'Color',[0, 0, 0.9]),
lsline,

set(gca,'fontsize', 20),
set(gca,'linewidth',3),
box off,


%% test 5


ax=subplot(4,3,12),
[r2,p2]=corr((csf_abeta_s2),(fc_sm_dmn_gs_s2),'rows','pairwise','type','spearman'),%,'type','spearman'%%palm_inormal
plot(csf_abeta_s2,fc_sm_dmn_gs_s2,'.','MarkerSize',30,'Color',[0.8500 0.3250 0.0980]),

h2 = lsline(ax);
h2.LineWidth = 3;
h2.Color = 'k';

hold on,
[r2,p2]=corr((csf_abeta_s2),fc_sm_dmn_gsr_s2,'rows','pairwise','type','spearman'),
plot(csf_abeta_s2,fc_sm_dmn_gsr_s2,'o','MarkerSize',8,'Color',[0.8500 0.3250 0.0980]),
lsline,

set(gca,'fontsize', 20),
set(gca,'linewidth',3),
box off,
