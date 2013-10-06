function [l, X] = qrEig(A)
% Algoritmul QR de aflare a vectorilor si valorilor proprii
% Intrari: A - matricea data
% Iesiri:  l - vector valori proprii
%          X - matrice vectori proprii
	
	X = eye(size(A)(1));
	for i = 1:1800
		% A = Q * R
		[Q, R] = gramSchmidtMod(A);
		X = X * Q;
		A = R * Q;
	endfor
	l = diag(A);
	
endfunction
