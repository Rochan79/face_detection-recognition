% TrainDatabasePath='E:\downloaded files from internet\mayur\sem 6\project\finalllllllllll\new_train_database';
% T = [];
% % prompt=('To continue press 1');
% % dlg_title='Input of PCA-Based Face Recognition System';
% % num_lines= 1;
% % def = {'1'};
% % exit = inputdlg(prompt,dlg_title,num_lines,def);
% 
% for i = 1 :  431
% str = int2str(i);
% str = strcat('\',str,'.jpg');
% str = strcat(TrainDatabasePath,str);
% img = imread(str);
% [irow icol] = size(img);
% temp1 = reshape(img',irow*icol,1);   
% T = [T temp1];
% end
% a=10;
% b=20;
% save fff.mat
% % m = mean(T,2);
% % A=[];
% % for i= 1 : 431
% % temp = double(T(:,i)) - m;
% % A=[A temp];
% % end
% 
% a=rand(1,6);
% b=rand(1,6);
% d=sqrt(sum((a-b).^2));
% v=a-b;
% cc=sqrt(v*v');
% nnn=norm(a-b);
TestImage='D:\New folder\New folder\new_train_database\1.jpg';
InputImage = imread(TestImage);


[irow icol] = size(InputImage);


