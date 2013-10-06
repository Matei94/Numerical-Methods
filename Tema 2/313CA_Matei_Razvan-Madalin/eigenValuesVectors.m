function [l, X] = eigenValuesVectors(A)
% Aflare vectori si valori proprii
% Intrari: A - matricea formata in _readFile_
% Iesiri:  l - vector valori proprii
%          X - matrice vectori proprii normati

	[X, l] = eig(A);
	l = diag(l);
	
	% Exprimare frecvente in Hertz
	l = l.^(1/2)/(2*pi);
	
	% Normalizare vectori
	for i = 1:size(X)(1)
		X(:, i) = X(:, i) / X(size(A)(1), i);
	endfor
	
endfunction
