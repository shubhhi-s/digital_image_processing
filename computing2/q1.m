%Getting the image and splitting it into different colour channels
image = imread('low-contrast-photography-1.jpg');

% Split the image into color channels
r = image(:,:,1);
g = image(:,:,2);
b = image(:,:,3);

%HISTOGRAM EQUALISATION
% Apply histogram equalization to each channel
equ_r = histeq(r);
equ_g = histeq(g);
equ_b = histeq(b);

% Merge the equalized channels to create the equalized image
equalized_img = cat(3, equ_r, equ_g, equ_b);

% Display the equalized image
figure;
imshow(equalized_img);
title('Histogram Equalised');

%CONTRAST STRETCHING
% Define the new minimum and maximum values
new_min = 0;
new_max = 255;

% Create a figure to display the stretched images
stretched_channels = cell(1, 3);

for i = 1:3
    channel = image(:,:,i);
    
    % Calculate the current minimum and maximum values in the channel
    current_min = min(channel(:));
    current_max = max(channel(:));
    
    % Perform contrast stretching
    stretched_channel = imadjust(channel, [current_min/255, current_max/255], [new_min/255, new_max/255]);
    
    % Store the stretched channel
    stretched_channels{i} = stretched_channel;
end

% Merge the stretched channels to create the stretched image
stretched_image = cat(3, stretched_channels{:});

% Display the merged stretched image
figure;
imshow(stretched_image);
title('Contrast Stretching');

%GAMMA CORRECTION
% Define the gamma value for gamma correction
gamma_value = 2.5; % Adjust this value for your desired gamma correction

% Apply gamma correction to each color channel
corrected_channels = cell(1, 3);
