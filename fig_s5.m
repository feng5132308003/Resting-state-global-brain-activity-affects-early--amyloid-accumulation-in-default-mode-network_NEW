%%


gl =gifti('100307.L.inflated.32k_fs_LR.surf.gii');
gr =gifti('100307.R.inflated.32k_fs_LR.surf.gii');


gsl =gifti('100307.L.aparc.32k_fs_LR.label.gii');
gsr =gifti('100307.R.aparc.32k_fs_LR.label.gii')

brain2 = ft_read_cifti('r_parcel_cp_longiPET_s2_spearman_surfSM.dscalar.nii');

tmp=brain2.dscalar;

gsl.cdata=tmp(1:32492);
gsr.cdata=tmp((32492+1):32492*2);


thr1=-0.5;
thr2=0.5;
figure('color','w'),plot(gl,gsl),caxis([thr1 thr2]),colormap jet,colorbar 
figure('color','w'),plot(gr,gsr),caxis([thr1 thr2]),colormap jet,colorbar 