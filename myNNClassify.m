function myNNClassify(semeion, labelForPca, labelForKNN, kNum)
% ����ProcessData(DataSet, optional)�����ݼ�����Ԥ���� ������
%   �����÷� 
%   ProcessData(DataSet)
%   ProcessData(DataSet, trainDataSize, testDataSize)
%   1. ��ȡ���������ص� �����ı�ǩ
%   2. �������ı�ǩתΪʮ����������1000000000 -> 1 0100000000 -> 2�ȵ�
%   3. ��ǩȥ��
%   4. ���ݼ��ָÿһ�����ѡȡtrainDataSize���������ѵ�����ݼ���ѡȡtestDataSize��������ɲ������ݼ�
%   5. DataSet Ϊ��Ҫ��������ݼ� optional �ǿ�ѡ��trainDataSize ��
%   testDataSize�����û����ʾָ����trainDataSize=100 testDataSize=50
%   �������շ��ش���֮���ѵ�����ݼ��Ͷ�Ӧ�����ǩ �Լ� �������ݼ��Ͷ�Ӧ�ı�ǩ
[trainData, trainDataLabel, testData, testDataLabel] = ProcessData(semeion, labelForPca);


%% ����OneTemplatesTrain(trainData, trainDataLabel)ѧϰÿһ�����Ĵ���ģ��
%   �����÷�
%   OneTemplatesTrain(trainData, trainDataLabel)
%   input:
%       trainData: ѵ�����ݼ� ��ģm * d
%       trainDataLabel: ѵ�����ݼ���ǩ ��ģm * 1
%   output:
%       templates:���������� ��ģc * d
%       templates:������������ǩ ��ģc * 1
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
