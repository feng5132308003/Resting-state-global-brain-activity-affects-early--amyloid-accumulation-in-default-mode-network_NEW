clear

load('fig_s4_barplot.mat','longiPET_high*','longiPET_low*')

 [~,p1,~,tstat1]=ttest2(longiPET_high_s2,longiPET_high_s1)
 [~,p2,~,tstat2]=ttest2(longiPET_high_s3,longiPET_high_s1)
 [~,p3,~,tstat3]=ttest2(longiPET_high_s3,longiPET_high_s2)


%%%% low 
 [~,p1,~,tstat1]=ttest2(longiPET_low_s2,longiPET_low_s1)
 [~,p2,~,tstat2]=ttest2(longiPET_low_s3,longiPET_low_s1)
 [~,p3,~,tstat3]=ttest2(longiPET_low_s3,longiPET_low_s2)


group=[ones(size(longiPET_high_s1));2*ones(size(longiPET_high_s2));3*ones(size(longiPET_high_s3));...
     4*ones(size(longiPET_low_s1));5*ones(size(longiPET_low_s2));6*ones(size(longiPET_low_s3))];
colors(3,:)=[0.6350 0.6350 0.6350];
colors(2,:)=[0.8500 0.3250 0.0980];
colors(1,:)=[0 0.4470 0.7410];
colors(6,:)=[0.6350 0.6350 0.6350];
colors(5,:)=[0.8500 0.3250 0.0980];
colors(4,:)=[0 0.4470 0.7410];
x=[1 2 3 5 6 7];
h=boxplot([longiPET_high_s1;longiPET_high_s2;longiPET_high_s3;... 
     longiPET_low_s1;longiPET_low_s2;longiPET_low_s3],group,'Notch','on','Widths',0.5,'positions',x);
set(h,'linewidth',2,'Color',[0.5 0.5 0.5])
h2=findobj(gca,'Tag','Box');
for j=1:6
    patch(get(h2(j),'Xdata'),get(h2(j),'YData'), colors(j,:),'FaceAlpha',0.8);
end
set(gca,'fontsize', 30),
set(gca,'linewidth',2);
ylim([-0.1 0.15]);yticks([-0.1 0 0.15]);
