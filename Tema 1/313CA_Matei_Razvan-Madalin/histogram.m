function h = histogram(input_img_path)

    h = zeros(1, 256);
    
    IMAGE = imread(input_img_path);
    
    for i=1:256
    	h(i) = length( find(IMAGE == i-1) );
    endfor
    
end
