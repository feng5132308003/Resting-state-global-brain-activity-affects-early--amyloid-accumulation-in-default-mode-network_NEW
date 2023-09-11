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
[r12_tmp,p12_tmp]=corr((cp_high),(longi_pet_high),'rows','pairwise','type','spearman'),
[r12_tmp2,p12_tmp2]=corr((cp_low),(longi_pet_low),'rows','pairwise','type','spearman'),

figure('color','w','Position', [10 10 1000 500]),
ax=subplot(121),
plot(cp_high,longi_pet_high,'.','MarkerSize',30,'MarkerEdgeColor',[1 0.0 0.0]), %
title(['r=',num2str(r12_tmp),'p=',num2str(p12_tmp)]),yticks([0 0.04 0.08]),xlim([-0.5 .2])
h2 = lsline(ax);
h2.LineWidth = 3;
h2.Color = 'k';
set(gca,'fontsize', 30),
set(gca,'linewidth',3),
box off,

ax=subplot(122),
plot(cp_low,longi_pet_low,'.','MarkerSize',30,'MarkerEdgeColor',[0 0 1]), 
title(['r=',num2str(r12_tmp2),'p=',num2str(p12_tmp2)]),yticks([-0.03 0 0.03 0.06]),xlim([-0.5 .2])
h2 = lsline(ax);
h2.LineWidth = 3;
h2.Color = 'k';
set(gca,'fontsize', 30),
set(gca,'linewidth',3),
box off,ylim([-0.02 0.06])