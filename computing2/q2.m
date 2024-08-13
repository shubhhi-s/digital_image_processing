% Read the input image
inputImage = imread('man_with_dots.jpg'); % Replace 'your_image.jpg' with the path to your image


% Convert the color image to grayscale
grayImage = rgb2gray(inputImage);

% Define the size of the median filter window (odd-sized window)
filterSize = 7; % Adjust the size as needed

% Apply median filtering
outputImage = medfilt2(grayImage, [filterSize, filterSize]);

% Display the original color and filtered grayscale images
subplot(1, 3, 1);
imshow(inputImage);
title('Original Color Image');

subplot(1, 3, 2);
imshow(outputImage);
title('Median Filtered Grayscale Image');

% You can save the filtered grayscale image if needed
%imwrite(outputImage, 'filtered_image.jpg'); % Replace 'filtered_image.jpg' with the desired output file path


% Convert the image to double precision for image processing
inputImage = im2double(outputImage);

% % Define the Laplacian sharpening kernel
% sharpeningKernel = [0, -1, 0; -1, 5, -1; 0, -1, 0];
% 
% % Apply the sharpening filter to the image
% sharpenedImage = imfilter(inputImage, sharpeningKernel);
% 
% % Scale the sharpened image to the [0, 1] range
% sharpenedImage = (sharpenedImage - min(sharpenedImage(:))) / (max(sharpenedImage(:)) - min(sharpenedImage(:)));
% 
% % Display the original and sharpened images

% Define the amount of sharpening (adjust to your preference)
sharpeningAmount = 1.5;

% Create a blurred version of the input image (Gaussian blur)
blurredImage = imgaussfilt(inputImage, 2); % You can adjust the standard deviation (sigma) as needed

% Subtract the blurred image from the original to create the mask
mask = inputImage - blurredImage;

% Add the mask back to the original image with the specified sharpening amount
sharpenedImage = inputImage + sharpeningAmount * mask;

% Clip values to the [0, 1] range
sharpenedImage = max(0, min(1, sharpenedImage));


subplot(1, 3, 3);
imshow(sharpenedImage);
title('Sharpened Image');

% You can save the sharpened image if needed
%imwrite(sharpenedImage, 'sharpened_image.jpg'); % Replace 'sharpened_image.jpg' with the desired output file path
