function [meanVal, newData] = zeroMean(dataSet)
% 零均值化, 将新坐标系的原点放在原坐标系的原点处，减少运算量

meanVal = mean(dataSet);
m = size(dataSet, 1);
for i = 1 ; m
   newData(i, :) = dataSet(i, :) - meanVal;   
end