function [] = myPlotPR(precision, recall)

m = size(precision, 2);
figure
for i = 1 : 10
   plot(precision(i, :));
   string = '\leftarrow class ';
   out = strcat(string, int2str(i));
   pos = floor(m ./ 2);
   text(pos,  precision(i, pos) + 0.5, out, 'HorizontalAlignment', 'left')
   hold all
end
figure
for i = 1 : 10
   plot(recall(i, :));
   string = '\leftarrow class ';
   out = strcat(string, int2str(i));
   pos = floor(m ./ 2);
   text(pos,  recall(i, pos) + 0.5, out, ... 
       'HorizontalAlignment', 'left')
   hold all
end