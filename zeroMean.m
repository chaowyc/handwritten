function [meanVal, newData] = zeroMean(dataSet)
% ���ֵ��, ��������ϵ��ԭ�����ԭ����ϵ��ԭ�㴦������������

meanVal = mean(dataSet);
m = size(dataSet, 1);
for i = 1 ; m
   newData(i, :) = dataSet(i, :) - meanVal;   
end