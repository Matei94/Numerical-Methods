function compress(filename)
	p = 10;
	n = 160;

	[y, Fs, nbits] = wavread(filename);
	
%	figure
%	hold on;
%	axis([0, 320, -0.05, 0.05]);
%	plot([1:320], y(1:320), "b")
%	plot(linspace(160, 160), linspace(-1.2, 1.2), "r")
%	hold off;
	
	firstMatrix = zeros(p, 1);
	coefMatrix = zeros(p, 1);
	
	for i = 1:floor(length(y)/n)
	
		%Calculate val
		val = y(n*(i-1)+1 : n*i);
		first = val(1:p);
	
		% Calculate A
		R = zeros(p, 1);
		for k = 0:p-1
			R(k+1) = val(k+1 : n)' * val(1 : n-k);
		endfor
		A = toeplitz(R);
	
		% Calculate b
		b = zeros(p, 1);
		for i=1:p-1
			b(i) = R(i+1);
		endfor
		b(p) = val(p+1 : n)' * val(1 : n-p);
	
		% Calculate coef
		coef = solve(A, -b);
		
		% Build firstMatrix and coefMatrix
		firstMatrix = [firstMatrix, first];
		coefMatrix = [coefMatrix, coef];
		
	endfor
	
	firstMatrix = firstMatrix(:, 2:size(firstMatrix)(2));
	coefMatrix = coefMatrix(:, 2:size(coefMatrix)(2));
	
	index = strchr(filename, '.');
	filename = filename(1:index);
	filename = strcat(filename, "compressed");
	
	dlmwrite(filename, firstMatrix);
	dlmwrite(filename, coefMatrix, '-append');
	
endfunction
