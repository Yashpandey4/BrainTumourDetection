srcFile = dir('C:\Users\Admin\Desktop\Project\Image data\attachments\*.jpg');
for i=1:length(srcFile)
    filename = strcat('C:\Users\Admin\Desktop\Project\Image data\attachments\', srcFile(i).name);
    I = imread(filename);
    figure, imshow(I);
    path = strcat('C:\Users\Admin\Desktop\Project\save\', srcFile(i).name);
    imwrite(I,path);
    [rows,columns,numberOfColorChannels] = size(I);
    if numberOfColorChannels > 1
        gray = rgb2gray(I);
        figure,imshow('gray');
        imwrite(gray,path);
    else
        gray = I;
    end
    %We can later try to implement this prewitt filter without using
    %in-built function.
    % We will also try to implement some higher order filters here.
b = im2double(gray);
%b = imnoise(a1,'salt & pepper',0.2);
[m,n] = size(b);
A = 2;
c = zeros(m,n);
e = zeros(m,n);
f = zeros(m,n);
g = zeros(m,n);
h = zeros(m,n);
k = zeros(m,n);
l = zeros(m,n);
for i = 2:m-1
    for j = 2:n-1
        f(i,j) = b(i,j) - c(i,j);
        g(i,j) = (A - 1)*b(i,j) + f(i,j);
        Gx1 = b(i-1,j-1) - b(i,j);
        Gy1 = b(i-1,j) - b(i,j-1);
        h(i,j) = sqrt(Gx1.^2 + Gy1.^2);
        Gx2 = (b(i+1,j-1) + b(i+1,j) + b(i+1,j+1)) - (b(i-1,j-1) + b(i-1,j) + b(i-1,j+1));
        Gy2 = (b(i-1,j+1) + b(i,j+1) + b(i+1,j+1)) - (b(i-1,j-1) + b(i,j-1) + b(i+1,j-1));
        k(i,j) = sqrt(Gx2.^2 + Gy2.^2);
        Gx3 = (b(i+1,j-1) + 2*b(i+1,j) + b(i+1,j+1)) - (b(i-1,j-1) + 2*b(i-1,j) + b(i-1,j+1));
        Gy3 = (b(i-1,j+1) + 2*b(i,j+1) + b(i+1,j+1)) - (b(i-1,j-1) + 2*b(i,j-1) + b(i+1,j-1));
        l(i,j) = sqrt(Gx3.^2 + Gy3.^2);
    end
end
imshow(b);title('original image');
figure;
imshow(f);title('high pass filtered image in the form of original - smoothed image');
figure;
imshow(h);title('Roberts Derivative Filter Image');
figure;
imshow(k);title('Prewitt Derivative Filter Image');
figure;
imshow(l);title('Sobel Derivative Filter Image');

im3 = medfilt2(h, [3,3]);
figure
imshow(im3);title('Median Filtered Image on Roberts');
figure, imhist(im3);
T2 = graythresh(im3);
it = im2bw(im3,T2);
figure
imshow(it); title("Thresholded");
end
