%% ����˵��
%   handwrittenΪģʽʶ�� knn��д����ʶ�� ������ҵ��
%   author��������(chaowyc)
%   ����ԭ�ͣ�
%   myNNClassify(dataSet, labelForPca, labelForKNN, kNum)
%   ����˵����
%   dataSet: �������ݼ������(m * d)mΪ������Ŀ dΪ����ά��
%   labelForPca: ����Ƿ�ʹ��PCA(���ɷַ���)�����ݼ����н�ά������labelForPca = 'true'
%   �������н�ά��Ĭ��ʹ����ԭ���ݡ�
%   labelForKNN: ����Ƿ�ʹ��KNN������������labelForKNN = 'true'ʱ������ʹ��
%   knn,Ĭ��ʹ�����ڽ�����������
%   kNum:��ʹ��Knn������ʱ������kֵ (K >= 1)��
%   ��Ҫ���ܣ�
%   1. ʵ�����ڽ������� ͨ����ģ��ʵ�ּ���
%   myNNClassify(semeion, 'false', 'false', 0)
%   2. ʵ��Knn������
%   myNNClassify(semeion, 'false', 'true', 5);
%   3. ʵ��PCA�����ݽ��н�ά
%   ���Ʋ��� labelForPca Ϊ 'true' ���ɵ���
%   4. ʵ�־�ȷ��(precision)�ٻ���(recall)�Է����������ܽ�������
%       ��ʽ������̨��� classificationReport ����
%             ��ͼչʾprecision&recall�ı仯����(������knn������)
%   ���룺https://www.github.com/chaowyc/handwritten
%   �ĵ���https://www.github.com/chaowyc/handwritten/wiki
%   TODO��
%   1.ʵ��RP����
%
%   c ������ ��������ҵ��ѧ�������ѧ�뼼�� 2016

clear;
clc;

%% �������ݣ� ������Դhttp://archive.ics.uci.edu/ml/
load data\semeion.data

%���漸���������ÿ�ʵ�������������ܣ�����ʱȥ��ע�ͼ��ɡ�

% ���ڽ������� �� ����
%myNNClassify(semeion, 'false', 'false', 0);

% KNN
myNNClassify(semeion, 'false', 'true', 3);

% PCA+���ڽ�������
%myNNClassify(semeion, 'true', 'false', 0);

%PCA+KNN
%myNNClassify(semeion, 'true', 'true', 10);
