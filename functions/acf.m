function ta = acf(y,p)
[n1, n2] = size(y) ;
if n2 ~=1
    error('Input series y must be an nx1 column vector')
end
[a1, a2] = size(p) ;
if ~((a1==1 & a2==1) & (p<n1))
    error('Input number of lags p must be a 1x1 scalar, and must be less than length of series y')
end
ta = zeros(p,1) ;
global N 
N = max(size(y)) ;
global ybar 
ybar = mean(y); 
% Collect ACFs at each lag i
for i = 1:p
   ta(i) = acf_k(y,i) ; 
end

function ta2 = acf_k(y,k)
global ybar
global N
cross_sum = zeros(N-k,1) ;
% Numerator, unscaled covariance
for i = (k+1):N
    cross_sum(i) = (y(i)-ybar)*(y(i-k)-ybar) ;
end
% Denominator, unscaled variance
yvar = (y-ybar)'*(y-ybar) ;
ta2 = sum(cross_sum) / yvar ;
