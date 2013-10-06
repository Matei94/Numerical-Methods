function S = SplineN()
	x = -8:8;
	y = [-5, 1, 0, 5, -1, 3, 2, 5, 3, 4, 2, 0, 1, -1, 1, 3, -5];
	
	% np must be divided in 16 equal intervarls
	% np = multiple of 16
	np = 496;
	n = length(x);
	
	% Get reference values;
	xi = linspace(-8, 8, np);
	yi = interp1(x, y, xi, "spline");

	% h(i) = x(i+1) - x(i);
	% h(i) = 1; i = 1:n
	h = ones(1, n);
	
	% Compute a, b, c, d,
	a = y;
	
	mat = zeros(n+1, n+1);
	mat(1, 1) = 1;
	mat(n+1, n+1) = 1;
	for i = 2:n
		mat(i, i-1) = 1;
		mat(i, i)   = 4;
		mat(i, i+1) = 1;
	endfor
	
	% Spline naturale => c(1) = c(n+1) = 0
	G = zeros(n+1, 1);
	for i = 2:n-1
		G(i) = 3*(a(i+1) - 2*a(i) + a(i-1));
	endfor
	
	c = inv(mat)*G;
	c = c';
	
	for i = 1:n
		d(i) = (c(i+1) - c(i)) / 3;
	endfor
	
	for i = 2:n
		b(i) = a(i) - a(i-1) + (c(i-1) + 2*c(i))/3;
	endfor
	% np/(n-1) = 31
	b(1) = (y(2) -a(1) - d(1)*(xi(31)-x(1))^3) / (xi(31)-x(1));
	
	% Compute S
	j=1;
	for i = 1 : np-1
		if (np/(n-1))*(j-1)+1 <= i && i < (np/(n-1))*j
			j = j;
		else 
			j = j+1;
		endif
		
		S(i) = a(j) + b(j)*(xi(i) - x(j)) + c(j)*(xi(i) - x(j))^2 + d(j)*(xi(i) - x(j))^3;
		
	endfor
	
	% S(xn) = f(xn)
	% S(xi) = f(xi), i = 1:n-1
	S(np) = y(n);
	for i = 1:n-1
		S(31*i) = y(i+1);
	endfor
	
	% Compute error
	% xmax - xmin = 16
	E = sqrt( (16/np) * sum((yi-S).^2) )
	
	% Get comparison graphic
	plot(xi, S, "b", xi, yi, "r");
	
endfunction
