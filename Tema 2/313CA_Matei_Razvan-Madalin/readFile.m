function A = readFile(filename)
% Citire valori din fisierul <filename>
% Intrari: filename - nume fisier
% Iesiri:  A - matricea pentru calculul
%              frecventele de rezonanta

	fid = fopen(filename, 'r');
	
	n = fscanf(fid, "%d", [1, 1]);
	a = fscanf(fid, "%f %f", [2, n]);
	
	A = repmat(0, n, n);
	for i = 1:n
		% Diagonala principala
		if i != n
			A(i, i) = (a(2, i) + a(2, i+1)) / a(1, i) * 1000;
		else
			A(i, i) = a(2, i) / a(1, i) * 1000;
		endif
		
		% Subdiagonala
		if i != 1
			A(i, i-1) = - a(2, i) / a(1, i) * 1000;
		endif
		
		% Supradiagonala
		if i != n
			A(i, i+1) = - a(2, i+1) / a(1, i) * 1000;
		endif
	endfor
	
	fclose(fid);
	
endfunction
