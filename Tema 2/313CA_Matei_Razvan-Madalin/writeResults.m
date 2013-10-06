function writeResults(l, X, fileName)
% Scriere rezultate in fisierul _fileName_
% Intrari: l - frecvente in Hertz
%		   X - vectori propii normati
%          fileName - nume fisier de scris

	fid = fopen(fileName, 'w');
	
	fprintf(fid, "%d\n", length(l))
	for i = 1:length(l)
		fprintf(fid, "%f\n", l(i))
		for j = 1:length(l)
			fprintf(fid, "%f ", X(j, i))
		endfor
		fprintf(fid, "\n")
	endfor
	
	fclose(fid);
	
endfunction
