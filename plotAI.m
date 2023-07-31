function [] = plotAI(A,I,ymaxA,ymaxI)

nx = size(A,1);
x  = 0:2*pi/(nx-1):2*pi;

hold on
% yyaxis left
plot(x,A,'r','linewidth',2)
ylim([0 ymaxA])
% 
% yyaxis right
plot(x,I,'b','linewidth',2)
% ylim([0 ymaxI])

% ax = gca;
% ax.YAxis(1).Color = 'r';
% ax.YAxis(2).Color = 'b';
set(gca,'linewidth',2,'fontsize',13)
set(gca,'XTick',0:pi:2*pi)
set(gca,'XTickLabel',{'0','\pi','2\pi'})

end