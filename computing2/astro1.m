% Step 1: Read the image
originalImage = imread('astronaut-interference.tif'); % Load your image here

% Create the notch filter in the frequency domain
[x, y] = size(originalImage);
notchFilter = ones(x, y);


x1 = 388; y1= 476;
for i = 1:x
    for j = 1:y
        % Compute the distance from the center of the image
        distance = sqrt((i - x1)^2 + (j - y1)^2);
        
        % If the distance is less than the radius, set the notch filter value to 0
        if distance < 4
            notchFilter(i, j) = 0;
        end
    end
end

x2 = 438; y2= 526;
for i = 1:x
    for j = 1:y
        % Compute the distance from the center of the image
        distance = sqrt((i - x2)^2 + (j - y2)^2);
        
        % If the distance is less than the radius, set the notch filter value to 0
        if distance < 4
            notchFilter(i, j) = 0;
        end
    end
end
% Step 3: Apply the notch filter in the frequency domain
% Convert the image to double format and perform FFT
fft_image= fft2(double(originalImage));
fft_image = fftshift(fft_image);
filteredImage = fft_image .* notchFilter;

% Step 4: Inverse transform the filtered image
restoredImage = ifft2(ifftshift(filteredImage));
restoredImage = uint8(real(restoredImage)); % Convert back to uint8 format

% Display the original and restored images
subplot(1, 2, 1);
imshow(originalImage);
title('Original Image');

subplot(1, 2, 2);
imshow(restoredImage, []);
title('Restored Image');


