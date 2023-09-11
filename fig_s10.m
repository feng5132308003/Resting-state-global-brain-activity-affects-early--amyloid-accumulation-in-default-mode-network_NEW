clear 
load('fig_s10_new.mat','r_gs','cp_min_regr','disease2','i_min')
%%
    figure,plot(3*([-4:1:4]),flip(r_gs), 'color', [.7 .7 .7], 'linewidth', 0.5,...
        'MarkerSize',9,'MarkerEdgeColor',[0.8500 0.3250 0.0980]); % gray lines

%%
i_1=i_min(disease2==1);
i_2=i_min(disease2==2);
i_3=i_min(disease2==3);

x = 1:3;
figure('color','w'),


group=[ones(size(i_1'));2*ones(size(i_2'));3*ones(size(i_3'))];
colors(3,:)=[0.6350 0.6350 0.6350];
colors(2,:)=[0.8500 0.3250 0.0980];
colors(1,:)=[0 0.4470 0.7410];

h=boxplot([i_1';i_2';i_3'],group,'Notch','on','Widths',0.5);
set(h,'linewidth',2,'Color',[0.5 0.5 0.5])
set(gca,'XTickLabel',{'s1','s2','s3'});
h2=findobj(gca,'Tag','Box');
for j=1:3
    patch(get(h2(j),'Xdata'),get(h2(j),'YData'), colors(j,:),'FaceAlpha',0.8);
end
set(gca,'fontsize', 30),
set(gca,'linewidth',2);
yticks([0 6 12]);
ylim([0 12]);

%%

cp_s1=cp_min_regr(disease2==1);%
cp_s2=cp_min_regr(disease2==2);%
cp_s3=cp_min_regr(disease2==3);%

 [~,p1,~,tstat1]=ttest2(cp_s2,cp_s1)
 [~,p2,~,tstat2]=ttest2(cp_s3,cp_s1)
 [~,p3,~,tstat3]=ttest2(cp_s3,cp_s2)
 
figure('color','w'),
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
yticks([-0.6 -0.3 0 0.2]);
ylim([-0.7 0.2]);



[B,dev,stats] = mnrfit(cp_min_regr,disease2,'model','ordinal')
stats.p(end)
