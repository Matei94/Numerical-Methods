function [Q, R] = gramSchmidtMod(A)
% Algoritmul de factorizare QR Gram-Schmidt modificat.
% Intrari: A - matricea de factorizat
% Iesiri:  Q - matrice ortoganala
%		   R - matrice superior triunghiulara

  [m n] = size(A);
  Q = eye(m);
  R = zeros(m, n);
  
  for i = 1:n
    R(i, i) = norm(A(:, i));
    Q(:, i) = A(:, i) / R(i, i);
    for j = i+1:n
      R(i, j) = Q(:, i)' * A(:, j);
      A(:, j) = A(:, j) - Q(:, i) * R(i, j);
    endfor
  endfor
  
endfunction
