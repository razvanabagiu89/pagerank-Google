# PageRank/Algorithms in a Search Engine


# Cerinta 1: Algoritmul Iterative

Pentru aceasta cerinta prima data am parsat datele de intrare din fisier,
prima data citind N resurse web si vecinii fiecarei resurse, ca apoi sa
asociez vecinii in matricea de adiacenta A si sa construiesc matricea K,
exceptand paginile web care au link inspre ele(diagonala lui A de 0, iar pe K
ignor acele pagini). Apoi, folosind pseudocodul am format matricea M,
aproximarea initiala a lui R si am iterat pana la eroare reconstruind R-ul
la fiecare iteratie.

# Cerinta 2: Algoritmul Algebraic

Am folosit aceeasi citire din fisier ca la Cerinta 1 , dar pentru inversele
matricelor am folosit algoritmul Gramm-Schmidt descris in functia 'gram_sc' si
in 'PR_Inv'. Odata formate inversele, am aplicat pseudocodul algebric pentru a
calcula R-ul.

# Cerinta 3: Gradul de Apartenenta

In functia 'Apartenenta' am rezolvat sistemul impus de continuitatea functiei
'u(x)' si am pus conditiile necesare, apoi am returnat valoarea functiei in
punctul respectiv. Pentru functia 'PageRank' am citit din fisierele de intrare
'val1' si 'val2', iar apoi am apelat functiile anterioare pentru a calcula
vectorul R pentru fiecare metoda. Am concatenat la numele fisierului + "out",
pentru a scrie rezultatele. La sortarea vectorului R format de metoda Algebric
am folosit functia built-in denumita 'sort', iar cu 2 for-uri am parcurs
vectorul nesortat cat si cel sortat pentru a afisa indicii nodurilor cu
PR-ul respectiv. La final, cu ajutorul functiei 'Apartenenta' descrisa mai sus,
am afisat valoarea fiecarui PR.