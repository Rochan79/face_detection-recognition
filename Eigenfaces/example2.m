clear all
clc
close all

% You can customize and fix initial directory paths

TrainDatabasePath='D:\New folder\New folder\new_train_database';
TestDatabasePath='D:\New folder\New folder\new_test_database';
T = CreateDatabase(TrainDatabasePath);
[m, A, Eigenfaces] = EigenfaceCore(T);
prompt=('Enter test image name /number:');
    dlg_title='Input of PCA-Based Face Recognition System';
    num_lines= 1;
    def = {'1'};

    TestImage  = inputdlg(prompt,dlg_title,num_lines,def);
    TestImage = strcat(TestDatabasePath,'\',char(TestImage),'.jpg');
    im = imread(TestImage);

    [Euc_dist,Euc_dist_max, Euc_dist_min, OutputName] = Recognition(TestImage, m, A, Eigenfaces);
    if(OutputName == 0)
     disp('face not found')
    else
    SelectedImage = strcat(TrainDatabasePath,'\',OutputName);
    SelectedImage = imread(SelectedImage);

    imshow(im)
    title('Test Image');
    figure,imshow(SelectedImage);
    title('Equivalent Image');
   
end
