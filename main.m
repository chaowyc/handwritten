%% 加载数据， 数据来源http://archive.ics.uci.edu/ml/
load data\semeion.data

%% 函数ProcessData(DataSet, optional)对数据集进行预处理 包括：
%   函数用法 
%   ProcessData(DataSet)
%   ProcessData(DataSet, trainDataSize, testDataSize)
%   1. 提取出样本像素点 样本的标签
%   2. 将样本的标签转为十进制数，如1000000000 -> 1 0100000000 -> 2等等
%   3. 标签去重
%   4. 数据集分割，每一个类别选取trainDataSize的数据组成训练数据集，选取testDataSize的数据组成测试数据集
%   5. DataSet 为需要处理的数据集 optional 是可选的trainDataSize 和
%   testDataSize，如果没有显示指定，trainDataSize=100 testDataSize=50
%   函数最终返回处理之后的训练数据集和对应的类标签 以及 测试数据及和对应的标签
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[trainData, trainDataLabel, testData, testDataLabel] = ProcessData(semeion);



