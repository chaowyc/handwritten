%% 程序说明
%   handwritten为模式识别 knn手写数字识别 课下作业。
%   author：王永超(chaowyc)
%   函数原型：
%   myNNClassify(dataSet, labelForPca, labelForKNN, kNum)
%   参数说明：
%   dataSet: 输入数据集，规格(m * d)m为样本数目 d为样本维度
%   labelForPca: 标记是否使用PCA(主成分分析)对数据集进行降维，仅当labelForPca = 'true'
%   表明进行降维。默认使用是原数据。
%   labelForKNN: 标记是否使用KNN分类器，仅当labelForKNN = 'true'时，表明使用
%   knn,默认使用最邻近分类器分类
%   kNum:当使用Knn分类器时，设置k值 (K >= 1)。
%   主要功能：
%   1. 实现最邻近分类器 通过单模板实现加速
%   myNNClassify(semeion, 'false', 'false', 0)
%   2. 实现Knn分类器
%   myNNClassify(semeion, 'false', 'true', 5);
%   3. 实现PCA对数据进行降维
%   控制参数 labelForPca 为 'true' 即可调用
%   4. 实现精确度(precision)召回率(recall)对分类器的性能进行评价
%       形式：控制台输出 classificationReport （）
%             画图展示precision&recall的变化趋势(仅限于knn分类器)
%   代码：https://www.github.com/chaowyc/handwritten
%   文档：https://www.github.com/chaowyc/handwritten/wiki
%   TODO：
%   1.实现RP曲线
%
%   c 王永超 哈尔滨工业大学计算机科学与技术 2016

clear;
clc;

%% 加载数据， 数据来源http://archive.ics.uci.edu/ml/
load data\semeion.data

%下面几个函数调用可实现上述描述功能，调用时去掉注释即可。

% 最邻近分类器 及 加速
%myNNClassify(semeion, 'false', 'false', 0);

% KNN
myNNClassify(semeion, 'false', 'true', 3);

% PCA+最邻近分类器
%myNNClassify(semeion, 'true', 'false', 0);

%PCA+KNN
%myNNClassify(semeion, 'true', 'true', 10);
