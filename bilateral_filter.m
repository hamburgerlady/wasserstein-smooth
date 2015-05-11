function imout = bilateral_filter(imin,sig_spat,sig_int)
% fuction imout = mybilateral(imin,sig_spat,sig_int)
%
% bilateral filtering, 
% for a graylevel image input
% implementation Magnus Oskarsson 2014
% input
% imin : input image
% sig_spat : spatial sigma
% sig_int : intensity sigma, 
% output
% imout : output image

[N,M]=size(imin);


k = 1.5;
s_spat = ceil(k*sig_spat);

%[xx,yy]=meshgrid(-s_spat:s_spat);
%gk_spat = exp(-(xx.^2+yy.^2)/2/sig_spat^2);
%gk_spat = gk_spat/sum(gk_spat(:));

%imin_sm1 = conv2(imin,gk_spat,'same');
%sig_imint = sig_int(floor(imin_sm1)+1);

%s_int = ceil(k*max(sig_imint(:)));
s_int = ceil(k*sig_int);
s_tot = max(s_int,s_spat);

[xx,yy]=meshgrid(-s_tot:s_tot);
gk_spat = exp(-(xx.^2+yy.^2)/2/sig_spat^2);
gk_spat = gk_spat/sum(gk_spat(:));

imin_padded = zeros(N+2*s_tot,M+2*s_tot);
imin_padded(s_tot+1:end-s_tot,s_tot+1:end-s_tot)=imin;
imout = zeros(N,M);


for iii=1:N,
    for jjj=1:M,
        impatch = imin_padded(iii:(iii+2*s_tot),jjj:(jjj+2*s_tot));
        im_diffsq = (impatch-impatch(s_tot+1,s_tot+1)).^2;
        %gk_int = exp(-im_diffsq/2/sig_imint(iii,jjj)^2);
        gk_int = exp(-im_diffsq/2/sig_int^2);
        
        gk = gk_int.*gk_spat;
        gk = gk/sum(gk(:));
        imout(iii,jjj)=sum(sum(impatch.*gk));
    end
end









    