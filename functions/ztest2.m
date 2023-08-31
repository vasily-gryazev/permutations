function zval = ztest2(x,y,mux,muy,varx,vary)

% x - sample 1
% y - sample 2
% mux - mean of x to be used in difference. If you are not testing a
% specific difference, use mux = 0
% muy - mean of y. If you are not testing a
% specific difference, use muy = 0
% varx - variance of x
% vary - variance of y

if ~exist('mux','var');mux=0;end
if ~exist('muy','var');muy=0;end
if ~exist('varx','var');varx=std(x);end
if ~exist('vary','var');vary=std(y);end
%   
Nx = length(x);
Ny = length(y);
zval = ((mean(x)-mean(y))-(mux-muy))/sqrt(varx/Nx+vary/Ny);
end