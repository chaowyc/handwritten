function [lowDimData, dd]= pca(dataSet, percent)
% 主成分分析

[n ,d] = size(dataSet);

mu = mean(dataSet);

covMat = cov(dataSet);

[vactor, value] = eigs(covMat, d);

lamda = diag(value);

accLamda = cumsum(lamda);

t = accLamda(d) * percent;

dd = find((accLamda(2:d) >= t) & (accLamda(1 : d -1) < t)) + 1;

E = vactor(:, 1 : dd);

lowDimData = (dataSet - repmat(mu, n, 1)) * E;

