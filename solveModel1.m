function [Aout,Iout,Ainit,Iinit] = solveModel1(a,b,c,d,DA,DI,nx,tmax,tSave)

if nargin < 9
    
    tSave = 1;
    
    if nargin < 8
        
        tmax = 1;
        
        if nargin < 7
            
            nx = 100;
            
        end
        
    end
    
end

xlist = 0:(2*pi)/nx:2*pi*(nx-1)/nx;
tlist = (0:0.01:tmax)*DI;

if a*d-b^2 > 0
    
    Ainit = (a*d-b^2)/b^2;
    Iinit = (b*Ainit/d)^2;
    
else
    
    Ainit = 0;
    Iinit = 0;
    
end

ic = [(1 + 0.1*randn(1,nx))*Ainit; (1 + 0.1*randn(1,nx))*Iinit];

sol = pbcpdeSolver(@fpde,ic,xlist,tlist);

Aout = sol(:,:,1)';
Iout = sol(:,:,2)';

[Aout,Iout] = shiftPeak(Aout,Iout);

if tSave == 0
    
    Aout = Aout(:,end);
    Iout = Iout(:,end);
    
end

    function [D,s] = fpde (x,t,u)
        
        D = [DA/DI ; 1];
        A = u(1,:);
        I = u(2,:);
        
        Q = (b/DI)*A.*sqrt(abs(I));
        
        dAdt = (a/DI)*(A.^2)./(1 + A) - Q - (c/DI)*A;
        dIdt = Q - (d/DI)*I;
        s = [dAdt; dIdt];
        
    end

end
