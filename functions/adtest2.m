function [adstat] = adtest2(sample1, sample2, alpha)
if nargin < 2, error ('Call adtest2 with at least two input arguments'); end
if nargin < 3, alpha = 0.05; end

if alpha == 0.01, critvalue = 3.857;
elseif alpha == 0.05, critvalue = 2.492;
elseif alpha == 0.1, critvalue = 1.933;
else error('Alpha must be either 0.01, 0.05 or 0.1');
end

samplecomb = sort ([sample1 sample2]);
ad = 0;

for i = 1:length(samplecomb)-1
m = length(find(sample1(:)<=samplecomb(i)));
ad = ad + (((m*length(samplecomb) - length(sample1)*i)^2)/ (i*(length(samplecomb)-i)));
end
adstat = ad/(length(sample1)*length(sample2)) ;
if adstat > critvalue, H = 1; else H = 0; end
