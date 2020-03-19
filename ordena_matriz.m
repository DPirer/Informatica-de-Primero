function[B]=ordena_matriz(A)

% Con esta función ordenaremos una matriz de mayor a menor. Primero la
% desliaremnos en un vector, lo ordenaremos mediante la función sort y
% luego volveremos am ontar la matriz.

% CHEQUEO DE ERRORES
if (nargin==0)
    error('No se ha proporcionado argumento de entrada');
end
% ALGORITMO
% Primero crearemos un vector a partir de la matriz. Luego lo ordenaremos y
% como hay que hacerlo de mayor a menor, primero lo multiplicaremos por -1,
% luego lo ordenamos, y nuevamente, lo multiplicamos por -1. Finalmente,
% para montar la matriz, tendremos que dividir los casos para 1=1 y a
% partit de ahi en adelante, en cuyo caso, tendremos que ir multiplicando
% las columnas de la matriz por 1,2,3... y así sucesivamente.
fA=size(A,1);
cA=size(A,2);
v=zeros(1,fA*cA);
for i=1:(size(A,1)*size(A,2))
    v(i)=A(i);
end
v=(-1)*v;
w=sort(v);
w=(-1)*w;
B=zeros(fA,cA);
for i=1:fA
    for j=1:cA
        l=cA*(i-1)+j;
        B(i,j)=w(l);
    end
end        
return;

