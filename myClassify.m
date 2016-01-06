function preLabel = myClassify(testData, trainData, trainDataLabel)

dist = pdist2(testData, trainData);
[preValue, id] = min(dist, [], 2);
preLabel = trainDataLabel(id);