%% fig 4

%%
clear
tmp1=readtable('fig_4.xlsx');

tmp_all=double(string(table2cell(tmp1(:,[2:8]))));

csf_abeta_s2=tmp_all(:,1);

fc_dmn_gs_s2=tmp_all(:,2);% fc within higher-order,with gbold
fc_dmn_gsr_s2=tmp_all(:,3);% fc within higher-order,no gbold

fc_sm_gs_s2=tmp_all(:,4);% fc within lower-order,with gbold
fc_sm_gsr_s2=tmp_all(:,5);% fc within lower-order,no gbold

fc_sm_dmn_gs_s2=tmp_all(:,6);% fc between higher and lower -order,with gbold
fc_sm_dmn_gsr_s2=tmp_all(:,7);% fc between higher and lower -order,no gbold
%% 



figure('color','w','Position', [10 10 1800 550]),
ax=subplot(131),
[r2,p2]=corr((csf_abeta_s2),(fc_dmn_gs_s2),'rows','pairwise','type','spearman'),%,'type','spearman'%%palm_inormal
plot(csf_abeta_s2,fc_dmn_gs_s2,'.','MarkerSize',30,'Color',[1 0 0]),

h2 = lsline(ax);
h2.LineWidth = 3;
h2.Color = 'k';

hold on,
[r2,p2]=corr((csf_abeta_s2),fc_dmn_gsr_s2,'rows','pairwise','type','spearman'),
plot(csf_abeta_s2,fc_dmn_gsr_s2,'o','MarkerSize',8,'Color',[1, 0, 0, 0.1]),
lsline,

set(gca,'fontsize', 30),
set(gca,'linewidth',3),
box off,



%%


ax=subplot(132),
[r2,p2]=corr((csf_abeta_s2),(fc_sm_gs_s2),'rows','pairwise','type','spearman'),
plot(csf_abeta_s2,fc_sm_gs_s2,'.','MarkerSize',30,'Color',[0 0 .9]),

h2 = lsline(ax);
h2.LineWidth = 3;
h2.Color = 'k';

hold on,
[r2,p2]=corr((csf_abeta_s2),fc_sm_gsr_s2,'rows','pairwise','type','spearman'),
plot(csf_abeta_s2,fc_sm_gsr_s2,'o','MarkerSize',8,'Color',[0, 0, 0.9]),
lsline,

set(gca,'fontsize', 30),
set(gca,'linewidth',3),
box off,


%% 


ax=subplot(133),
[r2,p2]=corr((csf_abeta_s2),(fc_sm_dmn_gs_s2),'rows','pairwise','type','spearman'),
plot(csf_abeta_s2,fc_sm_dmn_gs_s2,'.','MarkerSize',30,'Color',[0.8500 0.3250 0.0980]),

h2 = lsline(ax);
h2.LineWidth = 3;
h2.Color = 'k';

hold on,
[r2,p2]=corr((csf_abeta_s2),fc_sm_dmn_gsr_s2,'rows','pairwise','type','spearman'),
plot(csf_abeta_s2,fc_sm_dmn_gsr_s2,'o','MarkerSize',8,'Color',[0.8500 0.3250 0.0980]),
lsline,

set(gca,'fontsize', 30),
set(gca,'linewidth',3),
box off,

