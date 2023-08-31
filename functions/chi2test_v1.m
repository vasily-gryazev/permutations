function [x, a] = chi2test_v1(data, num_int)
	[m,n] = size(data);
	
	E = m/num_int; % E=10
	interval = zeros(num_int, 1);
	for i=1:m
		k = data(i,1);
		interval(fi(num_int,k),1) = interval(fi(num_int,k),1) +1;
	end
	x = 0;
	for j= 1:num_int
		x = x+ (interval(j,1)-E)^2/E;
	end
	x;
	a = chi2inv(0.95,num_int-1);
	
function b = fi(i,n)
for j= 0:i
	if n > (1/i)*(i-j)
		b = i-j+1;
		break
	end
end
