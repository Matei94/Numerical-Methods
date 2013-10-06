function str = captcha(input_img_path)
    str = "";
    alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    
    % Loading the letters samples
	parrent_dir = "letter_images";
	dirs = ls(parrent_dir);
	sum_per_columns = repmat(-1, 194, 28);
	sum_per_lines = repmat(-1, 194, 26);
	control = zeros(1, 27);
	
	aux = 1;
	for i = 1:length(dirs)
		dirname = dirs(i, :);
		files = ls(strcat(parrent_dir, "/", dirname));
		% Memorizing how many samples per letter exist
		control(i+1) =  control(i) + size(files)(1);
		for j = 1:size(files)(1)
			filepath = strcat(parrent_dir, "/", dirname, "/", files(j, :));
			img = imread(filepath);

			% Building 2 MATRIX of SUM CONTROL
			for k = 1:size(img)(2)
				sum_per_columns(aux, k) = sum(img(:, k));
			endfor 
			for k = 1:size(img)(1)
				sum_per_lines(aux, k) = sum(img(k, :));
			endfor
			
			aux = aux + 1;
		endfor
	endfor
	
	% Loading captcha
	CAPTCHA = imread(input_img_path);
	[lenght, width, depth] = size(CAPTCHA);

	nr_letters = width / 38;
	
	% Finding each letter	
	for i = 1:nr_letters
	
    	BIG_letter = CAPTCHA(:, [38*(i-1)+1 : 38*i], 1);
		[smth, left] = find(BIG_letter != 255, 1, 'first');
		[smth, right] = find(BIG_letter != 255, 1, 'last');

		BIG_letter = BIG_letter';
		[smth, up] = find(BIG_letter != 255, 1, 'first');
		[smth, down] = find(BIG_letter != 255, 1, 'last');
		BIG_letter = BIG_letter';

		SMALL_letter = BIG_letter([up: down], [left:right]);
		SMALL_letter = toPGM(SMALL_letter);

		% For each letter, two vectors of SUM CONTROL are built
		for i1 = 1:size(SMALL_letter)(2)
			COLUMN_sum(i1) = sum(SMALL_letter(:, i1));
		endfor
		for i2 = size(SMALL_letter)(2)+1 : 28
			COLUMN_sum(i2) = -1;
		endfor
		
		for i3 = 1:size(SMALL_letter)(1)
			LINE_sum(i3) = sum(SMALL_letter(i3, :));
		endfor	
		for i4 = size(SMALL_letter)(1)+1 : 26
			LINE_sum(i4) = -1;
		endfor		
		
		% With the SUM CONTROL vectors, the place of the letter in the CONTROL is found
		for j = 1:194
			if ( (COLUMN_sum == sum_per_columns(j, :)) && 
			     (LINE_sum == sum_per_lines(j, :)) )
				break;
			endif
		endfor
		
		%   Now the actual letter is found thanks to control vector who memorized 
		% the number of samples per each letter
		poz = 1;
		while 1>0
			if ( (j > control(poz)) && (j <= control(poz+1)) )
				str(i) = alphabet(poz);
				break
			endif
			poz = poz + 1;
		endwhile
			
	endfor
	
endfunction
