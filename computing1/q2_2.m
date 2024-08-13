% Loading the night-time grayscale photo 
photo = imread('grayPhoto.jpg');

% Displaying the original image
figure;
imshow(photo);
title('Original Image');

% Defining a range of values for 'a' to experiment with (e.g., from 1.0 to 3.0)
a_values = 1.0 : 1 : 4.0;
b = 1;
% Iterate through different 'a' values and display the brightened images
for a = a_values
    % Brightening the image by multiplying pixel values by 'a'
    brightened_image = a * photo;
    
    % Displaying the brightened image
    figure;
    imshow(uint8(brightened_image));  % Convert back to uint8 for display
    title(b);
    b = b+1;
end
% The original image has best visual appearance.