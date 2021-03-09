function [Q, R] = gram_sc(A)
  
  % linii si coloane ale matricei A
  [m n] = size(A);
  
  % dimensiunile predefinite pentru Q si R
  Q = zeros(m,n);
  R = zeros(n,n);
  
  for j = 1 : n
    % vectorul coloana pentru A
    v = A(:, j);
    
    for i = 1 : (j-1)
      R(i, j) = Q(:, i)' * A(:,j);
      v = v - R(i, j) * Q(:, i);
    endfor
    
    R(j, j) = norm(v);
    Q(:, j) = v/R(j,j);
  endfor
  
endfunction
