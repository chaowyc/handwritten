function [precision, recall] = classificationReport(trueLabel, preLabel, classNum, testDataSize)

%% �Բ����������ĸ����Ͳ������ĸ���������������� classMat
m = size(trueLabel, 1);
n = m ./ testDataSize;

classMat = zeros(n, classNum);
classMat(1, 1) = size(find(preLabel(1 : testDataSize, 1) == 1), 1);
for i = 2 : n
   for j = 1 : classNum
      id = find(preLabel((i - 1) * testDataSize + 1 : i * testDataSize, 1) == j);
      classMat(i, j) = size(id, 1);
   end
end

%% ���㾫ȷ���ٻ��� ���㷽��
%   precision = TP ./ (TP + FP)
%   recall = TP ./ (TP + FN)
%   ���ڵ�i��ķ������侫ȷ�Ⱥ��ٻ��ʵļ��㷽��Ϊ
%   p[i] = classMat[i, i] ./ sum(classMat(;, i))
%   r[i] = classMat[i, i] ./ sum(classMat(i, :))

precision = zeros(classNum, 1);
recall = zeros(classNum, 1);

for i = 1 : classNum
    precision(i, 1) = classMat(i, i) ./ sum(classMat(:, i));
    recall(i, 1) = classMat(i, i) ./ sum(classMat(i, :));
end

fprintf('����Ľ��Ϊ��\n');
fprintf('\t\tprecision \trecall\n');
for i = 1 : classNum
   fprintf('class %d', i);
   fprintf('\t %f \t %f\n', precision(i , 1), recall(i ,1));
end