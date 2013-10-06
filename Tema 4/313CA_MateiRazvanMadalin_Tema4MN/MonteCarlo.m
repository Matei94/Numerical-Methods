function A = MonteCarlo(x, y, tol)
% Usage:   A = MonteCarlo(x, y, tol)
% Intrari: x - abscisele varfurilor
%		   y - ordonatele varfurilor
%	       tol - toleranta
% Iesiri:  A - aria suprafetei inchise
	
	a = min(x);
	b = max(x);
	c = min(y);
	d = max(y);
	
	% Aria suprafetei ce incadreaza curba inchisa.
	AD = (b-a) * (d-c);
	
	prev = -Inf;
	N = 512;
	while 1 > 0
	
		% Generate N uniformly distributed points.
		[xp, yp] = Gen2DPoints(N, a, b, c, d);

		% Inpolygon test.
		% Check for algortihm in README.
		crossings = zeros(1, N);
		
		for i = 1 : length(y)-1
			if y(i) < y(i+1)
				in1 = y(i) <= yp;
				in2 = yp <= y(i+1);
			else
				in1 = y(i+1) <= yp;
				in2 = yp <= y(i);
			endif
			
			if x(i) < x(i+1)
				in3 = xp <= x(i);
			else 
				in3 = xp <= x(i+1);
			endif
			
			in = in1 & in2 & in3;
			crossings += in;
		endfor
		
		crossings = mod(crossings, 2);
		Nint = sum(crossings);
		
		% Compute area.
		A = AD * Nint / N;
		
		% Break test: |A(2N) - A(N)| <= tol
		if abs(A - prev) <= tol
			break;
		else 
			prev = A;
			N = 2 * N;
		endif
		
	endwhile
	
endfunction

