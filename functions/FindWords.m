function [iz tau] = FindWords(u, tau)

criteria = 0.5;                                       
ls       = 5; 
u        = u - mean(u);

if nargin == 1
   myacf = autocorr(u,'NumLags', length(u)-1);
   yr = linspace(0.5,0.5,100);
   cr = find(myacf <= yr);
   tau = cr(1);
end

nls = linspace(1,ls,ls);                                
Word = zeros(ls,1)';                                  
iWord = zeros(ls,1)';                                  
A = perms(nls);                                                     


for k = 1:(tau*ls):length(u)-(tau*ls)
    dn = k:tau:(ls-1)*tau+k;                                           
    Word(k,:) = u(dn);                             
end

Word = Word(any(Word,2),:);                                                                               
for i = 1:length(Word(:,1))                                
    [w, j] = sort(Word(i,:), 'descend');              
    idx = find(Word(i,:));                            
    iWord(i,:) = [j];                                
end

[value, iz] = ismember(iWord, A,'rows');                                                                 
                                                 
end






















