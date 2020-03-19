function[v]=desliador(A)

% Con esta función podremos desliar una matriz en vector con sus elementos.
% El argumento de entrada será una matriz cualquiera.
% El argumento de salida será un vector cuyos elementos serán los de la
% matriz.

% CHEQUEO DE ERRORES
if (nargin<1)
    error('No se ha especificado argumento de entrada')
end

% ALGORITMO
% Definiremos primero un vector vacío y lo modificaremos con los elementos
% de las posiciones de la matriz.
v=zeros(1,size(A,1)*size(A,2));
for i=1:(size(A,1)*size(A,2))
    v(i)=A(i);
end

% Este algoritmo nos deslia una matriz elemento a elemento. Para que lo
% haga por filas, sólo es necesario trasponer la matriz de entrada.