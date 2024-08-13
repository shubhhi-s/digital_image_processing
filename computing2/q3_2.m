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

% Step 4: Remove Vertical Lines Using a Notch Filter
% Define the location and width of the notch filter
notch_center_x = size(gray_image, 2) / 2; % Adjust the X coordinate
notch_width = 1; % Adjust the width as needed

% Create a notch filter
notch_filter = ones(size(gray_image));
notch_filter(:, notch_center_x - notch_width:notch_center_x + notch_width) = 0;

% Apply the notch filter to the Fourier Transform
f_transform_filtered = f_transform_shifted .* notch_filter;

% Inverse Fourier Transform to get the filtered image
filtered_image = ifft2(ifftshift(f_transform_filtered));
filtered_image = real(filtered_image);

% Normalize the filtered image to 0-255 range
filtered_image = uint8(255 * mat2gray(filtered_image));

% Display the filtered image
figure;
imshow(filtered_image);
title('Filtered Image');

% Step 5: Post-processing (Optional)
% You can perform additional post-processing here if needed.

% Step 6: Save the Result
imwrite(filtered_image, 'filtered_image.jpg');
