function myPlot(X)

	n = size(X)(1);
	y = linspace(0, n);
	for i = 1:n;
		x = [0;X(:, i)];
		
		xx = interp1([0:n], x, y, "spline");
		subplot(1, n, i)
		plot(xx, y, "b", linspace(0, 0), linspace(0, n), "r.");
		
	endfor
	
endfunction
