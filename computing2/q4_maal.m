% Load the blurred image (replace 'blurred_image.jpg' with your image file)
blurred_image = imread('car_motion_blur.jpg');

% Define the PSF to represent the motion (adjust based on the specific motion)
psf = fspecial('motion', 30, 0); % Example PSF for motion blur

% Specify the noise-to-signal ratio (you may need to adjust this)
noise_var = 0.01;

% Perform Wiener deconvolution for motion deblurring
restored_image = deconvwnr(blurred_image, psf, noise_var);

% Display the restored image
subplot(1,2,1);
imshow(blurred_image);
title('Original Image');

subplot(1,2,2);
imshow(restored_image);
title('Restored Image')

