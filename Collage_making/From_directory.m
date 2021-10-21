imagesdirectory = dir('your directory name');
for i = 1:size(imagesdirectory, 1)
    name = imagesdirectory(i).name;
    name = strcat('your directory', name);
    img{i} = imread(name);
    img{i} = imresize (img{i}, [200 200]);
end
image = image {1};
for i = 2: floor(size(img, 2) / 2)
    image = [image, img{i}];
end
image2 = img(floor(size (img, 2) / 2) + 1);
for i = floor((size(img, 2) / 2) + 2) : size(img, 2)
    imgage2 = [image2, img{i}];
end
try
    Collage = [image; image2];
catch
    difference = size (image, 2) - size (image2, 2);
    if difference < 0
        blank = unit8(zeros(size(image, 1), abs(difference), 3));
        image = [image, new];
        collage = [image; image2]
    else
        blank = unit8(zeros(size(image, 1), abs(difference), 3));
        image2 = [image2, new];
        collage = [image; image2];
    end
end
