function [templates, templatesLabel] = OneTemplatesTrain(trainData, trainDataLabel)
% 函数功能描述：
% 对trainData的每一个类别的所有样本求均值，作为该类别的代表样本，并返回代表样本集和对应的类别标签
% input:
%   trainData:训练数据样本集
%   trainDataLabel:训练数据样本集所对应的标签
% output:
%   templates:代表样本集
%   templatesLabel:代表样本集对应的类别标签
% c 王永超 哈尔滨工业大学计算机科学与技术 2016
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[m, n] = size(trainData);
labels = unique(trainDataLabel);
c = size(labels, 1);

templates = zeros(c, n);
templatesLabel = zeros(c, 1);

%% 找到每一个类别的所有样本，然后求均值得到每一个类别的代表模板，最终所有类别的代表模板在templates中
for i = 1 : c
    id = find(trainDataLabel == labels(i, 1));
    templates(i, :) = mean(trainData(id , :));
    templatesLabel(i, 1) = i;
end

