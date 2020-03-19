function [S]=simetria_v(A)

% Con esta función, introduciremos una matriz y la cambiaremos dando una
% matriz cuyos elementos han sido cambiados con respecto al eje vertical.
% La entrada será la matriz y la salida será la matriz pero con la simetría
% respecto a la vertical.

% CHEQUEO DE ERRORES
if (nargin==0)
    error('No se ha proporcionado argumento de entrada')
elseif (size(A,2)==1)
    S=-1;
    return;
end

% ALGORITMO
% Recorreremos la matriz y crearemos un vector que vaya al contrario de j y
% asignaremos cada elemento a la matriz C.
C=zeros(size(A,1),size(A,2));
for i=1:size(A,1)
    for j=1:size(A,2)
        k=size(A,2)+1-j;
        while (k>=1)
            C(i,k)=A(i,j);
            k=0;
        end
    end
end
S=C;
return;