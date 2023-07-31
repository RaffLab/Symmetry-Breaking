function [] = plotRing(M,R)

if nargin < 2
    
    R = 100;
    
end

nx = size(M,1);

if size(M,2) > 1
    
    M = M(:,end);
    
end

theta = linspace(0,2*pi*(nx-1)/nx,nx);

hold on
scatter(10*cos(theta),10*sin(theta),R*M,'k','filled')
xlim([-20 20])
ylim([-20 20])
set(gca,'linewidth',2,'fontsize',16)
set(gca,'xtick',[])
set(gca,'ytick',[])
color = get(gcf,'Color');
set(gca,'XColor',color,'YColor',color,'TickDir','out')


end