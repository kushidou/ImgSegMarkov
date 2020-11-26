function phi =evolution_CVPDE(I,phi0,mu,nu,lambda_1,lambda_2,delta_t,epsilon); 
    phi=phi0; 
    phi=NeumannBoundCond(phi); 
    delta_h=Delta(phi,epsilon); 
    K = curvature(phi); 
    [C1,C2]=binaryfit(phi,I,epsilon); 

    phi=phi+delta_t*delta_h.*(mu*K-nu-lambda_1*(I-C1).^2+lambda_2*(I-C2).^2);     
   
function g = NeumannBoundCond(f) 
% Make a function satisfy Neumann boundary condition 
[nrow,ncol] = size(f); 
g = f; 
g([1 nrow],[1 ncol]) = g([3 nrow-2],[3 ncol-2]);   
g([1 nrow],2:end-1) = g([3 nrow-2],2:end-1);           
g(2:end-1,[1 ncol]) = g(2:end-1,[3 ncol-2]);  
 
function K = curvature(f) 
eps=1e-10; 
fx_f = Dx_forward(f); 
fy_f = Dy_forward(f); 
ax = fx_f./sqrt(fx_f.^2+fy_f.^2+eps); 
ay = fy_f./sqrt(fx_f.^2+fy_f.^2+eps); 
axx = Dx_backward(ax); 
ayy = Dy_backward(ay); 
K = axx + ayy; 
 
function [C1,C2]= binaryfit(phi,U,epsilon)  

H = Heaviside(phi,epsilon); %compute the Heaveside function values  
a= H.*U; 
numer_1=sum(a(:));  
denom_1=sum(H(:)); 
C1 = numer_1/denom_1; 
 
b=(1-H).*U; 
numer_2=sum(b(:)); 
c=1-H; 
denom_2=sum(c(:)); 
C2 = numer_2/denom_2; 
 
function H = Heaviside(phi,epsilon)  
H = 0.5*(1+ (2/pi)*atan(phi./epsilon)); 
 
function Delta_h = Delta(phi, epsilon) 
Delta_h=(epsilon/pi)./(epsilon^2+ phi.^2); 
 
function fx=Dx_forward(f)
[nr,nc]=size(f); 
fx=zeros(nr,nc); 
fx(:,1:nc-1)=f(:,2:nc)-f(:,1:nc-1); 
 
function fy=Dy_forward(f)
[nr,nc]=size(f); 
fy=zeros(nr,nc); 
fy(1:nr-1,:)=f(2:nr,:)-f(1:nr-1,:); 
 
function fx=Dx_backward(f)
[nr,nc]=size(f); 
fx=zeros(nr,nc); 
fx(:,2:nc)=f(:,2:nc)-f(:,1:nc-1); 
 
function fy=Dy_backward(f)
[nr,nc]=size(f); 
fy=zeros(nr,nc); 
fy(2:nr,:)=f(2:nr,:)-f(1:nr-1,:);