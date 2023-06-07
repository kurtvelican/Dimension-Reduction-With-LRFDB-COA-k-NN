function [trainingData, testData, trainingClassData, testClassData] = getDataset()

trainingData = readtable('training.csv');
testData = readtable("test.csv");

trainingClassData = trainingData(:, 1);
trainingClassData = table2cell(trainingClassData);

testClassData = testData(:, 1);
testClassData = table2cell(testClassData);

trainingData(:, 1) = [];
testData(:, 1) = [];

trainingData = table2array(trainingData);
testData = table2array(testData);

end