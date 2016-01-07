function [trainData, trainDataLabel, testData, testDataLabel] = ProcessData(dataSet, trainDataSize, testDataSize)
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
%   trainDataLabel:����trainDataSize��dataSet����֮���ѵ�����ݼ�����Ӧ�ı�ǩ
%   testData:����testDataSize��testSet����֮��Ĳ������ݼ�
%   testDataLabel:����testDataSize��testSet����֮��Ĳ������ݼ�����Ӧ�ı�ǩ
%(c) ������ ��������ҵ��ѧ�������ѧ�뼼��, 2016
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
precData = zeros(m , 256);
precData(1 : index(1, 1), :) = img(find(dec_T == label(1, 1)), :);
precLabel(1 : index(1, 1), 1) = dec_T(find(dec_T == label(1, 1)), 1);
for i = 2 : c
    id = find(dec_T == label(i, 1));
    index(i, 1) = index(i - 1, 1) + size(id, 1);
    precData(index(i - 1, 1) + 1 : index(i ,1), :) = img(id, :);
    precLabel(index(i -1, 1) + 1 : index(i, 1), 1) = dec_T(id, 1);
end

%% �ָ����ݼ�����ÿһ��ǰtrainDataSize��Ϊѵ�����ݡ���testDataSize������Ϊ�������ݼ�
trainData = zeros(c * trainDataSize, 256);
testData = zeros(c * testDataSize, 256);
trainDataLabel = zeros(c * trainDataSize, 1);
testDataLabel = zeros(c * testDataSize, 1);

trainData(1 : trainDataSize, :) = precData(1 : trainDataSize, :);
trainDataLabel(1 : trainDataSize, 1) = precLabel(1 : trainDataSize, 1);
testData(1 : testDataSize, :) = precData(trainDataSize + 1 : trainDataSize + testDataSize, :);
testDataLabel(1 : testDataSize, :) = precLabel(trainDataSize + 1 : trainDataSize + testDataSize, :);

for i = 2 : c
    i
    tmp = (i - 1) * trainDataSize + 1; 
    indexTmp = index(i - 1);
    trainData(tmp : i * trainDataSize, :) = precData(indexTmp + 1 : indexTmp + trainDataSize, :);
    trainDataLabel(tmp : i * trainDataSize, :) = precLabel(indexTmp + 1 : indexTmp + trainDataSize, :);
    tmp = (i - 1) * testDataSize + 1;
    testData(tmp : i * testDataSize, :) = precData(indexTmp + trainDataSize + 1 : indexTmp + trainDataSize + testDataSize, :);
    testDataLabel(tmp : i * testDataSize, :) = precLabel(indexTmp + trainDataSize + 1 : indexTmp + trainDataSize + testDataSize, :);
end
%% ͨ��isequal(),�������ݼ��ķָ���ȷ���
isequal(trainData(1:trainDataSize, :), precData(1:trainDataSize, :));
isequal(testData(1:testDataSize, :), precData(trainDataSize + 1 : trainDataSize + testDataSize, :));

isequal(trainDataLabel(1:trainDataSize, :), precLabel(1:trainDataSize, :));
isequal(testDataLabel(1:testDataSize, :), precLabel(trainDataSize + 1 : trainDataSize + testDataSize, :));

for i = 2 : c
    tmp = (i - 1) * trainDataSize + 1; 
    indexTmp = index(i - 1);
    isequal(trainData(tmp : i * trainDataSize, :), precData(indexTmp + 1 : indexTmp + trainDataSize, :));
    isequal(trainDataLabel(tmp : i * trainDataSize, :), precLabel(indexTmp + 1 : indexTmp + trainDataSize, :));
    tmp = (i - 1) * testDataSize + 1;
    isequal(testData(tmp : i * testDataSize, :), precData(indexTmp + trainDataSize + 1 : indexTmp + trainDataSize + testDataSize, :));
    isequal(testDataLabel(tmp : i * testDataSize, :), precLabel(indexTmp + trainDataSize + 1 : indexTmp + trainDataSize + testDataSize, :));
end


