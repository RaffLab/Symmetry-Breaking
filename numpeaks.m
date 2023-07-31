function [nOut,nZero] = numpeaks(A,nThresh)

if nargin < 2
    
    nThresh = 0.5;
    
end

if size(A,2)>1
    
    X = A(:,end);
    
else
    
    X = A;
    
end

[Xmax,Indx] = max(X);

X = X/Xmax;

X = circshift(X,-Indx);

[~,nOut] = bwlabel(X < nThresh);

nZero = (Xmax < 1e-6);

end