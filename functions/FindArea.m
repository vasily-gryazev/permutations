function [Pr, PDF, Xpdf] = FindArea(stat, Statg)

[PDF, Xpdf] = ksdensity(Statg);

A = trapz(Xpdf, PDF);

idx = find(Xpdf >= stat, 1);
al = trapz(Xpdf(1:idx), PDF(1:idx))*100;
ar = trapz(Xpdf(idx:end), PDF(idx:end))*100;

Aperc = [al ar];
idxPr = find(Aperc<=100);
Pr = Aperc(idxPr);
