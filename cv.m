function img=cv(I,time,wh)

[nrow,ncol] =size(I); 
%��ʼ�߽�ΪͼƬ���İ뾶50��԰
ic=nrow/2;jc=ncol/2;r=50; 
I=double(I); 
img=sdf2circle(nrow,ncol,ic,jc,r);    

delta_t=0.1;mu =0.001*255*255; 
nu=0; 
lambda_1=1;
lambda_2=1; 
epsilon=1;

for n=1:time                 
    img=evolution_CVPDE(I,img,mu,nu,lambda_1,lambda_2,delta_t,epsilon);   % update level set function 
    x = n/time;
    waitbar(x,wh);   
end 

end

function f = sdf2circle(nrow,ncol, ic,jc,r) 

[X,Y] = meshgrid(1:ncol, 1:nrow); 
 
f = sqrt((X-jc).^2+(Y-ic).^2)-r; 
end
