function img=bayesshrink(noisy_img,wname)

sigma_noise=10; 
sssize=size(noisy_img);
SIZE=512;
noisy_img=imresize(noisy_img,[SIZE SIZE]);

% DWT2 
[a1,h1,v1,d1]=dwt2(noisy_img,wname); 
[a2,h2,v2,d2]=dwt2(a1,wname); 

sigmay_h1=var(var(h1)); 
sigmay_v1=var(var(v1)); 
sigmay_d1=var(var(d1)); 
sigmay_h2=var(var(h2)); 
sigmay_v2=var(var(v2)); 
sigmay_d2=var(var(d2)); 

sigmax_h1=sqrt(max(((sigmay_h1)-(sigma_noise^2)),0)); 
sigmax_v1=sqrt(max(((sigmay_v1)-(sigma_noise^2)),0)); 
sigmax_d1=sqrt(max(((sigmay_d1)-(sigma_noise^2)),0)); 
sigmax_h2=sqrt(max(((sigmay_h2)-(sigma_noise^2)),0)); 
sigmax_v2=sqrt(max(((sigmay_v2)-(sigma_noise^2)),0)); 
sigmax_d2=sqrt(max(((sigmay_d2)-(sigma_noise^2)),0)); 
 
if sigmax_h1==0  
    landa_h1=max(max(abs(h1))); 
else landa_h1=(sigma_noise^2)/(sigmax_h1); 
end 
 
if sigmax_v1==0  
    landa_v1=max(max(abs(v1))); 
else landa_v1=(sigma_noise^2)/(sigmax_v1); 
end 
 
if sigmax_d1==0  
    landa_d1=max(max(abs(d1))); 
else landa_d1=(sigma_noise^2)/(sigmax_d1); 
end 
 
if sigmax_h2==0  
    landa_h2=max(max(abs(h2))); 
else landa_h2=(sigma_noise^2)/(sigmax_h2); 
end 
 
if sigmax_v2==0  
    landa_v2=max(max(abs(v2))); 
else landa_v2=(sigma_noise^2)/(sigmax_v2); 
end 
 
if sigmax_d2==0  
    landa_d2=max(max(abs(d2))); 
else landa_d2=(sigma_noise^2)/(sigmax_d2); 
end 

% »Ì„–÷µ∑÷∏Ó
h1_soft=wthresh(h1,'s',landa_h1); 
v1_soft=wthresh(v1,'s',landa_v1); 
d1_soft=wthresh(d1,'s',landa_d1); 
 
h2_soft=wthresh(h2,'s',landa_h2); 
v2_soft=wthresh(v2,'s',landa_v2); 
d2_soft=wthresh(d2,'s',landa_d2); 
 
% IDWT2 
a1_new_soft=idwt2(a2,h2_soft,v2_soft,d2_soft,wname); 
a1_new_soft=imresize(a1_new_soft,size(h1_soft));
img=idwt2(a1_new_soft,h1_soft,v1_soft,d1_soft,wname); 
img=imresize(img,sssize);
