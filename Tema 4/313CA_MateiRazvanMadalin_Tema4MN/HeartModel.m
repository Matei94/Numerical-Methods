function HeartModel(path)
% Usage: HeartModel(path)
% Intrari : path - calea catre fisierul 
%			       ce contine datele de test

	list = sort(ls(path));
	
	i = 1;
	while i <= size(list)(1)
		M = dlmread(strcat(path, "/", list(i,:)));
		x = M(:, 1);
		y = M(:, 2);
		z = M(:, 3);
		
		I(i) = Trapez(x, y);
		A(i) = MonteCarlo(x, y, 1);
		H(i) = z(1);
		
		i++;
	endwhile
	
	% Compute volume.
	% 	Algorithm: 
	% volumul delimitat de doua suprafete consecutive
	% este egal cu distanta dintre ele inmultita cu 
	% media celor doua suprafete.
	V = zeros(1, 2);
	for i = 1 : size(list)(1)-1
		V(1) = V(1) + (H(i+1)-H(i)) * (I(i+1)+I(i))/2;
		V(2) = V(2) + (H(i+1)-H(i)) * (A(i+1)+A(i))/2;
	endfor
	
	% Print results.
	% I (first line):  ariile calculate cu metoda trapezelor.
	% A (second line): ariile calculate cu metoda Monte Carlo.
	% V (third line):  volumele calculate pe baza celor doua
	%                  seturi de arii.
	printf("%.3f ", I);
	printf("\n");
	printf("%.3f ", A);
	printf("\n");
	printf("%.3f ", V);
	printf("\n");

endfunction
