function [chistat] = chi2test(x1,x2,alpha)

if nargin < 3 || isempty (alpha)
    alpha = 0.05;
elseif ~isscalar(alpha) || alpha <= 0 || alpha >= 1
error ('Bad alpha value');
end
if isempty(x1) || isempty(x2)
    error ('Missing or empty X1 or X2 vectors, please try again.');
end
% Purge input vectors of any NaN
x1 = x1(~isnan(x1));
x2 = x2 (~isnan(x2));

bins = unique ([x1(:,1); x2(:,1)]);
freq1 = histc(x1, bins);
freq2 = histc(x2, bins);
k1 = sqrt(sum(freq2)/sum(freq1));
k2 = sqrt(sum(freq1)/sum(freq2));
chistat = sum((k1*freq1-k2*freq2).^2./(freq1+freq2));

