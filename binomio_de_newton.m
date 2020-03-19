function [salida] = binomio_de_newton(n,m)

% Con este programa podremos calcular el binomio de newton de n sobre m.
% Como necesitaremos calcular factoriales, para no tener que repetir un
% c�digo que ya hemos creado, haremos una llamada a ese c�digo,
% simplificando as� el algoritmo.

% CHEQUEO DE ERRORES
% Los n�meros deben ser enteros positivos y n debe ser mayor que m.
if (nargin<2||n<0||m<0||n<m||n~=floor(n)||m~=floor(m))
    error('El argumento de entrada no es v�lido')
end

% ALGORITMO
% CASOS ESPEC�FICOS
% Hay que contar, con que, por convenio, el factorial de 0 es 1, pero como
% en la funci�n de factorial ya esta definido el caso, no hace falta volver
% a ponerlo.

% CASO GENERAL
% Lo haremos haciendo una llamada a la funcion que me calcula el factorial.
salida=mi_factorial(n)/(mi_factorial(m)*mi_factorial(n-m));
