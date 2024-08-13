% Assuming you have already computed the FFT of the image in fftImage
% Read the image
image = imread('astronaut-interference.tif'); % Replace 'your_image.jpg' with the path to your image

% Perform the Fourier Transform
fft_image = fft2(image);

% Shift the zero frequency components to the center
fft_image = fftshift(fft_image);

% Step 1: Compute magnitude of FFT
magnitudeFFT = log(abs(fft_image));

% Step 2: Apply a threshold
threshold = 0.8 * max(magnitudeFFT(:)); % Adjust the threshold value
peaks = magnitudeFFT > threshold;

% Step 3: Find the coordinates of bright locations
[row, col] = find(peaks);

% Display the coordinates of the brightness peaks
fprintf('Locations of Brightness Peaks:\n');
for i = 1:length(row)
    fprintf('Row: %d, Column: %d\n', row(i), col(i));
end

