% Loading the grayscale image
grayImage = imread('grayPhoto.jpg');

% Displaying the original grayscale image
figure;
imshow(grayImage);
title('Original Grayscale Image');

% Applying automatic contrast adjustment using imadjust
adjustedImage = imadjust(grayImage);

% Displaying the adjusted image
figure;
imshow(adjustedImage);
title('Contrast Adjusted Image');

% Performing histogram equalization
equalizedImage = histeq(grayImage);

% Displaying the equalized image
figure;
imshow(equalizedImage);
title('Histogram Equalized Image');

% Computing the histogram of the equalized image
figure;
imhist(equalizedImage);
title('Histogram of Equalized Image');

% Computing the cumulative histogram of the equalized image
histogramValues = imhist(equalizedImage);
cumulativeHistogram = cumsum(histogramValues);
figure;
plot(0:255, cumulativeHistogram);
title('Cumulative Histogram of Equalized Image');

% The histogram is flat quite to an extent.The contrast adjusted image has
% more dark intensity regions but the histogram equalized image has more
% even regions having bright and dark intensity