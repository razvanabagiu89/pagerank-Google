function R = Iterative(nume, d, eps)
	% Functia care calculeaza matricea R folosind algoritmul iterativ.
	% Intrari:
	%	-> nume: numele fisierului din care se citeste;
	%	-> d: coeficentul d, adica probabilitatea ca un anumit navigator sa continue navigarea (0.85 in cele mai multe cazuri)
	%	-> eps: eroarea care apare in algoritm.
	% Iesiri:
	%	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina. 
  
  
  %deschid fisierul de citire
  file = fopen(nume, 'r');
  
  %citeste un singur element de tipul %d
  %N = numar de pagini
  N = fscanf(file, '%d', 1);
  
  %A = matrice de adiacenta NxN
  A = zeros(N);
  %K = matrice diagonala N
  K = zeros(N);
  
  %parcurg fiecare linie total N linii
  for i = 1 : N %A(i , ..)
    
    %nu am nevoie de primul element, stiu ca e de la 1 la N prin i
    %deci il sar cu trash
    trash = fscanf(file , '%d', 1);
    %citesc numar vecini
    nr_vecini = fscanf(file, '%d', 1);
    %am de citit nr_vecini vecini
    vecini = fscanf(file, '%d', nr_vecini);
    %fiecare vecin il bag in matricea de adiacenta A
    for j = 1 : nr_vecini
      
      A(i,vecini(j)) = 1;
      
      if i != vecini(j)
        K(i,i)++;
      endif
    endfor
    A(i,i) = 0;
  endfor
   
  %inchid fisierul de citire
  fclose(file);
  
  %aprox initiala
  R = ones(N,1) / N;
  
  %M - fixat
  M = (inv(K) * A)';
  
  while 1
    
   R_old = R;
   R = d * M * R_old + (1-d)/N * ones(N,1);
   
   if norm(R - R_old) < eps
     break;
   endif
   
  endwhile
  
  R = R_old; 
 
 endfunction