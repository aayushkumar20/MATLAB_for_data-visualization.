% Read the xlsx file
All_StuMarks = readtable('Exam_Marks.xlsx', 'PreserveVariableNames', true);
Marks = All_StuMarks{:, 5:9};

% Find missing indices
idx = find(isnan(Marks));
Marks(idx) = 0;

% Find the plot
boxplot(Marks)
h = findobj(gca, 'Tag', 'Median');
set(h, {'xData'}, {(1);(2);(3);(4);(5)}, ...
    {'yData'}, {(mean(Marks(:,1)));(mean(Marks(:,2)));(mean(Marks(:,3)));(mean(Marks(:,4)));(mean(Marks(:,5)))},...
    'marker','v', 'color', 'm')

% positions = [1, 2, 3, 4, 5];
% set(gca,'xtick',[mean(positions(1)) mean(positions(2)) mean(positions(3)) mean(positions(4)) mean(positions(5))])
% set(gca,'TickLabelInterpreter','latex');
% set(gca,'xticklabel',{'Q.No=1' 'Q.No=2' 'Q.No=3' 'Q.No=4' 'Q.No=5'})

% set(gca,...
%         'Units','normalized',...
%         'FontUnits','points',...
%         'FontWeight','bold',...
%         'FontSize',14,...
%         'Box','on');


