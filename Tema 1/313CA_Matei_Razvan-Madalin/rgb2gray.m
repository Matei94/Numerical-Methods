function rgb2gray(input_img_path, output_img_path)
	
	% Defining COLOR, the matrix containing the RGB values of the color image.
	COLOR = imread(input_img_path);
	[lenght, width, depth] = size(COLOR);
	
	for i = 1:lenght
		for j = 1:width
			COLOR(i, j, 1) = 0.2989*COLOR(i, j, 1) + 0.5870*COLOR(i, j, 2) + 0.1140*COLOR(i, j, 3);
		endfor
	endfor
	
	imwrite(COLOR(:, :, 1), output_img_path);
	
endfunction
