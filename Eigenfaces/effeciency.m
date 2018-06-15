TrainDatabasePath='D:\New folder\New folder\new_train_database';
TestDatabasePath='D:\New folder\New folder\new_test_database';
TrainFiles = dir(TrainDatabasePath);
  T = CreateDatabase(TrainDatabasePath);
[m, A, Eigenfaces] = EigenfaceCore(T);
  op_for_in=[];
for i = 1:162
TestImage  = int2str(i);
    TestImage = strcat(TestDatabasePath,'\',char(TestImage),'.jpg');
    im = imread(TestImage);
    [Euc_dist,Euc_dist_max, Euc_dist_min, OutputName,Recognized_index] = Recognition(TestImage, m, A, Eigenfaces);
   
    op_for_in(i) = Recognized_index ;
end
