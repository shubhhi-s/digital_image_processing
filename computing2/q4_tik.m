%Loading the blurred image
blurred_image = imread('Rover_first_movement.jpg');

if size(blurred_image, 3) == 3
    noisy_image = rgb2gray(blurred_image);
end

% Performing the Fourier Transform
fft_image = fft2(noisy_image);

% Shifting the zero frequency components to the center
fft_image = fftshift(fft_image);

% Computing the magnitude and phase of the Fourier Transform
magnitude_spectrum = abs(fft_image);

% Displaying the original image and the magnitude spectra
subplot(1, 3, 1);
imshow(blurred_image);
title('Original Image');

subplot(1, 3, 2);
imshow(log(1 + magnitude_spectrum), []);
title('Magnitude Spectrum');

% J = deconvwnr(I,psf,nsr)
% J = deconvwnr(I,psf,ncorr,icorr)
% J = deconvwnr(I,psf)
% Description

% J = deconvwnr(I,psf,nsr) deconvolves image I using the Wiener filter algorithm, returning deblurred image J. psf is the point-spread function (PSF) with which I was convolved. 
% nsr is the noise-to-signal power ratio of the additive noise. The algorithm is optimal in a sense of least mean square error between the estimated and the true images.

% J = deconvwnr(I,psf,ncorr,icorr) deconvolves image I, where ncorr is the autocorrelation function of the noise and icorr is the autocorrelation function of the original image.

% Defining the PSF to represent the motion (tuned based on putting lots if values to finally get 
% the specific motion)
psf = fspecial('motion', 10, 0); 

% Specify the noise-to-signal ratio (tuned for lots of values, to agree upon this)
noise_var = 0.1;

% Performing Wiener deconvolution for motion deblurring with Tikhonov regularization

alpha = 0.5; % Tuned the regularization parameter
restored_image = deconvwnr(blurred_image, psf, noise_var, alpha);

%Image obtained
subplot(1,3,3);
imshow(restored_image);
title('Restored Image')


