% Step 1: To read the .jpg image
jpgFileName = 'lantern.jpg';  
image = imread(jpgFileName);

% Step 2: To display the color image
figure;
imshow(image);
title('Color Image');

% Step 3: To save it as a .png file
pngFileName = 'output_q1_1.png';  % Replace with your desired output file name
imwrite(image, pngFileName);
img_png = imread('output_q1_1.png')

% Step 4: Getting image dimensions
[heightj, widthj, numChannelsj] = size(image);
[heightp, widthp, numChannelsp] = size(image);
fprintf('Image Dimensions of .jpg (Width x Height x Channels): %d x %d x %d\n', widthj, heightj, numChannelsj);
fprintf('Image Dimensions of .png (Width x Height x Channels): %d x %d x %d\n', widthp, heightp, numChannelsp);

% Step 5: To get image size
jpgFileInfo = dir(jpgFileName);
pngFileInfo = dir(pngFileName);
fprintf('Original .jpg File Size: %d bytes\n', jpgFileInfo.bytes);
fprintf('Saved .png File Size: %d bytes\n', pngFileInfo.bytes);

