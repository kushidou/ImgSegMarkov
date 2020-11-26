function img=otsu2d(I)

[m,n]=size(I); 
a0=double(I); 
h=1; 
a1=zeros(m,n); 
for i=1:m 
    for j=1:n 
        for k=-h:h 
            for w=-h:h 
                p=i+k; 
                q=j+w; 
                if (p<=0)|(p>m) 
                    p=i; 
                end 
                if (q<=0)|(q>n) 
                    q=j; 
                end 
                a1(i,j)=a0(p,q)+a1(i,j); 
            end 
        end 
        a2(i,j)=uint8(1/9*a1(i,j)); 
    end 
end 
fxy=zeros(256,256); 
for i=1:m 
    for j=1:n 
        c=a0(i,j); 
        d=double(a2(i,j)); 
        fxy(c+1,d+1)=fxy(c+1,d+1)+1; 
    end 
end 

pxy=fxy/m/n; 
w0=zeros(256,256); 
ui=zeros(256,256); 
uj=zeros(256,256); 
w0(1,1)=pxy(1,1); 
for i=2:256 
    w0(i,1)=w0(i-1,1)+pxy(i,1); 
end 
for i=2:256 
    w0(1,i)=w0(1,i-1)+pxy(1,i); 
end 
for i=2:256 
    for j=2:256 
        w0(i,j)=w0(i-1,j)+w0(i,j-1)-w0(i-1,j-1)+pxy(i,j); 
    end 
end 
w1=ones(256,256)-w0; 
ui(1,1)=0; 
for i=2:256 
    ui(1,i)=ui(1,i-1)+(1-1)*pxy(1,i); 
end 
for i=2:256 
    ui(i,1)=ui(i-1,1)+(i-1)*pxy(i,1); 
end 
for i=2:256 
    for j=2:256 
        ui(i,j)=ui(i-1,j)+ui(i,j-1)-ui(i-1,j-1)+(i-1)*pxy(i,j); 
    end 
end 
uj(1,1)=0; 
for i=2:256 
    uj(1,i)=uj(1,i-1)+(i-1)*pxy(1,i); 
end 
for i=2:256 
    uj(i,1)=uj(i-1,1)+(1-1)*pxy(i,1); 
end 
for i=2:256 
    for j=2:256 
        uj(i,j)=uj(i-1,j)+uj(i,j-1)-uj(i-1,j-1)+(j-1)*pxy(i,j); 
    end 
end 
uti=0; 
utj=0; 
for i=1:256 
    for j=1:256 
        uti=uti+(i-1)*pxy(i,j); 
        utj=utj+(j-1)*pxy(i,j); 
    end 
end 
for i=1:256 
    for j=1:256 
        if w0(i,j)~=0 & w1(i,j)~=0 
            h(i,j)=((uti*w0(i,j)-ui(i,j))^2+(utj*w0(i,j)-uj(i,j))^2)/(w0(i,j)*w1(i,j)); 
        else 
            h(i,j)=0; 
        end 
    end 
end 
hmax=max(h(:)); 
for i=1:256 
    for j=1:256 
        if h(i,j)==hmax 
            s=i-1 ;
            k=j-1 ;
            continue; 
        end 
    end 
end 

img=ones(m,n); 
for i=1:m 
    for j=1:n 
        if I(i,j)<=s | a2(i,j)<=k 
            img(i,j)=0; 
        end 
    end 
end 