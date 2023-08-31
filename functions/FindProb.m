function [Pr] = FindProb(Dn)


M = 1e3;
lambda = linspace(0.15,2.4,M);
d = lambda(2) - lambda(1);
CDF= zeros(1,M);

for k = -M:M
    a = (-1).^k;
    b = exp(-2*k.^2*lambda.^2);
    CDF = CDF +a*b;
end

PDF = diff(CDF)/d;

for ss = 1:length(Dn)
    val = Dn(ss);
    [val idx1] = min(abs(lambda-val));
    cLVal = lambda(idx1);
end

Xg = lambda(1:end-1);
Yg = PDF;

A = [Xg, Yg];

idx = find(Xg >= Dn, 1);
al = trapz(Xg(1:idx), Yg(1:idx))*2*100;
ar = trapz(Xg(idx:end), Yg(idx:end))*2*100;

Aperc = [al ar];
idxPr = find(Aperc<=100);
Pr = Aperc(idxPr);

if Pr(1) == 0;
    Pr = 0;
end

end

