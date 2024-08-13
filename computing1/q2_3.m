% Loading the grayscale image )
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
title('Adjusted Grayscale Image');

% Computing the histogram of the adjusted image
figure;
imhist(adjustedImage);
title('Histogram of Adjusted Image');

% Computing the cumulative histogram of the adjusted image
histogramValues = imhist(adjustedImage);
cumulativeHistogram = cumsum(histogramValues);
figure;
plot(0:255, cumulativeHistogram);
title('Cumulative Histogram of Adjusted Image');

% Yes, this helped in improving the contrast and my image is being more
% enhanced compared to background. Thus, it reduced the darkness due to
% less intensity of night on the subject and made it more pronounced
% compared to background.