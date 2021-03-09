function [R1 R2] = PageRank(nume, d, eps)
	% Calculeaza indicii PageRank pentru cele 3 cerinte
	% Scrie fisierul de iesire nume.out 
  out = strcat(nume, ".out");
  
  R_it = Iterative(nume , d, eps);
  R_alg = Algebraic(nume , d);
  
  %deschid fisierul de citire
  file = fopen(nume, 'r');
  %citeste un singur element de tipul %d
  %N = numar de pagini
  N = fscanf(file, '%d', 1);
  fclose(file);
  
  %citesc toate valorile ca sa le extrag doar pe ultimele 2
  file = fopen(nume, 'r');
  valori = fscanf(file, '%f');
  val1 = valori(end - 1);
  val2 = valori(end);
  fclose(file);
  
  R_alg1 = sort(R_alg, 'descend');
  
  file = fopen(out, "w");
  fprintf(file, "%d\n", N);
  fprintf(file, "\n");
  fprintf(file, "%f\n", R_it);
  fprintf(file, "\n");
  fprintf(file, "%f\n", R_alg);
  fprintf(file, "\n");
  
  for i = 1 : N
    fprintf(file, "%d ", i);
    
    for j = 1 : N
      
      if R_alg1(i) == R_alg(j);
        fprintf(file, "%d ", j);
      endif
      
    endfor
    
    u = Apartenenta(R_alg1(i), val1, val2);
    fprintf(file, "%f\n", u);
  endfor
  
  fclose(file);
 
endfunction
