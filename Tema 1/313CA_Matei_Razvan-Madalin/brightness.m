function new_brightness = brightness(input_img_path, x)
    
    IMAGE = imread(input_img_path);
    [lenght, width] = size(IMAGE);
    
    for i = 1:lenght
    	for j = 1:width
    	
    		if (IMAGE(i, j) + x <= 0)
    			IMAGE(i, j) = 0;
    			continue
    		endif
    		
    		if (IMAGE(i, j) + x >= 255)
    			IMAGE(i, j) = 255;
    			continue
    		endif
    		
    		IMAGE(i, j) = IMAGE(i, j) + x;
    		
    	endfor
    endfor
    		
    new_brightness = mean(mean(IMAGE));
    
end
