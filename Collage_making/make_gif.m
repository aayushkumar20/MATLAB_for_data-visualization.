directory = dir('Directory');
for i = 1 : size(directory,1)
    name = directory(i).name;
    name = strcat('Directory',name);
    img{i} = imread(name);
    img{i} = im2double(img{i});
end
iter = 40;
img1 = img{1};
for i = 1 : size(img,2)
    if i < size(img,2)
        new = img{i+1} - img{i};
    else
        new = img1 - img{i};
    end
    new = new ./ iter;
    for j = 1 : iter
        img{i} = img{i} + new;
        [im,map] = rgb2ind(img{i},256);
        if j == 1 && i == 1
            imwrite(im,map,'Animated1.gif','DelayTime',0.01,'LoopCount',1);
        else
            imwrite(im,map,'Animated1.gif','DelayTime',0.01,'WriteMode','Append');
        end
    end
end
