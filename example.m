% You can customize and fix initial directory paths
% TrainDatabasePath = uigetdir('E:\downloaded files from internet\mayur\sem 6\project\finalllllllllll\new_train_database', 'Select training database path' );
% TestDatabasePath = uigetdir('E:\downloaded files from internet\mayur\sem 6\project\finalllllllllll\new_test_database', 'Select test database path');

T = CreateDatabase('D:\New folder\New folder\new_train_database');
[m, A, Eigenfaces] = EigenfaceCore(T);
save face_variables.mat
% OutputName = Recognition(im, m, A, Eigenfaces);