function[d]=derivada(p,n)

% Esta función nos calculará la derivada de un polinomio.
% La entrada será el vector con los coeficientes y un número n que nos dirá
% que derivada debemos calcular.

% CHEQUEO DE ERRORES
% Si no introducimos n, se tomará 1 como valor por defecto.
if (nargin==0 || size(p,1)~=1)
    error('El argumento introducido no es válido')
elseif (nargin==1)
    n=1;
end

% ALGORITMO
% Crearemos un bucle que se repetirá según las derivadas que debamos hacer
% y un segundo bicle que vaya calculando la derivada para cada caso.
% Siempre deberemos quitar el último elemento.
for i=1:n
    for j=1:length(p)
        p(j)=p(j)*(length(p)-j);
    end
    p(length(p))=[];
end
d=p;
return;
        