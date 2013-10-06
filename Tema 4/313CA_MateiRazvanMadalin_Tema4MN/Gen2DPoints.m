function [x, y] = Gen2DPoints(N, a, b, c, d)
% Usage :  [x, y] = Gen2DPoints(N, a, b, c, d)
% Intrari: N - numarul de puncte
%		   D = [a, b] x [c, d]
% Iesiri:  x - abscisele celor N puncte
%          y - ordonatele celor N puncte
%	Descriere algoritm:
%  Se cauta cel mai mare patrat perfect(np) mai mic
% sau egal cu numarul de puncte. Radacina patrata
% a acestuia reprezinta numarul de subintervale(nr_int) 
% in care se impart cele 2 intervale date ca parametri.
% Astfel, suprafata generata de [a, b] si [c, d] va fi
% impartita in nr_int * nr_int suprafete egale. In fiecare
% dintre aceste suprafete va fi plasat un punct aleator.
% Diferenta de puncte de la N la np va fi plasata aleator
% pe intreaga suprafata.
	
	% Se calculeaza cel mai mare patrat perfect(np) 
	% mai mic sau egal cu N.
	np = N;
	while mod(sqrt(np), 1) ~= 0
		np--;
	endwhile
	
	% Numarul de subintervale echidistante 
	% in care impartim intervalele initiale.
	nr_int = sqrt(np);
	
	% Lungimile subintervalelor.
	length_int1 = (b-a) / nr_int;
	length_int2 = (d-c) / nr_int;
	
	% Uncomment lines commented with %% for graphic
	
%%	figure;
%%	hold on;
%%	axis([a, b, c, d]);
	
	% Se calculeaza coordonatele(x, y) celor np puncte.
	% In fiecare dintre cele nr_int * nr_int suprafete
	% se plaseaza un punct aleator.
	% Formula de generare a unui punct aleator in intervalul
	% [a, b] este: x = a + (b-a)*rand.
	ind = 1;
	for i = 1 : nr_int;
		capatX1 = a + length_int1 * (i-1);
		capatX2 = a + length_int1 * i;
		
		for j = 1 : nr_int;
			capatY1 = c + length_int2 * (j-1);
			capatY2 = c + length_int2 * j;
		
			x(ind) = capatX1 + (capatX2 - capatX1) * rand();
			y(ind) = capatY1 + (capatY2 - capatY1) * rand();
			ind++;

		endfor
	endfor
	
	% Punctele ramase, fiind relativ putine raportate la
	% numarul de puncte existente in grafic, se plaseaza
	% aletor in [a, b] x [c, d].
	if N-np > 0
		ind = 1;
		for i = 1 : N-np;
			x1(ind) = a + (b-a)*rand();
			y1(ind) = c + (d-c)*rand();
			ind++;
		endfor
	
		x = [x, x1];
		y = [y, y1];
	endif
	
%%	plot(x, y, '+');
%%	hold off;
	
endfunction

