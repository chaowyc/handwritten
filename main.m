%% �������ݣ� ������Դhttp://archive.ics.uci.edu/ml/
load data\semeion.data

%% ����ProcessData(DataSet, optional)�����ݼ�����Ԥ���� ������
%   �����÷� 
%   ProcessData(DataSet)
%   ProcessData(DataSet, trainDataSize, testDataSize)
%   1. ��ȡ���������ص� �����ı�ǩ
%   2. �������ı�ǩתΪʮ����������1000000000 -> 1 0100000000 -> 2�ȵ�
%   3. ��ǩȥ��
%   4. ���ݼ��ָÿһ�����ѡȡtrainDataSize���������ѵ�����ݼ���ѡȡtestDataSize��������ɲ������ݼ�
%   5. DataSet Ϊ��Ҫ��������ݼ� optional �ǿ�ѡ��trainDataSize ��
%   testDataSize�����û����ʾָ����trainDataSize=100 testDataSize=50
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[trainData, testData] = ProcessData(semeion);



