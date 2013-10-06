function S = SplineT()
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
	% h(i) = 1;
	h = ones(1, n);
	
	% Compute a, b, c, d,
	a = y;
	
	mat = zeros(n+1, n+1);
	mat(1, 1) = 1;
	mat(1, 2) = 1;
	mat(n+1, n)   = 1;
	mat(n+1, n+1) = 1;
	for i = 2:n
		mat(i, i-1) = 1;
		mat(i, i)   = 4;
		mat(i, i+1) = 1;
	endfor
	
	% Compute f'(x0) and f'(xn)
	dx0 = (y(2) - y(1)) / (x(2) - x(1));
	dxn = (y(n) - y(n-1)) / (x(n) - x(n-1));
	
	G = zeros(n+1, 1);
	for i = 2:n-1
		G(i) = 3*(a(i+1) - 2*a(i) + a(i-1));
	endfor
	G(1) = 3*(a(2) - a(1) - dx0);
	G(n) = 3*(dxn - a(n) - a(n-1));
	
	c = inv(mat)*G;
	c = c';
	
	for i = 1:n
		d(i) = (c(i+1) - c(i)) / 3;
	endfor
	
	% Spline tensionate => b(1) = f'(x1)
	for i = 2:n
		b(i) = a(i) - a(i-1) + (c(i-1) + 2*c(i))/3;
	endfor
	b(1) = a(2)-a(1) - (2*c(1) + c(2))/3;
	
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
		% np/(n-1) = 31
		S(31*i) = y(i+1);
	endfor
	
	% Compute error
	% xmax - xmin = 16
	E = sqrt( (16/np) * sum((yi-S).^2) );
	
	% Get comparison graphic
	plot(xi, S, "b", xi, yi, "r");
	
endfunction	
	
