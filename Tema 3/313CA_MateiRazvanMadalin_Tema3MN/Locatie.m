function Locatie()
	x = -8:8;
	y = [-5, 1, 0, 5, -1, 3, 2, 5, 3, 4, 2, 0, 1, -1, 1, 3, -5];
	
	% np must be divided in 16 equal intervarls
	% np = multiple of 16
	np = 496;
	
	% Get reference values;
	xi = linspace(-8, 8, np);
	yi = interp1(x, y, xi, "linear");
	
	SL = SplineL();
	SN = SplineN();
	ST = SplineT();
	
	figure;
	hold on;
	plot(xi, yi);
	plot(xi, SL);
	plot(xi, SN);
	plot(xi, ST);
	holdoff;
	
endfunction
