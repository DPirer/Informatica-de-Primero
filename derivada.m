function[d]=derivada(p,n)

% Esta funci�n nos calcular� la derivada de un polinomio.
% La entrada ser� el vector con los coeficientes y un n�mero n que nos dir�
% que derivada debemos calcular.

% CHEQUEO DE ERRORES
% Si no introducimos n, se tomar� 1 como valor por defecto.
if (nargin==0 || size(p,1)~=1)
    error('El argumento introducido no es v�lido')
elseif (nargin==1)
    n=1;
end

% ALGORITMO
% Crearemos un bucle que se repetir� seg�n las derivadas que debamos hacer
% y un segundo bicle que vaya calculando la derivada para cada caso.
% Siempre deberemos quitar el �ltimo elemento.
for i=1:n
    for j=1:length(p)
        p(j)=p(j)*(length(p)-j);
    end
    p(length(p))=[];
end
d=p;
return;
        