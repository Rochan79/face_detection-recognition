function [Euc_dist,Euc_dist_max, Euc_dist_min, OutputName,Recognized_index] = Recognition(TestImage, m, A, Eigenfaces)
%  Extracting the PCA features from test image
ProjectedImages = [];
Train_Number = size(Eigenfaces,2);
for i = 1 : Train_Number
    temp = Eigenfaces'*A(:,i); % Projection of centered images into facespace
    ProjectedImages = [ProjectedImages temp]; 
end
InputImage = imread(TestImage);
[irow icol] = size(InputImage);
InImage = reshape(InputImage',irow*icol,1);
Difference = double(InImage)-m;
ProjectedTestImage = Eigenfaces'*Difference; % Test image feature vector

% ProjectedTestImage = Eigenfaces'*V1;
% Calculating Euclidean distances 
% Euclidean distances between the projected test image and the projection
% of all centered training images are calculated. Test image is
% supposed to have minimum distance with its corresponding image in the
% training database.

Euc_dist = [];
for i = 1 : Train_Number
    temp = ( norm( ProjectedTestImage -  ProjectedImages(:,i)) );
    Euc_dist = [Euc_dist temp]
end
[Euc_dist_max , Recognized_index] = max(Euc_dist);
[Euc_dist_min , Recognized_index] = min(Euc_dist);

if (Euc_dist_min <= 0.5*Euc_dist_max )
    OutputName = strcat(int2str(Recognized_index),'.jpg');
else
    OutputName = 0;
end