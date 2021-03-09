function y = Apartenenta(x, val1, val2)
	% Functia care primeste ca parametrii x, val1, val2 si care calculeaza valoarea functiei membru in punctul x.
	% Stim ca 0 <= x <= 1 
  
  a = 1/(val2 - val1);
  b = -val1 * a;
  y = a * x + b;

  if y < 0
    y = 0;
  endif
  
  
endfunction