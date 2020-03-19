function[elemento]=fibonacci_rec(n)

% Esta función nos calculará el número n de la secuencia de fibonacci de 
% forma recursiva. A diferencia de la versión iterativa, solo nos dará el 
% número, no el vector, ya que la recursividad no se lleva muy bien con los
% vectores.


if (n<=1)  % CASO BASE
    elemento=n;
else       % CASO GENERAL
    elemento=fibonacci_rec(n-2)+fibonacci_rec(n-1);
end
return;
