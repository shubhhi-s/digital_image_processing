% Read the input image
inputImage = imread('car_motion_blur.jpg'); % Replace 'your_image.jpg' with the path to your image

% Convert the image to double precision for image processing
inputImage = im2double(inputImage);

% Define the amount of sharpening (adjust to your preference)
sharpeningAmount = 4;

% Create a blurred version of the input image (Gaussian blur)
blurredImage = imgaussfilt(inputImage, 2); % You can adjust the standard deviation (sigma) as needed

% Subtract the blurred image from the original to create the mask
mask = inputImage - blurredImage;

% Add the mask back to the original image with the specified sharpening amount
sharpenedImage = inputImage + sharpeningAmount * mask;

% Clip values to the [0, 1] range
sharpenedImage = max(0, min(1, sharpenedImage));

% Calculate the noise in the image
estimatedNoise = var(inputImage(:) - blurredImage(:));

% Display the original and sharpened images
subplot(1, 2, 1);
imshow(inputImage);
title('Original Image');

subplot(1, 2, 2);
imshow(sharpenedImage);
title('Sharpened Image');

% You can save the sharpened image if needed
imwrite(sharpenedImage, 'sharpened_image.jpg'); % Replace 'sharpened_image.jpg' with the desired output file path
