function[f]=factorial_rec(n)

% Esta funci�n nos calcular� el factorial de un n�mero de forma recursiva.
% El caso base ser� cuando lleguemos a 0, ya que su factorial es 1.

if (n==0)  % CASO BASE
    f=1;
else       % CASO GENERAL
    f=n*factorial_rec(n-1);
end
return;