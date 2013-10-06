function S = SplineL()
	x = -8:8;
	y = [-5, 1, 0, 5, -1, 3, 2, 5, 3, 4, 2, 0, 1, -1, 1, 3, -5];
	
	% np must be divided in 16 equal intervarls
	% np = multiple of 16
	np = 496;
	
	% Get reference values;
	xi = linspace(-8, 8, np);
	yi = interp1(x, y, xi, "linear");
	
	% pi(xi) = ai*xi + bi
	% Compute a and b
	n = length(x);
	a = zeros(1, n-1);
	b = zeros(1, n-1);
	
	for i = 1 : n-1
		a(i) = (y(i+1) - y(i)) / (x(i+1) - x(i));
		b(i) = (x(i+1)*y(i) - x(i)*y(i+1)) / (x(i+1) - x(i));
	endfor
	
	% Compute S
	j=1;
	for i = 1 : np-1
		if (np/(n-1))*(j-1)+1 <= i && i < (np/(n-1))*j
			j = j;
		else 
			j = j+1;
		endif
		
		S(i) = a(j) * xi(i) + b(j);
	endfor
	
	% Hermite conditions
	% S(xn) = f(xn)
	% S(xi) = f(xi), i = 1:n-1
	% S'(xn) = f'(xn)
	% S'(xi) = f'(xi), i = 1:n-1
	S(np) = y(n);
	for i = 1:n-1
		S(31*i) = y(i+1);
	endfor
	
	% Compute error
	% xmax - xmin = 16;
	E = sqrt( (16/np) * sum((yi-S).^2) )
	
	% Get comparison graphic
	figure;
	plot(xi, S, "b", xi, yi, "r");
	
endfunction
