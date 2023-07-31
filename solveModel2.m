function [Aout,Iout,Ainit,Iinit] = solveModel2(a,b,c,d,DA,DI,nx,tmax,tSave)

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
tlist = DI*(0:0.01:tmax);

if a^2*b^2 > 4*b*d*c^2
    
    Ainit = (a*b + sqrt(a^2*b^2 - 4*b*c^2*d))/(2*b*c);
    Iinit = c/(b*Ainit);
    
else
    
    Ainit = 0;
    Iinit = a/d;
    
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
        
        Q = (b/DI)*I.*A.^2;

        dAdt = Q - (c/DI)*A;
        dIdt = (a/DI) - Q - (d/DI)*I;
        
        s = [dAdt; dIdt];
        
    end

end
