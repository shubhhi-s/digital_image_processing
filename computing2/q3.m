% Step 1: Load the Image
gray_image = imread('astronaut-interference.tif');

% Step 2: Visualize the Original Image
figure;
imshow(gray_image);
title('Original Image');

% Step 4: Apply a Fourier Transform
f_transform = fft2(double(gray_image));
f_transform_shifted = fftshift(f_transform);

% Compute the magnitude spectrum
magnitude_spectrum = log(abs(f_transform_shifted) + 1);

% Display the magnitude spectrum
figure;
imshow(magnitude_spectrum, []);
title('Magnitude Spectrum');

% Step 5: Filter the Interference Patterns
% Define the dimensions of the image and filter
[rows, cols] = size(gray_image);
crow = rows / 2;
ccol = cols / 2;
D = 30;  % Adjust this parameter to control the filter's strength

% Create a mask to filter out interference frequencies
mask = zeros(rows, cols);
mask(crow - D:crow + D, ccol - D:ccol + D) = 1;

% Apply the mask to the Fourier Transform
f_transform_filtered = f_transform_shifted .* mask;

% Inverse Fourier Transform to get the filtered image
filtered_image = ifft2(ifftshift(f_transform_filtered));
filtered_image = real(filtered_image);

% Normalize the filtered image to 0-255 range
filtered_image = uint8(255 * mat2gray(filtered_image));

% Display the filtered image
figure;
imshow(filtered_image);
title('Filtered Image');

% Step 6: Post-processing (Optional)
% You can perform additional post-processing here if needed.

% Step 7: Save the Result
imwrite(filtered_image, 'filtered_image.jpg');
