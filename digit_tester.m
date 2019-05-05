clear all
close all

%call transform data beforehand
datastore_file = fullfile(pwd, "/raw_data")
imds = imageDatastore(datastore_file, ...
    'IncludeSubfolders',true,'LabelSource','foldernames');

load trainedNet

prediction = classify(trainedNet, imds)
validation = imds.Labels;
accuracy = mean(prediction == validation)
%accuracy last tested at around .9228