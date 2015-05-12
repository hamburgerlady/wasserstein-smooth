function im_sm = mysmoother(inim,sigge)
% function im_sm = mysmoother(inim,sigge)
%
% Example wrapper function for edgepreserving filtering
% using intensity standard deviation sigge

sig_spat = 2;
im_sm = bilateral_filter(inim,sig_spat,sigge);


