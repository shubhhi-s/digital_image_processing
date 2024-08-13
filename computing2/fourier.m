% Read the image
image = imread('astronaut-interference.tif'); % Replace 'your_image.jpg' with the path to your image

% Perform the Fourier Transform
fft_image = fft2(image);

% Shift the zero frequency components to the center
fft_image = fftshift(fft_image);

% Compute the magnitude and phase of the Fourier Transform
magnitude_spectrum = abs(fft_image);
%phase_spectrum = angle(fft_image);

% Display the original image and the magnitude/phase spectra
subplot(1, 2, 1);
imshow(image);
title('Original Image');

subplot(1, 2, 2);
imshow(log(1 + magnitude_spectrum), []);
title('Magnitude Spectrum');

% subplot(1, 3, 3);
% imshow((phase_spectrum + pi) / (2 * pi), []);
% title('Phase Spectrum');

% Optional: You can also apply an inverse FFT to obtain the reconstructed image
% reconstructed_image = ifft2(ifftshift(fft_image));
% reconstructed_image = uint8(abs(reconstructed_image));

% Show the images
% subplot(2, 2, 4);
% imshow(reconstructed_image);
% title('Reconstructed Image');



