% Read the image
image = imread('astronaut-interference.tif'); % Replace 'your_image.jpg' with the path to your image

% Perform the Fourier Transform
fft_image = fft2(image);

% Shift the zero frequency components to the center
fft_image = fftshift(fft_image);
magnitude_spectrum = abs(fft_image);

% Find the maximum intensity value in the image
maxIntensity = max(magnitude_spectrum(:));

% Find the coordinates (row, column) of pixels with maximum intensity
[maxRows, maxCols] = find(magnitude_spectrum == maxIntensity);

% Display the maximum intensity and its locations
fprintf('Maximum Intensity: %d\n', maxIntensity);
fprintf('Locations of Maximum Intensity:\n');
for i = 1:length(maxRows)
    fprintf('Row: %d, Column: %d\n', maxRows(i), maxCols(i));
end
