clear
clc
load face_variables.mat
TestDatabasePath='D:\New folder\New folder\new_test_database';
prompt=('Enter test image name /number:');
    dlg_title='Input of PCA-Based Face Recognition System';
    num_lines= 1;
    def = {'1'};

    TestImage  = inputdlg(prompt,dlg_title,num_lines,def);
    TestImage = strcat(TestDatabasePath,'\',char(TestImage),'.jpg');
    im = imread(TestImage);

[Euc_dist,Euc_dist_max, Euc_dist_min, flag_face_or_not, OutputName] = Recognition(TestImage, m, A, Eigenfaces);
    if(flag_face_or_not == 1)
     disp('face not found')
    else
    SelectedImage = strcat(TrainDatabasePath,'\',OutputName);
    SelectedImage = imread(SelectedImage);

    imshow(im)
    title('Test Image');
    figure,imshow(SelectedImage);
    title('Equivalent Image');
%     prompt=('To continue press 1');
%     dlg_title='Input of PCA-Based Face Recognition System';
%     num_lines= 1;
%     def = {'1'};
%     exit = inputdlg(prompt,dlg_title,num_lines,def);
end
