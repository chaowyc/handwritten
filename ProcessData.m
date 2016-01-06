function [trainData, testData] = ProcessData(dataSet, trainDataSize, testDataSize)
%��������������
%����������ݼ�dataSet������trainDataSize��testDataSize����Ϊ��Ӧ��С��ѵ�����ݼ��Ͳ������ݼ�,������
%TODO��ʵ�ֽ�����֤������ʵ�ֲο�scikit-learn�Ľ�����֤ģ��ʵ�֣�http://scikit-learn.org/stable/modules/generated/sklearn.cross_validation.train_test_split.html
%input:
%   dataSet ��Ҫ��������ݼ�
%   ����trainDataSize �� testDataSize�ǿ�ѡ�ģ�ȱʡΪ
%   trainDataSize = 100
%   testDataSize = 50
%   ��ΧҲ�������Ƶ�
%   TODO��trainDataSize��testDataSize�ķ�Χ��������
%output:
%   trainData:����trainDataSize��dataSet����֮���ѵ�����ݼ�
%   testData:����testDataSize��testSet����֮��Ĳ������ݼ�
%(c) ������, 2016
if nargin == 1
    trainDataSize = 100;
    testDataSize = 50;
end

%% �������ݣ� ������Դhttp://archive.ics.uci.edu/ml/
[m, n] = size(dataSet);

%% ȡ�����������ص��� ǰ256ά ȡ�����������ǩ ��10ά
img = dataSet(:, 1:256);
T = dataSet(:, 257:266);

%% ����ǩת��Ϊʮ����������dec_T�洢
dec_T = zeros(m, 1);
for i = 1 : m
    id = find(T(i, :) == 1);
    dec_T(i, 1) = id;
end

%% ȥ���ظ��ı�ǩ��������ÿһ������������Ŀ���˲��ֽ�Ϊ�˽����ݼ�����ɣ�Ϊ�������ݼ�Ϊѵ�����ݼ����������ݼ��Ĺ�ģ���ο�
label = unique(dec_T);
c = size(label, 1);
index = zeros(c, 1);
index(1, 1) = size(find(dec_T == label(1, 1)), 1);
for i = 2 : c
    id = find(dec_T == label(i, 1));
    index(i, 1) = index(i - 1, 1) + size(id, 1);
end

%% �ָ����ݼ�����ÿһ��ǰtrainDataSize��Ϊѵ�����ݡ���testDataSize������Ϊ�������ݼ�
trainData = zeros(c * trainDataSize, 256);
testData = zeros(c * testDataSize, 256);

trainData(1: trainDataSize, :) = img(1 : trainDataSize, :);
testData(1 : testDataSize, :) = img(trainDataSize + 1 : trainDataSize + testDataSize, :);
for i = 2 : c
    i
    tmp = (i - 1) * trainDataSize + 1; 
    indexTmp = index(i - 1);
    trainData(tmp : i * trainDataSize, :) = img(indexTmp + 1 : indexTmp + trainDataSize, :);
    tmp = (i - 1) * testDataSize + 1;
    testData(tmp : i * testDataSize, :) = img(indexTmp + trainDataSize + 1 : indexTmp + trainDataSize + testDataSize, :);
end
%% ͨ��isequal(),�������ݼ��ķָ���ȷ���
isequal(trainData(1:trainDataSize, :), img(1:trainDataSize, :))
isequal(testData(1:testDataSize, :), img(trainDataSize + 1 : trainDataSize + testDataSize, :))
for i = 2 : c
    tmp = (i - 1) * trainDataSize + 1; 
    indexTmp = index(i - 1);
    isequal(trainData(tmp : i * trainDataSize, :), img(indexTmp + 1 : indexTmp + trainDataSize, :))
    tmp = (i - 1) * testDataSize + 1;
    isequal(testData(tmp : i * testDataSize, :), img(indexTmp + trainDataSize + 1 : indexTmp + trainDataSize + testDataSize, :))
end


