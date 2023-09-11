
%% fig 5 and S6
clear
load('fig5_s6.mat','mean_seg_pos_Hi','mean_seg_pos_Lo','t_pos_high_low','mean_seg_neg_Hi','mean_seg_neg_Lo','t_neg_high_low')

figure,
subplot(321),imagesc(mean_seg_pos_Hi,[-.3 .3]),colormap jet,colorbar
subplot(323),imagesc(mean_seg_pos_Lo,[-.3 .3]),colormap jet,colorbar
subplot(325),imagesc(t_pos_high_low,[2 3]),colormap hot,colorbar

subplot(322),imagesc(mean_seg_neg_Hi,[-.3 .3]),colormap jet,colorbar
subplot(324),imagesc(mean_seg_neg_Lo,[-.3 .3]),colormap jet,colorbar
subplot(326),imagesc(t_neg_high_low,[2.1 3]),colormap hot,colorbar

% please load propagation spatial pattern with Connectome WorkBench :
% No.6,11,17 volume

% path: .
% pos_high_csf_abeta (corresponding to mean_seg_pos_Hi):epi11_surfSM.dscalar.nii
% pos_low_csf_abeta (corresponding to mean_seg_pos_Lo):epi22_surfSM.dscalar.nii
% t_pos_Hi_Lo_csf_abeta (corresponding to t_pos_high_low):t_nii11_surfSM.dscalar.nii


% neg_high_csf_abeta (corresponding to mean_seg_neg_Hi):epi33_surfSM.dscalar.nii
% neg_low_csf_abeta (corresponding to mean_seg_neg_Lo):epi44_surfSM.dscalar.nii
% t_neg_Hi_Lo_csf_abeta (corresponding to t_neg_high_low):t_nii22_surfSM.dscalar.nii
