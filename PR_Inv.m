function B = PR_Inv(A)
	% Functia care calculeaza inversa matricii A folosind factorizari Gram-Schmidt
  
	% algoritmul de inversare s-a facut prin transformarea matricii A
  % intr-o factorizare de tip QR ce reduce foarte mult costul de inversare
  % astfel, inversa lui Q este Q' iar pt inversa lui R am folosit inv()
  %(cost mic) deoarece e matrice diagonala
  % Gram-Schmidt se afla in fisierul gram_sc.m
  
  [Q R] = gram_sc(A);
  B = eye(size(A))/R * Q';
  
endfunction
