unzip('DataBase.zip');

imds = imageDatastore('DataBase','IncludeSubfolders',true,'LabelSource','foldernames');


tbl = countEachLabel(imds);

figure
montage(imds.Files(1:16:end))


[trainingSet, validationSet] = splitEachLabel(imds, 0.6, 'randomize');

bag = bagOfFeatures(trainingSet);



img = readimage(imds, 1);
featureVector = encode(bag, img);


% Plot the histogram of visual word occurrences
figure
bar(featureVector)
title('Visual word occurrences')
xlabel('Visual word index')
ylabel('Frequency of occurrence')

categoryClassifier = trainImageCategoryClassifier(trainingSet, bag);


confMatrix = evaluate(categoryClassifier, trainingSet);

confMatrix = evaluate(categoryClassifier, validationSet);

% Compute average accuracy
mean(diag(confMatrix))


img = imread(fullfile('MerchData','MathWorks Cap','Hat_0.jpg'));
figure
imshow(img)

[labelIdx, scores] = predict(categoryClassifier, img);

% Display the string label
categoryClassifier.Labels(labelIdx)




