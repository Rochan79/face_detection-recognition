function [Euc_dist,Euc_dist_max, Euc_dist_min, flag_face_or_not, OutputName] = Recognition1(TestImage, m, A, Eigenfaces)
flag_face_or_not=0;
Euc_dist_max=0;

% reading input image and finding the eigen face for it 
InputImage = imread(TestImage);
temp = InputImage(:,:,1);
[irow icol] = size(temp);
InImage = reshape(temp',irow*icol,1);
% m=(m+InImage)/2;%optional
Difference = double(InImage)-m; % Centered test image
ProjectedTestImage = Eigenfaces'*Difference; 

% projection of image 
ProjectedImages = [];
Train_Number = size(Eigenfaces,2);
for i = 1 : Train_Number
    temp = Eigenfaces'*A(:,i); % Projection of centered images into facespace
    ProjectedImages = [ProjectedImages temp]; 
end

% Eucledian distance is 
Euc_dist=[]
% for i=1:Train_Number
%     Euc_dist_temp = (ProjectedTestImage-ProjectedImages(:,i)) 
%     if Euc_dist_temp < 0
%         Euc_dist_temp=Euc_dist*(-1);
%     end
%     Euc_dist=[Euc_dist Euc_dist_temp ];
% end
     Euc_dist = norm(ProjectedTestImage-ProjectedImages(:,i));
     [Euc_dist_min , Recognized_index1] = min(Euc_dist);
%thresholding 
threshold=[];
% [Euc_dist_max , Recognized_index] = max(Euc_dist);

for i=1:Train_Number
    for j=1:Train_Number
        threshold(i,j) = norm(ProjectedImages(:,i)-ProjectedImages(:,j));
%         if(j==1 && i==1 )
%             threshold=threshold_temp;
%         else
%             if(threshold < threshold_temp)
%                 threshold = threshold_temp;
%             end
%         end
    end
end

[threshold , Recognized_index] = max(threshold);

threshold =0.5 * threshold;
% reconstructed image
reconstructed_image = Eigenfaces*ProjectedTestImage + m;
if(Euc_dist_min < threshold)
     OutputName = strcat(int2str(Recognized_index1),'.jpg');
     else

    flag_face_or_not =1;
    OutputName = 0;
end
end