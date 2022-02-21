imageFileName = fullfile(toolboxdir('vision'),'visiondata','calibration','webcam','image4.tif');
I = imread(imageFileName);
[imagePoints,boardSize] = detectCheckerboardPoints(I);
J = insertText(I,imagePoints,1:size(imagePoints,1));
J = insertMarker(J,imagePoints,'o','Color','red','Size',5);
imshow(J);
title(sprintf('Detected a %d x %d Checkerboard',boardSize));