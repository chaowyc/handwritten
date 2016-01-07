function myNNClassify(semeion, labelForPca, labelForKNN, kNum)
% 函数ProcessData(DataSet, optional)对数据集进行预处理 包括：
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
[trainData, trainDataLabel, testData, testDataLabel] = ProcessData(semeion, labelForPca);


%% 函数OneTemplatesTrain(trainData, trainDataLabel)学习每一个类别的代表模板
%   函数用法
%   OneTemplatesTrain(trainData, trainDataLabel)
%   input:
%       trainData: 训练数据集 规模m * d
%       trainDataLabel: 训练数据集标签 规模m * 1
%   output:
%       templates:代表样本集 规模c * d
%       templates:代表样本集标签 规模c * 1
if strcmp(labelForKNN, 'false') == 1
    [templates, templatesLabel] = OneTemplatesTrain(trainData, trainDataLabel);
    [preLabel] = myClassify(testData, templates, templatesLabel, 1);
    classificationReport(testDataLabel, preLabel, 10, 50);
else
    precision = zeros(10, kNum);
    recall = zeros(10, kNum);
    for i = 1 : kNum
        [preLabel] = myClassify(testData, trainData, trainDataLabel, i);
        [x, y] = classificationReport(testDataLabel, preLabel, 10, 50);
        precision(:, i) = x;
        recall(:, i) = y;
    end
    myPlotPR(precision, recall);
end
