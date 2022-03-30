I = imread("circuit.tif");
subplot(2, 4, 1),
imshow(I);
truesize([300 200]);
title("Gray Scale Image");
 
% Canny Edge Detection
N = edge(I, 'Canny');
subplot(2, 4, 2),
imshow(N);
title("Canny");