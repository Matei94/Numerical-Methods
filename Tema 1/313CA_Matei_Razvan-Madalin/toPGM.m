function matrix = toPGM(matrix)
	[lenght, width] = size(matrix);
	
	for i = 1:lenght
		for j = 1:width
			if (matrix(i, j) != 255)
				matrix(i, j) = 0;
			else
				matrix(i, j) = 1;
			endif
		endfor
	endfor

end
