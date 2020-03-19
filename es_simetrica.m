function[b]=es_simetrica(A)

% Con esta funci�n comprobaremos si una matriz es sim�trica.
% El argumento de entrada ser� la matriz y el de salida nos dir� si es o no
% sim�trica.

% CHEQUEO DE ERRORES
% Primero comprobaremos que se haya introducido una matriz. Si no es as�,
% se  crear� una aleatoria de 3x3.
% Despu�s comprobaremos que la matriz sea cuadrada y si no lo es, daremos
% un mensaje de error.
if (nargin==0)
    A=ceil(5*rand(3,3));
elseif (size(A,1)~=size(A,2))
    error('La matriz introducida no es cuadrada')
end

% ALGORITMO
% Comprobaremos que el elemento i,j sea igual al elemento j,i.
% Solo har� falta comparar la parte triangular superior.
% En un principio lo hice con return en medio, pero ya sabemos que no es lo
% m�s adecuado.
b=1;
for i=1:size(A,1)-1
    for j=(i+1):size(A,2)        
        if (A(i,j)~=A(j,i))
            b=0;
        end
    end
end
return;