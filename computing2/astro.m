% Step 1: Read the image
originalImage = imread('astronaut-interference.tif'); % Load your image here



% Create the notch filter in the frequency domain
[x, y] = size(originalImage);
notchFilter = ones(x, y);
y2 = 414; x2= 501;
for i = 1:x
    for j = 1:y
        % Compute the distance from the center of the image
        distance = sqrt((i - x2)^2 + (j - y2)^2);
        
        % If the distance is less than the radius, set the notch filter value to 0
        if distance < 600
            notchFilter(i, j) = 0;
        end
    end
end
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

% Optional: Save the restored image
imwrite(restoredImage, 'restored_image.jpg');
