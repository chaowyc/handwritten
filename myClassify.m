function preLabel = myClassify(testData, trainData, trainDataLabel, kNum)

labels = unique(trainDataLabel);
c = size(labels, 1);
m = size(testData, 1);
dist = pdist2(testData, trainData);
if kNum == 1
    [preValue, id] = min(dist, [], 2);
    preLabel = trainDataLabel(id);
else
    [preValue, id] = sort(dist, 2);
    kMat = zeros(m ,c);
    for i = 1 : c
       if m == 1
          kMat(i) = sum(trainDataLabel(id(:, 1 : kNum)) == labels(i));
       else
           kMat(:, i) = sum(trainDataLabel(id(:, 1 : kNum)) == labels(i), 2);
       end
    end
    [y, j] = max(kMat, [], 2);
    preLabel = labels(j);
end