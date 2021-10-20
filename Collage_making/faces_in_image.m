image = imread('name.jpg');
faceD = vision.CascadeObjectDetector('MergeThreshold',8);
bbox = step(faceD, image);
for i = 1 : size(bbox,1);
    crop{i} = imcrop(image, bbox(i,:));
end 
image = rgb2gray(image);
image = cat(3,image,image,image);
for i = 1 : size(crop,2)
    image(bbox(i,2):bbox(i,2)+bbox(i,4),bbox(i,1):bbox(i,1)+bbox(i,3),:) = crop{i};
end
