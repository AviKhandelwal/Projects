% Bilateral Filtering

% A. spnoisy.jpg 

clc;
clear all;
close all;

%Reading the input image
im = imread("spnoisy.jpg");
im = rgb2gray(im); % Changing into grey scale
[R C] = size(im); % Rows and columns in image
im = double(im); % To carry out big number calculations on pixel intensities 
                            
vard =25; % Variance of domain component, sigma = 5                         
varr = 40000;  % Variance of range component, sigma = 200                          
norm_factor = 0;
sum = 0;
d = ones(R,C);% array of m*n containing all ones to store the enhanced image
count = 0;

% Starting the iteration at 3,3 pixel since the top left corner of its 5*5
% patch will be at 1,1 so this way we will not be going out of the array,
% similarly ending the iteration at R-2,C-2, so that the bottom right
% corner of the 5*5 patch centred at R-2,C-2 will be at R,C hence we will 
% still be staying inside the array.

for i = 3:R-2
     for j = 3:C-2
        for r = -2:2 % Iterating over 5*5 Neibourhood
            for c = -2:2
                ip = im(i+r,j+c);
                iu = im(i,j);
                df = exp(-1*(r^2 +c^2)/(2*vard)); % Eucledian distance between p and u for domain component
                rf = exp(-1*(ip-iu)^2/(2*varr)); % Squared difference between the intensity values ip and iu for range component
                sum = sum + rf*df*ip; % Summing pixel intensities weighted by domain and range components weights
                norm_factor = norm_factor + rf*df; % Sum of weights of domain and range components
            end
        end
        d(i,j) = sum/norm_factor; % Modified intensity value of im(i,j)
        sum = 0;
        norm_factor = 0;
     end
end

d1 = uint8(d); % type casting to unsigned int8 format
figure(1);
imshow(uint8(im));
title("Original image: spnoisy.jpg ");
figure(2);
imshow(d1);
title("Enhanced image: spnoisy.jpg");

% B. spunifnoisy.jpg 

%Reading the input image
im = imread("spunifnoisy.jpg");
im = rgb2gray(im); % Changing into grey scale
[R C] = size(im); % Rows and columns in image
im = double(im); % To carry out big number calculations on pixel intensities 
                            
vard =100; % Variance of domain component                          
varr = 40000;  % Variance of range component                          
norm_factor = 0;
sum = 0;
d = ones(R,C);% array of m*n containing all ones to store the enhanced image
count = 0;

% Starting the iteration at 3,3 pixel since the top left corner of its 5*5
% patch will be at 1,1 so this way we will not be going out of the array,
% similarly ending the iteration at R-2,C-2, so that the bottom right
% corner of the 5*5 patch centred at R-2,C-2 will be at R,C hence we will 
% still be staying inside the array.

for i = 3:R-2
     for j = 3:C-2
        for r = -2:2 % Iterating over 5*5 Neibourhood
            for c = -2:2
                ip = im(i+r,j+c);
                iu = im(i,j);
                df = exp(-1*(r^2 +c^2)/(2*vard)); % Eucledian distance between p and u for domain component
                rf = exp(-1*(ip-iu)^2/(2*varr)); % Squared difference between the intensity values ip and iu for range component
                sum = sum + rf*df*ip; % Summing pixel intensities weighted by domain and range components weights
                norm_factor = norm_factor + rf*df; % Sum of weights of domain and range components
            end
        end
        d(i,j) = sum/norm_factor; % Modified intensity value of im(i,j)
        sum = 0;
        norm_factor = 0;
     end
end

d1 = uint8(d); % type casting to unsigned int8 format
figure(3);
imshow(uint8(im));
title("Original image: spunifnoisy.jpg ");
figure(4);
imshow(d1);
title("Enhanced image: spunifnoisy.jpg ");

% C. unifnoisy.jpg 

%Reading the input image
im = imread("unifnoisy.jpg");
im = rgb2gray(im); % Changing into grey scale
[R C] = size(im); % Rows and columns in image
im = double(im); % To carry out big number calculations on pixel intensities 
                            
vard =4; % Variance of domain component                          
varr = 400;  % Variance of range component                          
norm_factor = 0;
sum = 0;
d = ones(R,C);% array of m*n containing all ones to store the enhanced image
count = 0;

% Starting the iteration at 3,3 pixel since the top left corner of its 5*5
% patch will be at 1,1 so this way we will not be going out of the array,
% similarly ending the iteration at R-2,C-2, so that the bottom right
% corner of the 5*5 patch centred at R-2,C-2 will be at R,C hence we will 
% still be staying inside the array.

for i = 3:R-2
     for j = 3:C-2
        for r = -2:2 % Iterating over 5*5 Neibourhood
            for c = -2:2
                ip = im(i+r,j+c);
                iu = im(i,j);
                df = exp(-1*(r^2 +c^2)/(2*vard)); % Eucledian distance between p and u for domain component
                rf = exp(-1*(ip-iu)^2/(2*varr)); % Squared difference between the intensity values ip and iu for range component
                sum = sum + rf*df*ip; % Summing pixel intensities weighted by domain and range components weights
                norm_factor = norm_factor + rf*df; % Sum of weights of domain and range components
            end
        end
        d(i,j) = sum/norm_factor; % Modified intensity value of im(i,j)
        sum = 0;
        norm_factor = 0;
     end
end

d1 = uint8(d); % type casting to unsigned int8 format
figure(5);
imshow(uint8(im));
title("Original image: unifnoisy.jpg ");
figure(6);
imshow(d1);
title("Enhanced image: unifnoisy.jpg ");