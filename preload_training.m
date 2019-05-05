

mkdir( strcat(pwd, "/training_data"))

for ii = 0:9
    mkdir( strcat(pwd, "/training_data/", num2str(ii)))
end

addpath((strcat(pwd, "/img_and_labels")))
addpath(strcat(pwd, "/training_data"))
%load images and labels
images = loadMNISTImages('t10k-images-idx3-ubyte');
labels = loadMNISTLabels('t10k-labels-idx1-ubyte');


for ii = 1:length(labels)
    
    im = mat2gray( reshape( images(:,ii), 28, 28));
   
    imwrite(im,strcat(pwd, '/training_data/',int2str(labels(ii)), '/',int2str(ii),'.jpg'),'jpg');
end