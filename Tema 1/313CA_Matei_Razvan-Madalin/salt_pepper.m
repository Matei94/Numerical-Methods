function salt_pepper(input_img_path, mask, output_img_path)
	
	IMAGE = imread(input_img_path);
	[lenght, width, depth] = size(IMAGE);
		
	for i = 1:lenght
		for j = 1:width
		
			if (mask(i, j) == 1) 
				neighbours1 = [IMAGE(i-1, j-1, 1), IMAGE(i-1, j, 1),   IMAGE(i-1, j+1, 1), 									IMAGE(i, j-1, 1),   IMAGE(i, j+1, 1),   IMAGE(i+1, j-1, 1), 									IMAGE(i+1, j, 1),   IMAGE(i+1, j+1, 1)];
				
				neighbours2 = [IMAGE(i-1, j-1, 2), IMAGE(i-1, j, 2),   IMAGE(i-1, j+1, 2), 									IMAGE(i, j-1, 2),   IMAGE(i, j+1, 2),   IMAGE(i+1, j-1, 2), 									IMAGE(i+1, j, 2),   IMAGE(i+1, j+1, 2)];
				              
				neighbours3 = [IMAGE(i-1, j-1, 3), IMAGE(i-1, j, 3),   IMAGE(i-1, j+1, 3), 									IMAGE(i, j-1, 3),   IMAGE(i, j+1, 3),   IMAGE(i+1, j-1, 3), 									IMAGE(i+1, j, 3),   IMAGE(i+1, j+1, 3)];
								              
				IMAGE(i, j, 1) = mean(neighbours1);
				IMAGE(i, j, 2) = mean(neighbours2);
				IMAGE(i, j, 3) = mean(neighbours3);
			endif
			
		endfor
	endfor

	imwrite(IMAGE, output_img_path);
	
end
