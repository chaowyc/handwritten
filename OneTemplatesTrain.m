function [templates, templatesLabel] = OneTemplatesTrain(trainData, trainDataLabel)
% ��������������
% ��trainData��ÿһ�����������������ֵ����Ϊ�����Ĵ��������������ش����������Ͷ�Ӧ������ǩ
% input:
%   trainData:ѵ������������
%   trainDataLabel:ѵ����������������Ӧ�ı�ǩ
% output:
%   templates:����������
%   templatesLabel:������������Ӧ������ǩ

[m, n] = size(trainData);
labels = unique(trainDataLabel);
c = size(labels, 1);

templates = zeros(c, n);
templatesLabel = zeros(c, 1);

%% �ҵ�ÿһ����������������Ȼ�����ֵ�õ�ÿһ�����Ĵ���ģ�壬�����������Ĵ���ģ����templates��
for i = 1 : c
    id = find(trainDataLabel == labels(i, 1));
    templates(i, :) = mean(trainData(id , :));
    templatesLabel(i, 1) = i;
end

