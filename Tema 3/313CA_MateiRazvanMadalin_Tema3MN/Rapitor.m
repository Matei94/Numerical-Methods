function Rapitor()

	figure;
	hold on;
	
	% f1
	ezplot('(x/7).^2 * sqrt( abs(abs(x) - 3) / (abs(x) - 3) ) + (y/3).^2 * sqrt( abs( y + 3*sqrt(33)/7 ) / (y + 3*sqrt(33)/7) ) - 1;', [-8, 8, -3*sqrt(33)/7, 6 - 4*sqrt(33)/7]);
	
	% f2
	ezplot('abs(x/2) - ((3*sqrt(33)-7)/112) * x.^2 - 3 + sqrt(1-(abs( abs(x)-2 ) - 1).^2) - y', [-4, 4]);
	
	% f3
	ezplot('9*sqrt( abs( (abs(x)-1) .* (abs(x)-0.75)) / ( (1-abs(x)) .* (abs(x)-0.75)) ) - 8 * abs(x) - y',[-1, -0.75, -5, 5]);
	ezplot('9*sqrt( abs( (abs(x)-1) .* (abs(x)-0.75)) / ( (1-abs(x)) .* (abs(x)-0.75)) ) - 8 * abs(x) - y',[0.75, 1,   -5, 5]);
	
	% f4
	ezplot('3*abs(x) + 0.75*sqrt( abs( (abs(x)-0.75) .* (abs(x)-0.5) ) / ( (0.75-abs(x)) .* (abs(x)-0.5) ) ) - y', [-0.75, 0.75, 2.25, 5]);
	
	%f5
	ezplot('2.25 * sqrt( abs( (x - 0.5) .* (x+0.5) ) /  ( (0.5 - x) .* (0.5 + x) ) ) - y', [-0.5, 0.5, -5, 5]);
	
	%f6
	ezplot('6*sqrt(10)/7 + (1.5 - 0.5*abs(x)) .* sqrt( abs( abs(x) - 1 ) / (abs(x)-1) ) - 6*sqrt(10)/14 * sqrt(4 - (abs(x)-1).^2 ) - y', [-3, -1, -5, 5]);
	ezplot('6*sqrt(10)/7 + (1.5 - 0.5*abs(x)) .* sqrt( abs( abs(x) - 1 ) / (abs(x)-1) ) - 6*sqrt(10)/14 * sqrt(4 - (abs(x)-1).^2 ) - y', [1,   3, -5, 5]);
	
	hold off
	
endfunction
