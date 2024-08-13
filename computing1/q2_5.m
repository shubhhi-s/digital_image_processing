% Loading the grayscale image 
grayImage = imread('grayPhoto.jpg');
%The image whose histogram is being matched; courtesy - internet
photo = imread('ice-cream.jpg');
sample = rgb2gray(photo);
% Displaying the original grayscale image
figure;
imshow(grayImage);
title('Original Grayscale Image');

% Performing histogram matching using imhistmatch
matchedImage = imhistmatch(grayImage, sample);

% Displaying the histogram-matched image
figure;
imshow(matchedImage);
title('Histogram-Matched Image');

% Computing the histogram of the histogram-matched image
figure;
imhist(matchedImage);
title('Histogram of Histogram-Matched Image');

% Computing the cumulative histogram of the histogram-matched image
histogramValues = imhist(matchedImage);
cumulativeHistogram = cumsum(histogramValues);
figure;
plot(0:255, cumulativeHistogram);
title('Cumulative Histogram of Histogram-Matched Image');
