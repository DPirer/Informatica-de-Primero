function[S]=valles(M)

% Esta función nos calculará los valles de una matriz, es decir, los
% elementos que están rodeados por elementos que son mayores.
% El argumento de entrada será la matriz.
% El argumento de salida será una matriz con las posiciones de los valles.

% CHEQUEO DE ERRORES
% Comprobaremos que hay argumento de entrada y que la matriz contiene 
% elementos entre 1 y 9
fM=size(M,1);
cM=size(M,2);
for i=1:fM*cM
    if (nargin==0 || M(i)<1 || M(i)>9)
        error('El argumento de entrada no es válido');
    end
end

% ALGORITMO
% Crearemos 4 bucles, 2 que recorran la matriz interior para que no haya
% problemas con los límites, y otros dos que recorran la matriz de 3x3 de
% cada elemento. Compararemos cada elemento y si resulta que los 8
% elementos son mayores, es decir, que contador es 8, entonces, ese
% elemento es un valle.
total=0;
for i=2:fM-1
    for j=2:cM-1
        contador=0;
        for k=i-1:i+1
            for l=j-1:j+1
                if (M(i,j)<M(k,l))
                    contador=contador+1;
                end
                if (contador==8)
                    total=total+1;
                    S(total,1)=i;
                    S(total,2)=j;
                end
            end
        end
    end
end
if (total==0)
    S=[];
end
return;
