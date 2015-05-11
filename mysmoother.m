function im_sm = mysmoother(inim,sigge)

sig_spat = 2;
im_sm = bilateral_filter(inim,sig_spat,sigge);


