
clear

load('idx_parcel70_high_dmnFP_low.mat','idx_parcel_high','idx_parcel_low')

tmp=zeros(70,1);
tmp(idx_parcel_high)=1.01;
tmp(idx_parcel_low)=-1.01;


gl =gifti('100307.L.inflated.32k_fs_LR.surf.gii');
gr =gifti('100307.R.inflated.32k_fs_LR.surf.gii');


gsl =gifti('100307.L.aparc.32k_fs_LR.label.gii');
gsr =gifti('100307.R.aparc.32k_fs_LR.label.gii')

gsl.cdata(gsl.cdata==-1)=nan;
label_gsl=unique(gsl.cdata);
for li=2:length(tmp(1:35))
    gsl.cdata(gsl.cdata==(label_gsl(li)))=tmp(li);
end


%%%%
gsr.cdata(gsr.cdata==-1)=nan;
label_gsr=unique(gsr.cdata);
for li=2:length(tmp(36:70))
    gsr.cdata(gsr.cdata==(label_gsr(li)))=tmp(li+35);
end

thr1=-.5;
thr2=.5;
figure('color','w'),plot(gl,gsl),caxis([thr1 thr2]),colormap jet,colorbar 
figure('color','w'),plot(gr,gsr),caxis([thr1 thr2]),colormap jet,colorbar 
