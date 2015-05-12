function F = mywasser(hh1,hh2,D)
% function F = mywasser(hh1,hh2,D)
% 
% Example wrapper function for estimating optimal transport
% between distribution hh1 and hh2 using metric D

[~,F]=emd_hat_gd_metric_mex(hh1(:),hh2(:),D);
