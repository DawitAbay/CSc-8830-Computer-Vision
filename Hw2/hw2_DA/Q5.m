clc;
clear all;
close all;
F = imread('lawschoolbuilding_team2_3.png');
S = imread('lawschoolbuilding_team2_2.png');
V = imread('lawschoolbuilding_team2_1.png');

F = im2double(rgb2gray(F));
S = im2double(rgb2gray(S));
V = im2double(rgb2gray(V));
[rows, cols] = size(F);
Tmp = [];
Tmp1 = [];
temp = 0;

for i = 1:rows
    for j = 1:5
        S1(i,j) = S(i,j);
        V1(i,j) = V(i,j);
    end
end

for k = 0:cols-5 
    for j = 1:5
        F1(:,j) = F(:,k+j);
    end
    temp = corr2(F1,S1);
    Tmp = [Tmp temp]; 
    temp = 0;
end
[Min_value, Index] = max(Tmp);

n_cols = Index + cols - 1;
Opimg = [];
for i = 1:rows
    for j = 1:Index-1
        Opimg(i,j) = F(i,j);
    end
    for k = Index:n_cols
        Opimg(i,k) = S(i,k-Index+1);
    end    
end
[r_Opimg, c_Opimg] = size(Opimg);

for k = 0:c_Opimg-5
    for j = 1:5
        Opimg1(:,j) = Opimg(:,k+j);
    end
    temp = corr2(Opimg1,V1);
    Tmp1 = [Tmp1 temp]; 
    temp = 0;
end

[r_V, c_V] = size(V);
[Min_value, Index] = max(Tmp1);

n_cols = Index + c_V - 1;
Opimg1 = [];
for i = 1:rows
    for j = 1:Index-1
        Opimg1(i,j) = Opimg(i,j);
    end
    for k = Index:n_cols
        Opimg1(i,k) = V(i,k-Index+1);
    end    
end

[r_Opimg c_Opimg] = size(Opimg1);
figure,
subplot(2,3,1);
imshow(F);axis ([1 c_Opimg 1 r_Opimg])
title('First Image');
subplot(2,3,2);
imshow(S);axis ([1 c_Opimg 1 r_Opimg])
title('Second Image');
subplot(2,3,3);
imshow(V);axis ([1 c_Opimg 1 r_Opimg])
title('Third Image');
subplot(2,3,[4 5 6]);
imshow(Opimg1);axis ([1 c_Opimg 1 r_Opimg])
title('Stitched Image');