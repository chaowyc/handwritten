function preLabel = myClassify(testData, trainData, trainDataLabel, kNum)
% 函数描述：实现输入样本的分类
%   参数：
%   input:
%   testData:测试样本
%   trainData:训练样本
%   trainDataLabel:训练样本的标签
%   kNum:当选择Knn分类器时 设置k值
%   output:
%   preLabel:输入样本的标签

labels = unique(trainDataLabel);
c = size(labels, 1);
m = size(testData, 1);
dist = pdist2(testData, trainData);
%% 算法实现 
if kNum == 1
    [preValue, id] = min(dist, [], 2);
    preLabel = trainDataLabel(id);
else
    [preValue, id] = sort(dist, 2);
    kMat = zeros(m ,c);
    for i = 1 : c
       if m == 1
          kMat(i) = sum(trainDataLabel(id(:, 1 : kNum)) == labels(i));
       else
           kMat(:, i) = sum(trainDataLabel(id(:, 1 : kNum)) == labels(i), 2);
       end
    end
    [y, j] = max(kMat, [], 2);
    preLabel = labels(j);
end