function img=visushrink(npic)

sig=100;

filtertype='db2';
levels=2;
[C,S]=wavedec2(npic,levels,filtertype);

M=size(npic,1)*size(npic,2);
UT=sig*sqrt(2*log(M));
LL=S(1,1)*S(1,2);

softC=[C(1:LL), sthresh(C(LL+1:length(C)),UT)];

img=waverec2(softC,S,filtertype);
end

function op=sthresh(X,T)

    ind=find(abs(X)<=T);
    ind1=find(abs(X)>T);
    X(ind)=0;
    X(ind1)=sign(X(ind1)).*(abs(X(ind1))-T);
    op=X;
end