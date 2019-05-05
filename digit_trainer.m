clear all
close all

%call transform data beforehanda
datastore_file = fullfile(pwd, "/raw_data")
imds = imageDatastore(datastore_file, ...
    'IncludeSubfolders',true,'LabelSource','foldernames');


%train a simple network
%trainCascadeObjectDetector("digit_net.xml", data_set, "FalseAlarmRate", 0.1, "NumCasecadeStates", 5);

layers = [
    imageInputLayer([28 28 1])
    
    convolution2dLayer(3,8,'Padding','same')
    batchNormalizationLayer
    reluLayer
    
    maxPooling2dLayer(2,'Stride',2)
    
    convolution2dLayer(3,16,'Padding','same')
    batchNormalizationLayer
    reluLayer
    
    maxPooling2dLayer(2,'Stride',2)
    
    convolution2dLayer(3,32,'Padding','same')
    batchNormalizationLayer %??? idk, matlab answers said to put this in and it fixed a lot
    reluLayer
    
    fullyConnectedLayer(10) %number of catergories: 10 digits
    softmaxLayer
    classificationLayer];
 
options = trainingOptions('sgdm', ...
    'InitialLearnRate',0.01, ...
    'MaxEpochs',4, ...
    'Shuffle','every-epoch', ...
    ...%'ValidationData',imdsValidation, ...
    'ValidationFrequency',30, ...
    'Verbose',false, ...
    'Plots','training-progress');
disp("Begin training")
 trainedNet = trainNetwork(imds,layers, options);
 
 save trainedNet