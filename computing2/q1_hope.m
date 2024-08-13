% Step 1: Read the image
originalImage = imread('astronaut-interference.tif'); % Load your image here

% Create the notch filter in the frequency domain
[x, y] = size(originalImage);
notchFilter = zeros(x, y);

% Step 3: Apply the notch filter in the frequency domain
% Convert the image to double format and perform FFT
imageFFT = fft2(double(originalImage));
filteredImage = imageFFT .* notchFilter;

% Step 4: Inverse transform the filtered image
restoredImage = ifft2(filteredImage);
restoredImage = uint8(real(restoredImage)); % Convert back to uint8 format

% Display the original and restored images
subplot(1, 2, 1);
imshow(originalImage);
title('Original Image');

subplot(1, 2, 2);
imshow(restoredImage, []);
title('Restored Image');
