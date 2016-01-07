function [lowDimData, dd]= pca(dataSet, percent)
% 主成分分析
%   输出：将为之后的数据集 以及 维度dd
[n ,d] = size(dataSet);
%求均值
mu = mean(dataSet);
%求协方差矩阵
covMat = cov(dataSet);
%求特征向量及特征值
[vactor, value] = eigs(covMat, d);

lamda = diag(value);

accLamda = cumsum(lamda);

t = accLamda(d) * percent;
% 根据percent确定降维之后的维度数目
dd = find((accLamda(2:d) >= t) & (accLamda(1 : d -1) < t)) + 1;

E = vactor(:, 1 : dd);

lowDimData = (dataSet - repmat(mu, n, 1)) * E;

