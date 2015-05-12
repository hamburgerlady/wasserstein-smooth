function outim = wasserstein_histeq(im)
% function outim = wasserstein_histeq(im)
%
% 8bit example histogram equalization using wassertein smoothing
% input im NxM grayscale image 0:255
% output outim NxM grayscale image 0:255

bins = 256;
binny = 0:(bins-1);
imtmp = histeq(uint8(im),bins);
h1 = hist(imtmp(:),binny);
ids = find(h1>0);
sigge = max(abs(diff(ids)));
h2 = ones(size(binny))*sum(h1)/bins;
im_id = double(imtmp)+1;
outim=wassersmooth(imtmp,h2,binny,im_id,sigge,'mywasser','mysmoother');
