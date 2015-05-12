function outim=wassersmooth(inim,hh0,bins,inim_id,sigge,wasserfcn,smoothfcn)
% function outim=wassersmooth(inim,hh0,bins,inim_id,sigge,wasserfcn,smoothfcn)
%
% Wasserstein smoothing based on Magnus Oskarsson,
% "Regularizing image intensity transformations using the Wasserstein
% metric" in proc. SCIA 2015.
% Changes distribution of inim to match hh0 using bins. 
% inim_id contains index of inim in bins, (1..N) if length(bins)=N.
% sigge is the standard deviation of the smoothing function smoothfcn
% wasserfcn is the name of the function that calculates the optimal
% transport using the Wasserstein metric. 
% smoothfcn is the name of the function that does the smoothing of the
% image.

inim=double(inim);
hh = hist(inim(:),bins);
[X,Y]=meshgrid(bins);
D = (X-Y).^2;
F=feval(wasserfcn,hh,hh0,D);
[N,M]=size(F);
F2 = round(F);
im_sm = feval(smoothfcn,inim,sigge);
outim = im_sm;

im_diff = im_sm-inim;
for binny = 1:N,
    Fb = F2(binny,:);
    [II,JJ]=find(inim_id==binny);
    [~,ordo] = sort(im_diff(inim_id==binny));
    II=II(ordo);
    JJ=JJ(ordo);
    count = 0;
    for binny2 = 1:M,
        Fb_b=Fb(binny2);
        if Fb_b>0,
            for kkk=(count+1):(count+Fb_b),
                if kkk<=length(II),
                    outim(II(kkk),JJ(kkk))=binny2-1;
                end
            end
            count = count+Fb_b;
        end
    end
end

