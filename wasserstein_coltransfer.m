function outim = wasserstein_coltransfer(im,colim)
% function outim = wasserstein_coltransfer(im,colim)
% 
% transforms the grayvalue distribution of im to match that of colim
% using wassersmooth. Implementation Magnus Oskarsson 2015.
% Assume grayvalue uint8 input images

hh0 = hist(colim(:),0:255);
im=double(histeq(uint8(im),hh0));
sigge = 5;
outim=wassersmooth(im,hh0,0:255,im+1,sigge,'mywasser','mysmoother');

