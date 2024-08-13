% Loading the night-time photo 
photo = imread('night.jpeg');

% Converting the photo to grayscale
grayPhoto = rgb2gray(photo);

% Displaying the grayscale image
figure;
imshow(grayPhoto);
title('Grayscale Image');
imwrite(grayPhoto, 'grayPhoto.jpg');

% Computing and display the histogram
figure;
imhist(grayPhoto);
title('Histogram of Grayscale Image');

% Computing the cumulative histogram
histogramValues = imhist(grayPhoto);
cumulativeHistogram = cumsum(histogramValues);

% Displaying the cumulative histogram
figure;
plot(0:255, cumulativeHistogram);
title('Cumulative Histogram');
