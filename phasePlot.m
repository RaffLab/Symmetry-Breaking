function [] = phasePlot(xvec,yvec,nPeaks,nZero,str_x,str_y,xScale,yScale,fun1,fun2,fun3)

nPeaks = nPeaks.*(nZero ~= 1);

ax1 = axes;
imagesc(ax1,flipud(mean(nPeaks,3)),'AlphaData',(1-flipud(mean(nZero,3))))
hold all

if nargin < 7
    
    xScale = 'linear';
    yScale = 'linear';
    
end

if nargin > 8
    
    plot(1:length(xvec),yPlotFun(yvec,fun1,yScale),'r','linewidth',3)
    
    if nargin > 9
        
        plot(1:length(xvec),yPlotFun(yvec,fun2,yScale),'r','linewidth',3)

        if nargin > 10
            
            plot(1:length(xvec),yPlotFun(yvec,fun3,yScale),'r','linewidth',3)

        end
        
    end
    
end

if strcmp(xScale,'log') == 1
    
    px = 0:1:log10(max(xvec)/min(xvec));
    xticklabels = min(xvec)*10.^px;
    
else
    
    xticklabels = 0:max(xvec)/5:max(xvec);
    
end

if strcmp(yScale,'log') == 1
    
    py = 0:1:log10(max(yvec)/min(yvec));
    yticklabels = min(yvec)*10.^py;
    
else
    
    yticklabels = 0:max(yvec)/5:max(yvec);
    
end

xlabel(str_x,'interpreter','latex')
ylabel(str_y,'interpreter','latex')
xticks = linspace(1, size(nPeaks, 2), numel(xticklabels));
set(ax1, 'XTick', xticks, 'XTickLabel', xticklabels,'color','k')
yticks = linspace(1, size(nPeaks, 1), numel(yticklabels));
set(ax1, 'YTick', yticks, 'YTickLabel', flipud(yticklabels(:)),'Color','k','fontsize',18)

cb = colorbar(ax1);
cb.Position = cb.Position + [0.07 0 0 0];

end

function yPlot = yPlotFun(yvec,funIn,yScale)
    
    if strcmp(yScale,'log') == 1
        
        yPlot = length(yvec) - (length(yvec)/log(max(yvec)))*log(funIn);
        
    else
        
        yPlot = length(yvec) - (length(yvec)/max(yvec))*funIn;
        
    end
    
end