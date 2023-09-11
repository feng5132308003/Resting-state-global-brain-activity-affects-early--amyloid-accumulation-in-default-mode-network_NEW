%% fig 2
%% fig 2A

gl =gifti('100307.L.inflated.32k_fs_LR.surf.gii');
gr =gifti('100307.R.inflated.32k_fs_LR.surf.gii');


gsl =gifti('100307.L.aparc.32k_fs_LR.label.gii');
gsr =gifti('100307.R.aparc.32k_fs_LR.label.gii')

brain2 = ft_read_cifti('mean_longi_pet1_roi_112_s2.dscalar.nii');

tmp=brain2.dscalar;

gsl.cdata=tmp(1:32492);
gsr.cdata=tmp((32492+1):32492*2);


thr1=0;
thr2=.025;
figure('color','w'),plot(gl,gsl),caxis([thr1 thr2]),colormap jet,colorbar 
figure('color','w'),plot(gr,gsr),caxis([thr1 thr2]),colormap jet,colorbar 

%% fig 2B

gl =gifti('100307.L.inflated.32k_fs_LR.surf.gii');
gr =gifti('100307.R.inflated.32k_fs_LR.surf.gii');


gsl =gifti('100307.L.aparc.32k_fs_LR.label.gii');
gsr =gifti('100307.R.aparc.32k_fs_LR.label.gii')

brain2 = ft_read_cifti('test_cp_gs_146_s2_new_surfSM.dscalar.nii');

tmp=brain2.dscalar;

gsl.cdata=tmp(1:32492);
gsr.cdata=tmp((32492+1):32492*2);


thr1=-0.15;
thr2=-0.03;
figure('color','w'),plot(gl,gsl),caxis([thr1 thr2]),colormap hot,colorbar 
figure('color','w'),plot(gr,gsr),caxis([thr1 thr2]),colormap hot,colorbar 

