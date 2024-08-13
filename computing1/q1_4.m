% Step 1: Reading the .jpg image
jpgFileName = 'lantern.jpg';  
image = imread(jpgFileName);

% Step 2: Defining the coordinates and size of the subimage (e.g., a region of interest)
% Specify the coordinates (x, y) of the top-left corner and the width and height
x = 300;  
y = 400;  
width = 200;  
height = 200;  

% Step 3: Extracting the subimage
subimage = image(y:y+height-1, x:x+width-1, :);

% Step 4: Displaying the subimage
figure;
imshow(subimage);
title('Original Subimage');

% Step 5: Scaling the subimage by a factor of 1.5
scaleFactor = 1.5;
scaledSubimage = imresize(subimage, scaleFactor);
figure;
imshow(scaledSubimage)

% Step 7: Selecting two pixel coordinates and intensities from the original subimage
originalPixel1 = subimage(100, 100, :);
originalPixel2 = subimage(150, 150, :);

% Step 8: Selecting the corresponding scaled pixels
% Coordinates are scaled by the same factor
scaledPixel1 = scaledSubimage(150, 150, :);
scaledPixel2 = scaledSubimage(225, 225, :);  % Scaled coordinates

% Step 9: Print the pixel coordinates and intensities
fprintf('Original Pixel 1 (Coordinate and Intensity):\n');
fprintf('Coordinate (x, y): (%d, %d)\n', 100, 100);
fprintf('Intensity (R, G, B): %d, %d, %d\n', originalPixel1(1), originalPixel1(2), originalPixel1(3));

fprintf('\nOriginal Pixel 2 (Coordinate and Intensity):\n');
fprintf('Coordinate (x, y): (%d, %d)\n', 150, 150);
fprintf('Intensity (R, G, B): %d, %d, %d\n', originalPixel2(1), originalPixel2(2), originalPixel2(3));

fprintf('\nScaled Pixel 1 (Coordinate and Intensity):\n');
fprintf('Coordinate (x, y): (%d, %d)\n', 150, 150);
fprintf('Intensity (R, G, B): %d, %d, %d\n', scaledPixel1(1), scaledPixel1(2), scaledPixel1(3));

fprintf('\nScaled Pixel 2 (Coordinate and Intensity):\n');
fprintf('Coordinate (x, y): (%d, %d)\n', 225, 225);
fprintf('Intensity (R, G, B): %d, %d, %d\n', scaledPixel2(1), scaledPixel2(2), scaledPixel2(3));
