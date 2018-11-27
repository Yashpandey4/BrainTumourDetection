srcFile = dir('D:\Downloads\ELL 205 Brain Tumour\Project\Image data\attachments\*.jpg');
for i=1:length(srcFile)
    filename = strcat('D:\Downloads\ELL 205 Brain Tumour\Project\Image data\attachments\', srcFile(i).name);
    path = strcat('D:\Downloads\ELL 205 Brain Tumour\Project\save\', srcFile(i).name);
    I = imread(filename);
    figure, imshow(I);
    [rows,columns,numberOfColorChannels] = size(I);
    if numberOfColorChannels > 1
        gray = rgb2gray(I);
        
        figure,imshow(gray);
        imwrite(gray,path);
    else
        gray = I;
    end
    
   
    figure
    im2 = imnoise(gray,'salt & pepper', 0.05);
    subplot(1,2,1),imshow(im2);
    title('Noisy image');
    imwrite(im2,path);
    
    im3 = medfilt2(im2, [3,3]);
    subplot(1,2,2), imshow(im3);
    title('Median filtered image');
    imwrite(im3,path);
    figure
    adjusted_image = imadjust(im3);
    subplot(1,3,1), imshow(adjusted_image); title('Using imadjust');
    imwrite(adjusted_image,path);
    adjusted_image2 = histeq(im3);
    subplot(1,3,2), imshow(adjusted_image2); title('Using histeq');
    imwrite(adjusted_image2,path);
    adjusted_image3 = adapthisteq(im3);
    subplot(1,3,3), imshow(adjusted_image3); title('Using adapthisteq');
    imwrite(adjusted_image3,path);
    figure
    im4 = im2double(adjusted_image);
    h = edge(im4, 'Roberts');
    k = edge(im4, 'Prewitt');
    l = edge(im4, 'sobel');
    j = edge(im4,'Canny');
    subplot(3,4,1),imshow(h);title('Imadjust-Roberts Derivative Filter Image'); 
    imwrite(h,path);
    subplot(3,4,2),imshow(k);title('Imadjust-Prewitt Derivative Filter Image');
    imwrite(k,path);
    subplot(3,4,3),imshow(l);title('Imadjust-Sobel Derivative Filter Image');
    imwrite(l,path);
    subplot(3,4,4),imshow(j);title('Imadjust-Cannny Derivative Filter Image');
    imwrite(j,path);
    im5 = im2double(adjusted_image2);
    h = edge(im5, 'Roberts');
    k = edge(im5, 'Prewitt');
    l = edge(im5, 'sobel');
    j = edge(im5, 'canny');
    subplot(3,4,5),imshow(h);title('histeq-Roberts Derivative Filter Image');
    imwrite(h,path);
    subplot(3,4,6),imshow(k);title('histeq-Prewitt Derivative Filter Image');
    imwrite(k,path);
    subplot(3,4,7),imshow(l);title('histeq-Sobel Derivative Filter Image');
    imwrite(l,path);
    subplot(3,4,8),imshow(j);title('histeq-Canny Derivative Filter Image');
    imwrite(j,path);
    im6 = im2double(adjusted_image3);
    h = edge(im6, 'Roberts');
    k = edge(im6, 'Prewitt');
    l = edge(im6, 'sobel');
    j = edge(im6, 'canny');
    subplot(3,4,9),imshow(h);title('adapthisteq-Roberts Derivative Filter Image');
    imwrite(h,path);
    subplot(3,4,10),imshow(k);title('adapthisteq-Prewitt Derivative Filter Image');
    imwrite(k,path);
    subplot(3,4,11),imshow(l);title('adapthisteq-Sobel Derivative Filter Image');
    imwrite(l,path);
    subplot(3,4,12),imshow(j);title('histeq-Canny Derivative Filter Image');
    imwrite(j,path);
    
    figure
    subplot(1,2,1), imshow(gray);
    threshold=200;
    [m,n]=size(gray);
    Ithres = zeros(m,n);
    for i=1:m
        for j=1:n
            if(gray(i,j)>threshold)
                Ithres(i,j)=1;
            else
                Ithes(i,j)=0;
            end
        end
    end
   subplot(1,2,2), imshow(Ithres);
   imwrite(Ithres,path);
   
   figure, imhist(gray);
   imwrite(imhist(gray),path);
   p=size(gray);

    %%% using in built MATLAB function %%%

    s=strel('square',7);
    
    d2=imerode(Ithres,s);
    d1=imdilate(d2,s);
    %%% Writing program
    w=[1 1 1;1 1 1;1 1 1];
    for x=2:1:p(1)-1
        for y=2:1:p(2)-1
             a1=[w(1)*gray(x-1,y-1) w(2)*gray(x-1,y) w(3)*gray(x-1,y+1) w(4)*gray(x,y-1) w(5)*gray(x,y) w(6)*gray(x,y+1) w(7)*gray(x+1,y-1) w(8)*gray(x+1,y) w(9)*gray(x+1,y+1)];
             A1(x,y)=max(a1); %Dilation%
             A2(x,y)=min(a1); % Erosion%
        end
    end
    figure(1)
    subplot(3,2,1)
    imshow(gray)
    title('input image');
    subplot(3,2,2)
    imshow(d1)
    imwrite(d1,path);
    title('Dilation with inbuilt function');
    subplot(3,2,3)
    imshow(d2)
    imwrite(d2,path);
    title('Erosion with inbuilt function');
    subplot(3,2,4)
    imshow(A1)
    imwrite(A1,path);
    title('Dilation ');
    subplot(3,2,5)
    imshow(A2)
    imwrite(A2,path);
    title('Erosion ');
    
end