function R = Algebraic(nume, d)
	% Functia care calculeaza vectorul PageRank folosind varianta algebrica de calcul.
	% Intrari: 
	%	-> nume: numele fisierului in care se scrie;
	%	-> d: probabilitatea ca un anumit utilizator sa continue navigarea la o pagina urmatoare.
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
 
  %inversa lui M
  K_1 = PR_Inv(K);
  M = (K_1 * A)';
  
  %inversa lui B
  B = eye(N) - d * M;
  B_1 = PR_Inv(B);
  
  %calcul R
  R = zeros(N);
  R = B_1 * ((1-d)/N) * ones(N,1);

  
 endfunction