
close all
%% 
clear
tmp1=readtable('cp_144.xlsx');

tmp2=double(string(table2cell(tmp1(:,[2:7]))));

cp_208_regr=tmp2(:,1);% the coupling, adjusted with age and gender
dc=tmp2(:,2); % diease condition
cor_abeta_suvr_comp_208_sj_E2=tmp2(:,3);% cortical abeta SUVR
csf_abeta_208_sj_E2=tmp2(:,4);% csf abeta
csf_tau_208_sj_E2=tmp2(:,5);%csf tau
csf_p_tau_208_sj_E2=tmp2(:,6);%csf p-tau

%%
load('bp_144.mat','id_144_2','bp_144_2')

idx_nan_bp=find(isnan(bp_144_2(:,1)));

cp_208_regr(idx_nan_bp)=[];
dc(idx_nan_bp)=[];
cor_abeta_suvr_comp_208_sj_E2(idx_nan_bp)=[];
csf_abeta_208_sj_E2(idx_nan_bp)=[];
csf_tau_208_sj_E2(idx_nan_bp)=[];
csf_p_tau_208_sj_E2(idx_nan_bp)=[];
bp_142=bp_144_2(:,1);
bp_142(idx_nan_bp)=[];
%%
conf3=[bp_142];
conf4=[ones(size(conf3,1),1),conf3];
cp_208_regr_bp=(diag(ones(size(conf4,1),1))-conf4*inv(conf4'*conf4)*(conf4)')*cp_208_regr+nanmean(cp_208_regr);

%%
idx_s1=find(dc==1);
idx_s2=find(dc==2);
idx_s3=find(dc==3);
%%

cp_s1=cp_208_regr_bp(idx_s1);
cp_s2=cp_208_regr_bp(idx_s2);
cp_s3=cp_208_regr_bp(idx_s3);


figure('color','w'),
subplot(231),
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


[B,dev,stats] = mnrfit(cp_208_regr_bp,dc,'model','ordinal')
stats.p(end)

%[r,p]=corr(cp_208_regr,dc)
%%
suvr_s2=cor_abeta_suvr_comp_208_sj_E2(idx_s2);


ax=subplot(232),
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

%%
csf_abeta_208_lg=log(csf_abeta_208_sj_E2);%

csf_abeta_s2=csf_abeta_208_lg(idx_s2);


ax=subplot(234),
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



%%
lii=1;

csf_tau_208_lg=log(csf_tau_208_sj_E2);%

csf_tau_s2=csf_tau_208_lg(idx_s2,lii);



ax=subplot(235),
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

%%

csf_p_tau_208_lg=log(csf_p_tau_208_sj_E2);%

csf_ptau_s2=csf_p_tau_208_lg(idx_s2,lii);



ax=subplot(236),
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
%% fig 1-2
%% figure 1-2
clear
tmp1=readtable('cp_112.xlsx');

tmp2=double(string(table2cell(tmp1(:,[2:4]))));

cp_112_regr=tmp2(:,1);% the coupling, adjusted with age and gender
dc=tmp2(:,2); % diease condition
longi_cor_abeta_suvr_112=tmp2(:,3);% longi cortical abeta SUVR


idx_s2=find(dc==2);
suvr_longi_s2=longi_cor_abeta_suvr_112(idx_s2);

cp_s2=cp_112_regr(idx_s2);
%%


id_112=table2cell(tmp1(:,[1]));% RID
load('bp_144.mat','id_144_2','bp_144_2')

for li=1:length(id_112)
    idx_112_144(li)=(find(ismember(id_144_2,id_112{li}(2:end-1)))); 
    id_112_2{li}=id_112{li}(2:end-1);
end

bp_19=bp_144_2(idx_112_144(dc==2));
conf3=[bp_19'];

conf4=[ones(size(conf3,1),1),conf3];
cp_s2_regr_bp=(diag(ones(size(conf4,1),1))-conf4*inv(conf4'*conf4)*(conf4)')*cp_s2+nanmean(cp_s2);

%%



ax=subplot(233),
[r2,p2]=corr(cp_s2_regr_bp,suvr_longi_s2,'rows','pairwise','type','spearman'),%,'type','spearman'
plot(cp_s2_regr_bp,suvr_longi_s2,'.','MarkerSize',30,'Color',[0.8500 0.3250 0.0980]),
title(['r2=',num2str(r2),'  p2=',num2str(p2)]),
xlim([-.8 .4]),xticks([-0.8 -0.4 0 0.4]),ylim([-0.02 0.08])
h2 = lsline(ax);
h2.LineWidth = 3;
h2.Color = 'k';
set(gca,'fontsize', 30),
set(gca,'linewidth',3),
box off,


%% fig 2


%%
clear
tmp1=readtable('fig_2C.xlsx');

tmp_all=double(string(table2cell(tmp1(:,[2:5]))));

cp_high=tmp_all(:,1);% the coupling, adjusted with age and gender,high order
longi_pet_high=tmp_all(:,2);% longi_abeta,high order
cp_low=tmp_all(:,3);% the coupling, adjusted with age and gender,low order
longi_pet_low=tmp_all(:,4);%  longi_abeta,low order

%%
id_19=table2cell(tmp1(:,[1]));% RID
load('bp_144.mat','id_144_2','bp_144_2')

for li=1:length(id_19)
    idx_19_144(li)=(find(ismember(id_144_2,id_19{li}(2:end-1)))); 
    id_19_2{li}=id_19{li}(2:end-1);
end


bp_19=bp_144_2(idx_19_144);


%%

conf3=[bp_19'];
conf4=[ones(size(conf3,1),1),conf3];
cp_high_regr_bp=(diag(ones(size(conf4,1),1))-conf4*inv(conf4'*conf4)*(conf4)')*cp_high+nanmean(cp_high);
cp_low_regr_bp=(diag(ones(size(conf4,1),1))-conf4*inv(conf4'*conf4)*(conf4)')*cp_low+nanmean(cp_low);

%%
[r12_tmp,p12_tmp]=corr((cp_high_regr_bp),(longi_pet_high),'rows','pairwise','type','spearman'),
[r12_tmp2,p12_tmp2]=corr((cp_low_regr_bp),(longi_pet_low),'rows','pairwise','type','spearman'),

figure('color','w'),
ax=subplot(231),
plot(cp_high_regr_bp,longi_pet_high,'.','MarkerSize',30,'MarkerEdgeColor',[1 0.0 0.0]), %
title(['r=',num2str(r12_tmp),'p=',num2str(p12_tmp)]),yticks([0 0.04 0.08]),xlim([-0.5 .2])
h2 = lsline(ax);
h2.LineWidth = 3;
h2.Color = 'k';
set(gca,'fontsize', 30),
set(gca,'linewidth',3),
box off,

ax=subplot(232),
plot(cp_low_regr_bp,longi_pet_low,'.','MarkerSize',30,'MarkerEdgeColor',[0 0 1]), 
title(['r=',num2str(r12_tmp2),'p=',num2str(p12_tmp2)]),yticks([-0.03 0 0.03 0.06]),xlim([-0.5 .2])
h2 = lsline(ax);
h2.LineWidth = 3;
h2.Color = 'k';
set(gca,'fontsize', 30),
set(gca,'linewidth',3),
box off,ylim([-0.02 0.06])

%%




%% figure 3D
clear
load('fig3D.mat','longi_pet_diff_sj_E_s2','r_test2_s2','id_subj_s2_19')

load('bp_144.mat','id_144_2','bp_144_2')

for li=1:length(id_subj_s2_19)
    idx_19_144(li)=(find(ismember(id_144_2,id_subj_s2_19{li}))); 
end

bp_19=bp_144_2(idx_19_144);

conf3=[bp_19'];

conf4=[ones(size(conf3,1),1),conf3];
r_test2_s2_regr_bp=(diag(ones(size(conf4,1),1))-conf4*inv(conf4'*conf4)*(conf4)')*r_test2_s2+nanmean(r_test2_s2);


ax=subplot(233),
[r2,p2]=corr(longi_pet_diff_sj_E_s2,(r_test2_s2_regr_bp),'rows','pairwise','type','spearman')%
plot(longi_pet_diff_sj_E_s2,(r_test2_s2_regr_bp'),'.','MarkerSize',30,'MarkerEdgeColor',[0.8500 0.3250 0.0980]), 
title(['r=',num2str(r2),'p=',num2str(p2)])
h2 = lsline(ax);
h2.LineWidth = 3;
h2.Color = 'k';
set(gca,'fontsize', 30),
set(gca,'linewidth',3),
box off,xlim([-.02 .06])


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

id_23=table2cell(tmp1(:,[1]));% RID
load('bp_144.mat','id_144_2','bp_144_2')

for li=1:length(id_23)
    idx_23_144(li)=(find(ismember(id_144_2,id_23{li}(2:end-1)))); 
    id_23_2{li}=id_23{li}(2:end-1);
end

bp_23=bp_144_2(idx_23_144);
conf3=[bp_23'];

conf4=[ones(size(conf3,1),1),conf3];
fc_dmn_gs_s2_regr_bp=(diag(ones(size(conf4,1),1))-conf4*inv(conf4'*conf4)*(conf4)')*fc_dmn_gs_s2+nanmean(fc_dmn_gs_s2);
fc_dmn_gsr_s2_regr_bp=(diag(ones(size(conf4,1),1))-conf4*inv(conf4'*conf4)*(conf4)')*fc_dmn_gsr_s2+nanmean(fc_dmn_gsr_s2);

fc_sm_gs_s2_regr_bp=(diag(ones(size(conf4,1),1))-conf4*inv(conf4'*conf4)*(conf4)')*fc_sm_gs_s2+nanmean(fc_sm_gs_s2);
fc_sm_gsr_s2_regr_bp=(diag(ones(size(conf4,1),1))-conf4*inv(conf4'*conf4)*(conf4)')*fc_sm_gsr_s2+nanmean(fc_sm_gsr_s2);

fc_sm_dmn_gs_s2_regr_bp=(diag(ones(size(conf4,1),1))-conf4*inv(conf4'*conf4)*(conf4)')*fc_sm_dmn_gs_s2+nanmean(fc_sm_dmn_gs_s2);
fc_sm_dmn_gsr_s2_regr_bp=(diag(ones(size(conf4,1),1))-conf4*inv(conf4'*conf4)*(conf4)')*fc_sm_dmn_gsr_s2+nanmean(fc_sm_dmn_gsr_s2);

%%

ax=subplot(234),
[r2,p2]=corr((csf_abeta_s2),(fc_dmn_gs_s2_regr_bp),'rows','pairwise','type','spearman'),%,'type','spearman'%%palm_inormal
plot(csf_abeta_s2,fc_dmn_gs_s2_regr_bp,'.','MarkerSize',30,'Color',[1 0 0]),

h2 = lsline(ax);
h2.LineWidth = 3;
h2.Color = 'k';
title(['r=',num2str(r2),'p=',num2str(p2)])

hold on,
[r2,p2]=corr((csf_abeta_s2),fc_dmn_gsr_s2_regr_bp,'rows','pairwise','type','spearman'),
plot(csf_abeta_s2,fc_dmn_gsr_s2_regr_bp,'o','MarkerSize',8,'Color',[1, 0, 0, 0.1]),
lsline,

set(gca,'fontsize', 30),
set(gca,'linewidth',3),
box off,ylim([0 .8])



%%


ax=subplot(235),
[r2,p2]=corr((csf_abeta_s2),(fc_sm_gs_s2_regr_bp),'rows','pairwise','type','spearman'),
plot(csf_abeta_s2,fc_sm_gs_s2_regr_bp,'.','MarkerSize',30,'Color',[0 0 .9]),

h2 = lsline(ax);
h2.LineWidth = 3;
h2.Color = 'k';
title(['r=',num2str(r2),'p=',num2str(p2)])

hold on,
[r2,p2]=corr((csf_abeta_s2),fc_sm_gsr_s2_regr_bp,'rows','pairwise','type','spearman'),
plot(csf_abeta_s2,fc_sm_gsr_s2_regr_bp,'o','MarkerSize',8,'Color',[0, 0, 0.9]),
lsline,

set(gca,'fontsize', 30),
set(gca,'linewidth',3),
box off,ylim([0 .8])


%% 


ax=subplot(236),
[r2,p2]=corr((csf_abeta_s2),(fc_sm_dmn_gs_s2_regr_bp),'rows','pairwise','type','spearman'),
plot(csf_abeta_s2,fc_sm_dmn_gs_s2_regr_bp,'.','MarkerSize',30,'Color',[0.8500 0.3250 0.0980]),

h2 = lsline(ax);
h2.LineWidth = 3;
h2.Color = 'k';
title(['r=',num2str(r2),'p=',num2str(p2)])

hold on,
[r2,p2]=corr((csf_abeta_s2),fc_sm_dmn_gsr_s2_regr_bp,'rows','pairwise','type','spearman'),
plot(csf_abeta_s2,fc_sm_dmn_gsr_s2_regr_bp,'o','MarkerSize',8,'Color',[0.8500 0.3250 0.0980]),
lsline,

set(gca,'fontsize', 30),
set(gca,'linewidth',3),
box off,ylim([-.2 .6])

