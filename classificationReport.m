function classificationReport(trueLabel, preLabel, className)

labels = unique(trueLabel)';
lastLineHeading = 'avg / total'

headers = ['precision', 'recall', 'f1-score', 'support']


