% Step 1: Reading the .jpg image
jpgFileName = 'lantern.jpg';  
image = imread(jpgFileName);

% Step 2: Spliting the image into its color channels
redChannel = image;
greenChannel = image;
blueChannel = image;

% Step 3: Setting all channels except one to zero
redChannel(:, :, 2:3) = 0;  % Sets green and blue channels to zero
greenChannel(:, :, [1, 3]) = 0;  % Sets red and blue channels to zero
blueChannel(:, :, 1:2) = 0;  % Sets red and green channels to zero

% Step 4: Displaying each channel one at a time
%subplot(1, 4, 1);
figure;
imshow(image);
title('Original Image');

%subplot(1, 4, 2);
figure;
imshow(redChannel);
title('Red Channel');

%subplot(1, 4, 3);
figure;
imshow(greenChannel);
title('Green Channel');

%subplot(1, 4, 4);
figure;
imshow(blueChannel);
title('Blue Channel');

%Observations: The image has only the Red/Green/Blue and Black colors. In
%my particular image, the blue component is present in least and therefore
%blue channel image is highly dark and green component is present in most
%amount making green channel image as the brightest.