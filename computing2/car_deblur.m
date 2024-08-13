% Load the blurred image
blurredImage = imread('car_motion_blur.jpg');

blurredImage = im2double(blurredImage); % Convert to double

% Define the motion blur kernel
motionBlurLength = 1; % Adjust the length based on the blur characteristics
motionBlurAngle = 5; % Adjust the angle based on the blur direction
motionBlurKernel = fspecial('motion', motionBlurLength, motionBlurAngle);
motionBlurKernel = im2double(motionBlurKernel); % Convert to double

% Perform Wiener deconvolution to correct the motion blur
estimatedKernel = deconvwnr(blurredImage, motionBlurKernel, 0);
restoredImage = deconvwnr(blurredImage, estimatedKernel, 0);

% Display the restored image
imshow(restoredImage);
title('Restored Image');

% Save the restored image
imwrite(restoredImage, 'restored_image.png');

