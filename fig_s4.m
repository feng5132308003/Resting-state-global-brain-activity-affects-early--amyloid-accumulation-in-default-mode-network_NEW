%% 
% recommand to use the Connectome WorkBench to load these surface file
%% 

gl =gifti('100307.L.inflated.32k_fs_LR.surf.gii');
gr =gifti('100307.R.inflated.32k_fs_LR.surf.gii');


gsl =gifti('100307.L.aparc.32k_fs_LR.label.gii');
gsr =gifti('100307.R.aparc.32k_fs_LR.label.gii')

brain2 = ft_read_cifti('mean_longi_pet1_roi_112_s1.dscalar.nii');

tmp=brain2.dscalar;

gsl.cdata=tmp(1:32492);
gsr.cdata=tmp((32492+1):32492*2);


thr1=-0.025;
thr2=0.025;
figure('color','w'),plot(gl,gsl),caxis([thr1 thr2]),colormap hot,colorbar 
figure('color','w'),plot(gr,gsr),caxis([thr1 thr2]),colormap hot,colorbar 
%% 

gl =gifti('100307.L.inflated.32k_fs_LR.surf.gii');
gr =gifti('100307.R.inflated.32k_fs_LR.surf.gii');


gsl =gifti('100307.L.aparc.32k_fs_LR.label.gii');
gsr =gifti('100307.R.aparc.32k_fs_LR.label.gii')

brain2 = ft_read_cifti('mean_longi_pet1_roi_112_s2.dscalar.nii');

tmp=brain2.dscalar;

gsl.cdata=tmp(1:32492);
gsr.cdata=tmp((32492+1):32492*2);


thr1=-0.025;
thr2=0.025;
figure('color','w'),plot(gl,gsl),caxis([thr1 thr2]),colormap hot,colorbar 
figure('color','w'),plot(gr,gsr),caxis([thr1 thr2]),colormap hot,colorbar 

%% 

gl =gifti('100307.L.inflated.32k_fs_LR.surf.gii');
gr =gifti('100307.R.inflated.32k_fs_LR.surf.gii');


gsl =gifti('100307.L.aparc.32k_fs_LR.label.gii');
gsr =gifti('100307.R.aparc.32k_fs_LR.label.gii')

brain2 = ft_read_cifti('mean_longi_pet1_roi_112_s3.dscalar.nii');

tmp=brain2.dscalar;

gsl.cdata=tmp(1:32492);
gsr.cdata=tmp((32492+1):32492*2);


thr1=-0.025;
thr2=0.025;
figure('color','w'),plot(gl,gsl),caxis([thr1 thr2]),colormap hot,colorbar 
figure('color','w'),plot(gr,gsr),caxis([thr1 thr2]),colormap hot,colorbar 
%%


%% 


gl =gifti('100307.L.inflated.32k_fs_LR.surf.gii');
gr =gifti('100307.R.inflated.32k_fs_LR.surf.gii');


gsl =gifti('100307.L.aparc.32k_fs_LR.label.gii');
gsr =gifti('100307.R.aparc.32k_fs_LR.label.gii')

brain2 = ft_read_cifti('longi_pet1_DIFF_roi_112_s21.dscalar.nii');

tmp=brain2.dscalar;

gsl.cdata=tmp(1:32492);
gsr.cdata=tmp((32492+1):32492*2);


thr1=1.75;
thr2=2.1;
figure('color','w'),plot(gl,gsl),caxis([thr1 thr2]),colormap hot,colorbar 
figure('color','w'),plot(gr,gsr),caxis([thr1 thr2]),colormap hot,colorbar 

%% 


gl =gifti('100307.L.inflated.32k_fs_LR.surf.gii');
gr =gifti('100307.R.inflated.32k_fs_LR.surf.gii');


gsl =gifti('100307.L.aparc.32k_fs_LR.label.gii');
gsr =gifti('100307.R.aparc.32k_fs_LR.label.gii')

brain2 = ft_read_cifti('longi_pet1_DIFF_roi_112_s32.dscalar.nii');

tmp=brain2.dscalar;

gsl.cdata=tmp(1:32492);
gsr.cdata=tmp((32492+1):32492*2);


thr1=-2.1;
thr2=2.1;
figure('color','w'),plot(gl,gsl),caxis([thr1 thr2]),colormap hot,colorbar 
figure('color','w'),plot(gr,gsr),caxis([thr1 thr2]),colormap hot,colorbar 
%%

