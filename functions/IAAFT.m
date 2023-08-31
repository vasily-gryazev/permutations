function [s,iter]=IAAFT(x,c,maxiter)

if nargin<1 | isempty(x)==1
   error('You should provide a time series.');
else
   % x must be a vector
   if min(size(x))>1
      error('Invalid time series.');
   end
   x=x(:);
end

if nargin<2 | isempty(c)==1
   c=1;
else
   % c must be scalar
   if sum(size(c))>2
      error('c must be scalar.');
   end
   % c must be greater or equal than 1
   if c<1
      error('c must be greater or equal than 1.');
   end
end

if nargin<3 | isempty(maxiter)==1
   maxiter=1000;
else
   % maxiter must be scalar
   if sum(size(maxiter))>2
      error('maxiter must be scalar.');
   end
   % maxiter must be greater or equal than 1
   if maxiter<1
      error('maxiter must be greater or equal than 1.');
   end
end

% The magnitudes of x
amp=abs(fft(x));

% Shuffle x
s=shuffle(x,c);

% Sort x
[x,r]=sort(x);


for j=1:c
    
    % Calculate the phases of the shuffled series
    phase=angle(fft(s(:,j)));
    
    % Initialize the loop
    k=1;
    indold=r;
    converge = 0;
    while k<=maxiter & converge == 0 
        % Make phase-randomized surrogates ...
        s(:,j)=amp.*exp(phase.*i); 
        s(:,j)=real(ifft(s(:,j)));
        % ... and give them the distribution of x
        [s(:,j),T]=sort(s(:,j));
        [s(:,j),indnew]=sort(T);
        s(:,j)=x(indnew);
        % Check the convergence
        if indnew==indold
            converge=1;
        else
            indold=indnew;
            k=k+1;
        end
        % Loop again if needed, calculating the phases once more
        phase=angle(fft(s(:,j)));
    end
    
    % Get the iterations of each surrogate series
    iter(j)=k;
    
end
