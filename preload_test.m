
mkdir( strcat(pwd, "test_data"))

for ii = 0:9
    mkdir( strcat(pwd, "/test_data/", num2str(ii)))
end

addpath((strcat(pwd, "/img_and_labels")))
addpath(strcat(pwd, "/test_data"))
%load images and labels
images = loadMNISTImages('t10k-images-idx3-ubyte');
labels = loadMNISTLabels('t10k-labels-idx1-ubyte');


for ii = 1:length(labels)
    
    im = mat2gray( reshape( images(:,ii), 28, 28));
   
    imwrite(im,strcat(pwd, '/test_data/',int2str(labels(ii)), '/',int2str(ii),'.jpg'),'jpg');
end