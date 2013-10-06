function x = solve(A, b)
% Rezolvare sistem de ecuatii
% Intrari: A - matrice sistem
%		   b - vector termeni liberi
% Iesiri:  x - vector necunoscute

	% A = Q * R
	[Q, R] = gramSchmidtMod(A);
	
	% A * x = b
	% Q * R  * x = b
	% R * x = Q' * b
	x = supTri(R, Q'*b);
	
endfunction
