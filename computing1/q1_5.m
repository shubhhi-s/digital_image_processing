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

% Step 4: Displaying the original subimage
figure;
imshow(subimage);
title('Original Subimage');

% Step 5: Creating a mirror image (flip horizontally)
mirrorImage = fliplr(subimage);

% Step 6: Displaying the mirror image
figure;
imshow(mirrorImage);
title('Mirror Image');
