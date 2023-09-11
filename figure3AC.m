%% fig 3
%% fig 3A

gl =gifti('100307.L.inflated.32k_fs_LR.surf.gii');
gr =gifti('100307.R.inflated.32k_fs_LR.surf.gii');


gsl =gifti('100307.L.aparc.32k_fs_LR.label.gii');
gsr =gifti('100307.R.aparc.32k_fs_LR.label.gii')

brain2 = ft_read_cifti('mean_r_gs_bold_s2_19_spearman_ft010_preped_test_replace2_SM.dscalar.nii');

tmp=brain2.dscalar;

gsl.cdata=tmp(1:32492);
gsr.cdata=tmp((32492+1):32492*2);


thr1=0.3;
thr2=.43;
figure('color','w'),plot(gl,gsl),caxis([thr1 thr2]),colormap jet,colorbar 
figure('color','w'),plot(gr,gsr),caxis([thr1 thr2]),colormap jet,colorbar 
%% fig 3C

gl =gifti('100307.L.inflated.32k_fs_LR.surf.gii');
gr =gifti('100307.R.inflated.32k_fs_LR.surf.gii');


gsl =gifti('100307.L.aparc.32k_fs_LR.label.gii');
gsr =gifti('100307.R.aparc.32k_fs_LR.label.gii')

brain2 = ft_read_cifti('r_gs_presence_s2_19_ROI_regr_longiPET_spearman_prc50_surfSM.dscalar.nii');

tmp=brain2.dscalar;

gsl.cdata=tmp(1:32492);
gsr.cdata=tmp((32492+1):32492*2);


thr1=-0.4;
thr2=0.4;
figure('color','w'),plot(gl,gsl),caxis([thr1 thr2]),colormap jet,colorbar 
figure('color','w'),plot(gr,gsr),caxis([thr1 thr2]),colormap jet,colorbar 