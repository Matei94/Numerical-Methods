function decompress(filename)
	p = 10;
	n = 160;
	
	combined = dlmread(filename);
	[r,c] = size(combined);
	
	firstMatrix = combined(1:p, 1:c);
	coefMatrix = combined(p+1:r, 1:c);
	
	newY = zeros(c*r/2, 1);
	
	for i = 1 : c
		newY(n*(i-1)+1 : n*(i-1)+p) = firstMatrix(:, i);
	
		for j = n*(i-1)+p+1 : n*i
			newY(j) = - (newY(j-1: -1 : j-p)' * coefMatrix(:, i));
		endfor
	endfor
	
%	figure;
%	hold on;
%	axis([0, 320, -0.05, 0.05]);
%	plot([1:320], newY(1:320), "b")
%	plot(linspace(160, 160), linspace(-1.2, 1.2), "r")
%	hold off;
	
	index = strchr(filename, '.');
	filename = filename(1:index-1);
	filename = strcat(filename, "2.wav");
	
	wavwrite(newY, filename)
	
endfunction
