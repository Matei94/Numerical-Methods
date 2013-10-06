function I = Trapez(x, y)
% Usage:   I = Trapez(x, y)
% Intrari: x - abscisele varfurilor
%		   y - ordonatele varfurilor
% Iesiri:  I - aria suprafetei inchise;
% 	Descriere algoritm:
%  In vederea calcularii ariei unei suprafete
% inchise se foloseste metoda trapezelor.
% Aceasta metoda presupune adunari si scaderi
% succesive de arii de trapeze. Fiecare doua
% puncte consecutive impreuna cu proiectiile
% lor pe Ox reprezinta varfurile unui trapez.
% Se aduna la aria finala aria trapezului daca 
% x isi pastreaza monotonia si se scade daca 
% si-o schimba. Aria finala, fiind pozitiva, 
% este modulul ariei obtinute.
	
	I = 0;
	for i = 1 : length(x)-1
		h = x(i+1) - x(i);
		I = I + h/2 * (y(i) + y(i+1));
	endfor
	
	I = abs(I);
	
endfunction	
	
	
