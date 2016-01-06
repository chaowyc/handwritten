function [trainData, trainDataLabel, testData, testDataLabel] = ProcessData(dataSet, trainDataSize, testDataSize)
%函数功能描述：
%对输入的数据集dataSet，根据trainDataSize和testDataSize划分为相应大小的训练数据集和测试数据集,并返回
%TODO：实现交叉验证，函数实现参考scikit-learn的交叉验证模块实现：http://scikit-learn.org/stable/modules/generated/sklearn.cross_validation.train_test_split.html
%input:
%   dataSet 需要处理的数据集
%   参数trainDataSize 和 testDataSize是可选的，缺省为
%   trainDataSize = 100
%   testDataSize = 50
%   范围也是有限制的
%   TODO：trainDataSize和testDataSize的范围进行限制
%output:
%   trainData:根据trainDataSize对dataSet划分之后的训练数据集
%   trainDataLabel:根据trainDataSize对dataSet划分之后的训练数据集所对应的标签
%   testData:根据testDataSize对testSet划分之后的测试数据集
%   testDataLabel:根据testDataSize对testSet划分之后的测试数据集所对应的标签
%(c) 王永超 哈尔滨工业大学计算机科学与技术, 2016
if nargin == 1
    trainDataSize = 100;
    testDataSize = 50;
end

%% 加载数据， 数据来源http://archive.ics.uci.edu/ml/
[m, n] = size(dataSet);

%% 取出样本的像素点阵 前256维 取出样本的类标签 后10维
img = dataSet(:, 1:256);
T = dataSet(:, 257:266);

%% 将标签转化为十进制数并由dec_T存储
dec_T = zeros(m, 1);
for i = 1 : m
    id = find(T(i, :) == 1);
    dec_T(i, 1) = id;
end

%% 去除重复的标签，并计算每一个类别的样本数目，此部分仅为了解数据集的组成，为划分数据集为训练数据集　测试数据集的规模做参考
label = unique(dec_T);
c = size(label, 1);
index = zeros(c, 1);
index(1, 1) = size(find(dec_T == label(1, 1)), 1);
for i = 2 : c
    id = find(dec_T == label(i, 1));
    index(i, 1) = index(i - 1, 1) + size(id, 1);
end

%% 分割数据集，　每一类前trainDataSize条为训练数据　后testDataSize条数据为测试数据集
trainData = zeros(c * trainDataSize, 256);
testData = zeros(c * testDataSize, 256);
trainDataLabel = zeros(c * trainDataSize, 1);
testDataLabel = zeros(c * testDataSize, 1);

trainData(1 : trainDataSize, :) = img(1 : trainDataSize, :);
trainDataLabel(1 : trainDataSize, 1) = dec_T(1 : trainDataSize, 1);
testData(1 : testDataSize, :) = img(trainDataSize + 1 : trainDataSize + testDataSize, :);
testDataLabel(1 : testDataSize, :) = dec_T(trainDataSize + 1 : trainDataSize + testDataSize, :);

for i = 2 : c
    i
    tmp = (i - 1) * trainDataSize + 1; 
    indexTmp = index(i - 1);
    trainData(tmp : i * trainDataSize, :) = img(indexTmp + 1 : indexTmp + trainDataSize, :);
    trainDataLabel(tmp : i * trainDataSize, :) = dec_T(indexTmp + 1 : indexTmp + trainDataSize, :);
    tmp = (i - 1) * testDataSize + 1;
    testData(tmp : i * testDataSize, :) = img(indexTmp + trainDataSize + 1 : indexTmp + trainDataSize + testDataSize, :);
    testDataLabel(tmp : i * testDataSize, :) = dec_T(indexTmp + trainDataSize + 1 : indexTmp + trainDataSize + testDataSize, :);
end
%% 通过isequal(),测试数据集的分割正确与否。
isequal(trainData(1:trainDataSize, :), img(1:trainDataSize, :))
isequal(testData(1:testDataSize, :), img(trainDataSize + 1 : trainDataSize + testDataSize, :))

isequal(trainDataLabel(1:trainDataSize, :), dec_T(1:trainDataSize, :))
isequal(testDataLabel(1:testDataSize, :), dec_T(trainDataSize + 1 : trainDataSize + testDataSize, :))

for i = 2 : c
    tmp = (i - 1) * trainDataSize + 1; 
    indexTmp = index(i - 1);
    isequal(trainData(tmp : i * trainDataSize, :), img(indexTmp + 1 : indexTmp + trainDataSize, :))
    isequal(trainDataLabel(tmp : i * trainDataSize, :), dec_T(indexTmp + 1 : indexTmp + trainDataSize, :))
    tmp = (i - 1) * testDataSize + 1;
    isequal(testData(tmp : i * testDataSize, :), img(indexTmp + trainDataSize + 1 : indexTmp + trainDataSize + testDataSize, :))
    isequal(testDataLabel(tmp : i * testDataSize, :), dec_T(indexTmp + trainDataSize + 1 : indexTmp + trainDataSize + testDataSize, :))
end


