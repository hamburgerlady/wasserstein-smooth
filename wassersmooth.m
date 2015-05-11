function outim=wassersmooth(inim,hh0,bins,inim_id,sigge,wasserfcn,smoothfcn)

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

