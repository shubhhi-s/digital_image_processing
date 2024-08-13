% Step 1: Reading the .jpg image
jpgFileName = 'lantern.jpg';  
image = imread(jpgFileName);

% Step 2: Defining the coordinates and size of the subimage (e.g., a region of interest)
% Specifying the coordinates (x, y) of the top-left corner and the width and height
x = 300;  
y = 400;  
width = 200;  
height = 200; 

% Step 3: Extracting the subimage
subimage = image(y:y+height-1, x:x+width-1, :);

% Step 4: Displaying  the subimage
figure;
%subplot(1, 2, 1);
imshow(subimage);
title('Subimage');

% Step 5: Printing pixel intensities of the subimage
% Getting the intensities for each channel (R, G, B)
redChannel = subimage(:, :, 1);
greenChannel = subimage(:, :, 2);
blueChannel = subimage(:, :, 3);

% Displaying the pixel intensities for each channel
fprintf('Red Channel Intensities:\n');
disp(redChannel);
fprintf('Green Channel Intensities:\n');
disp(greenChannel);
fprintf('Blue Channel Intensities:\n');
disp(blueChannel);

% Step 6: Saving the subimage as a new image
newImageFileName = 'subimage.png';  
imwrite(subimage, newImageFileName);

% Step 7: Calculating variation in intensity range for each channel
originalIntensityRange = [min(image(:)), max(image(:))];
subimageIntensityRangeRed = [min(redChannel(:)), max(redChannel(:))];
subimageIntensityRangeGreen = [min(greenChannel(:)), max(greenChannel(:))];
subimageIntensityRangeBlue = [min(blueChannel(:)), max(blueChannel(:))];

fprintf('\nIntensity Range in Original Image (All Channels):\n');
fprintf('Min: %d, Max: %d\n', originalIntensityRange(1), originalIntensityRange(2));

fprintf('\nIntensity Range in Subimage:\n');
fprintf('Red Channel: Min: %d, Max: %d\n', subimageIntensityRangeRed(1), subimageIntensityRangeRed(2));
fprintf('Green Channel: Min: %d, Max: %d\n', subimageIntensityRangeGreen(1), subimageIntensityRangeGreen(2));
fprintf('Blue Channel: Min: %d, Max: %d\n', subimageIntensityRangeBlue(1), subimageIntensityRangeBlue(2));
