% Read the noisy image
noisy_image = imread('astronaut-interference.tif'); % Replace 'noisy_image.jpg' with the path to your noisy image

% Convert the noisy image to grayscale if it's in color
if size(noisy_image, 3) == 3
    noisy_image = rgb2gray(noisy_image);
end

% Make the image dimensions even
[m, n] = size(noisy_image);
if mod(m, 2) == 1
    noisy_image = noisy_image(1:end-1, :);
    m = m - 1;
end
if mod(n, 2) == 1
    noisy_image = noisy_image(:, 1:end-1);
    n = n - 1;
end

% Perform the Fourier Transform
fft_image = fft2(noisy_image);

% Shift the zero frequency components to the center
fft_image = fftshift(fft_image);

% Compute the magnitude and phase of the Fourier Transform
magnitude_spectrum = abs(fft_image);
phase_spectrum = angle(fft_image);

% Define the location of the noise in the spectrum (45 degrees)
angle_of_noise = 45; % Angle of the line joining the impulses

% Create a binary mask to remove the noise
mask = ones(m, n);
center_x = m / 2;
center_y = n / 2;

for i = 1:m
    for j = 1:n
        angle = atan2(j - center_y, i - center_x) * 180 / pi; % Convert to degrees
        if abs(angle - angle_of_noise) < 5  % Adjust the threshold as needed
            mask(i, j) = 0;
        end
    end
end

% Apply the mask to the magnitude spectrum to remove the noise
filtered_magnitude = magnitude_spectrum .* mask;

% Reconstruct the filtered image
filtered_fft = filtered_magnitude .* exp(1i * phase_spectrum);
filtered_image = ifft2(ifftshift(filtered_fft));
filtered_image = uint8(abs(filtered_image));

% Display the original image and the filtered image
subplot(1, 2, 1);
imshow(noisy_image);
title('Noisy Image');

subplot(1, 2, 2);
imshow(filtered_image);
title('Filtered Image');

% Adjust the display
colormap(gca, 'gray');
