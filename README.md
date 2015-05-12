# wasserstein-smooth

Matlab/mex implementation of image regularization described in 
"Regularizing image intensity transformations using the Wasserstein metric",
 M. Oskarsson, in proc SCIA'15

The main function is

function outim=wassersmooth(inim,hh0,bins,inim_id,sigge,wasserfcn,smoothfcn)

which transforms the input image to fit the distribution given by hh0. Two
functions needs to be provided by the user, 

* wasserfcn that calculates the optimal transport using the Wasserstein metric
* smoothfcn that anisotropically smooths the image

Three example applications are implemented in 

* wasserstein_histeq: exact histogram equalization
* wasserstein_coltransfer: intensity distribution transfer from one image to another
* wasserstein_bitinc: bit depth increase


