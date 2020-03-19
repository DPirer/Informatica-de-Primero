function[M]=naturales(m,n)

% Con esta función, meteremos dos valores de entrada y obtendremos una
% matriz de orden mxn, cuyos elementos serán los números naturales
% ordenados por filas.

% CHEQUEO DE ERRORES
% Si no hay valores de entrada, la matriz erá de 4x4. Si solo hay un valor
% de entrada, la matriz será mxm. Fuera de estos casos estaremos en elcaso
% general, pero hemos de ponerlo dentro para que no nos modifique el valor
% de la matriz una vez empezado el algoritmo+.
if (nargin==0)
    warning('Faltan argumentos de entrada');
    M=zeros(4);
elseif(nargin==1)
    M=zeros(m);
else
    M=zeros(m,n);
end

% ALGORITMO
% En vez de usar m y n, usaremos los comandos size para que si estamos
% dentro de un caso especial, no intente acceder a una variable que no
% existe. Deberemos sumar j a n*fila en la que estemos.
for i=1:size(M,1)
    for j=1:size(M,2)
        M(i,j)=size(M,2)*(i-1)+j;
    end
end
M;
return,
