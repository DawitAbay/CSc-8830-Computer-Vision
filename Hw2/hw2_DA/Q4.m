I = checkerboard;
corners = detectHarrisFeatures(I);
imshow(I); hold on;
plot(corners.selectStrongest(5000));
truesize([300 200]);
title('detect Harris corner')