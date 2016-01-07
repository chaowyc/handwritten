function classificationReport(trueLabel, preLabel, classNum, testDataSize)

%% 以测试样本集的个数和测试类别的个数构造分类结果矩阵 classMat
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

%% 计算精确和召回率 计算方法
%   precision = TP ./ (TP + FP)
%   recall = TP ./ (TP + FN)
%   对于第i类的分类结果其精确度和召回率的计算方法为
%   p[i] = classMat[i, i] ./ sum(classMat(;, i))
%   r[i] = classMat[i, i] ./ sum(classMat(i, :))

precision = zeros(classNum, 1);
recall = zeros(classNum, 1);

for i = 1 : classNum
    precision(i, 1) = classMat(i, i) ./ sum(classMat(:, i));
    recall(i, 1) = classMat(i, i) ./ sum(classMat(i, :));
end

fprintf('分类的结果为：\n');
fprintf('\t\tprecision \trecall\n');
for i = 1 : classNum
   fprintf('class %d', i);
   fprintf('\t %f \t %f\n', precision(i , 1), recall(i ,1));
end