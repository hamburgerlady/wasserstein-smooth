function outim=wasserstein_bitinc(inim,binin)
% function outim=wasserstein_bitinc(inim,binin)
% 
% Increase the bit-depth of inim from binin to 8 bits, 
% using wassersmooth. Implementation Magnus Oskarsson 2015.

binout = 256;
ff=binout/binin;
im2 = mapgray(inim,ff);
hh0 = estimatehist8bit(inim,binin);
outim=wassersmooth(im2,hh0,0:255,ceil(im2),ff/2,'mywasser','mysmoother');
