% Step 1: Load the Blurred Image
blurred_image = imread('car_motion_blur.jpg');

% Step 2: Visualize the Blurred Image
figure;
imshow(blurred_image);
title('Blurred Image');

% Step 3: Create a Motion Blur Kernel (Experiment with Kernel Size)
% You can try different kernel sizes and orientations to see which works best.
kernel_size = 7;  % Adjust the kernel size as needed
kernel_orientation = 10;  % Adjust the orientation angle as needed
motion_blur_kernel = fspecial('motion', kernel_size, kernel_orientation);

% Step 4: Perform Wiener Deconvolution
estimated_kernel_size = size(motion_blur_kernel);
estimated_image = deconvwnr(blurred_image, motion_blur_kernel, 0.8);

% Step 5: Display the Restored Image
figure;
imshow(estimated_image);
title('Restored Image');

% Step 6: Save the Result
imwrite(estimated_image, 'restored_image.jpg');
