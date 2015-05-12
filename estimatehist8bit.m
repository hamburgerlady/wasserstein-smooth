function hh0 = estimatehist8bit(im,n)
% function hh0 = estimatehist8bit(im,n)
% 
% interpolate the grayvalue distribution of im from n bins to 256
% using second degree polynomials, as described in Magnus Oskarsson,
%  "Regularizing image intensity transformations using the Wasserstein
%  metric" in proc. SCIA 2015.


binout =256;
ff = binout/n;
binny=0:n-1;
binny=binny(:);
xx=-0.5:(n-0.5);
xx=xx(:);

yy=hist(im(:),binny);
yy=yy(:);

A = zeros(n+2,3*(n));
for iii=1:n,
    A(iii,iii)=xx(iii+1)-xx(iii);
    A(iii,iii+n)=xx(iii+1)^2/2-xx(iii)^2/2;
    A(iii,iii+2*(n))=xx(iii+1)^3/3-xx(iii)^3/3;    
end

A(n+1,1+2*(n))=1;
A(n+2,3*(n))=1;

b = [yy;0;0];
B = zeros(2*(n-1),3*(n));

for iii=1:n-1,
    B(iii,iii)=1;
    B(iii,iii+1)=-1;
    B(iii,iii+(n))=xx(iii+1);
    B(iii,iii+1+(n))=-xx(iii+1);
    B(iii,iii+2*(n))=xx(iii+1)^2;
    B(iii,iii+1+2*(n))=-xx(iii+1)^2;
    
    B(iii+(n-1),iii+(n))=1;
    B(iii+(n-1),iii+1+(n))=-1;
    B(iii+(n-1),iii+2*(n))=2*xx(iii+1);
    B(iii+(n-1),iii+1+2*(n))=-2*xx(iii+1);
end



sol=[A;B]\[b;zeros(2*(n-1),1)];


aa=sol(1:(n));
bb=sol(n+1:2*(n));
cc=sol(2*(n)+1:3*(n));


binny2 = mapgrayinv2(0:255,ff);
step = (binny2(2)-binny2(1))/2;
hh0=0*binny2;
for iii=1:binout,
    i1 = find(xx>binny2(iii));
    i1 = i1(1)-1;
    x1 = binny2(iii)-step;
    x2 = binny2(iii)+step;
    hh0(iii)=(aa(i1)*x2+bb(i1)*x2^2/2+cc(i1)*x2^3/3)-(aa(i1)*x1+bb(i1)*x1^2/2+cc(i1)*x1^3/3);
    
end

hh0(hh0<0)=0;

