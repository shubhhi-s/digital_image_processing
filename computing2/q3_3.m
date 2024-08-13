% Step 1: Load the Image (Already in Grayscale)
gray_image = imread('astronaut-interference.tif');

% Step 2: Visualize the Original Image
figure;
imshow(gray_image);
title('Original Grayscale Image');

% Step 3: Apply a Fourier Transform
f_transform = fft2(double(gray_image));
f_transform_shifted = fftshift(f_transform);

% Compute the magnitude spectrum
magnitude_spectrum = log(abs(f_transform_shifted) + 1);

% Display the magnitude spectrum
figure;
imshow(magnitude_spectrum, []);
title('Magnitude Spectrum');

% Step 4: Filter Out the 45-Degree Inclined Lines
% Define the angle of the lines to remove (45 degrees)
angle_to_remove = 45;

% Create a filter to remove the lines at the specified angle
filter_size = size(gray_image);
filter_center = (filter_size + 1) / 2;
[X, Y] = meshgrid(1:filter_size(2), 1:filter_size(1));
filter = exp(1i * pi * angle_to_remove / 180 * ((X - filter_center(2)) + (Y - filter_center(1))));

% Apply the filter to the Fourier Transform
f_transform_filtered = f_transform_shifted .* filter;

% Inverse Fourier Transform to get the filtered image
filtered_image = ifft2(ifftshift(f_transform_filtered));
filtered_image = real(filtered_image);

% Normalize the filtered image to 0-255 range
filtered_image = uint8(255 * mat2gray(filtered_image));

% Display the filtered image
figure;
imshow(filtered_image);
title('Filtered Image with 45-Degree Inclined Lines Removed');

% Step 5: Post-processing (Optional)
% You can perform additional post-processing here if needed.

% Step 6: Save the Result
imwrite(filtered_image, 'filtered_image.jpg');
