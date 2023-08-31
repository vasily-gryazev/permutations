
function [ksstat] = kstest(x1,x2)

xi = linspace(min(x1),max(x1), length(x1))';   
N = length(xi);

for m = 1:length(xi)                                  
    g = 0; 
    q = 0;                                       
      for n = 1:length(x1)
          if x1(n)<=xi(m)                          
              g = g + 1;
          else
              q = q + 1;
          end
      end
       cdfg1(m) = g/(g + q);                           
end 

for m = 1:length(xi)                                  
    g = 0; 
    q = 0;                                       
      for n = 1:length(x2)
          if x2(n)<=xi(m)                          
              g = g + 1;
          else
              q = q + 1;
          end
      end
       cdfg2(m) = g/(g + q);                           
end 

% delta = sqrt((N*N/N+N))*abs(cdfg1 - cdfg2);
delta = abs(cdfg1 - cdfg2);

[maxdelta Imaxdelta] = max(delta);
ksstat = maxdelta*sqrt(length(xi));