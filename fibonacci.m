function[secuencia,proporcion]=fibonacci(n)

% Con esta funci�n, calcularemos los n primeros n�meros de la secuencia de
% fibonacci.
% La entrada ser� en n�mero de elementos que queremos obtener y la salida
% ser� la secuencia.

% CHEQUEO DE ERRORES
if(nargin<0||n<0||n~=floor(n))
    error('El argumento de entrada no es v�lido')
end

% ALGORITMO
% Como cada elemento es la suma de los dos anteriores y los dos primeros
% son 1 y 1, los pondr� en un vector y definir� el bucle desde 3 en
% adelante, para que no me de un error al intentar accceder a un elemento
% que no existe.
v=[1 1];
if (n==1)
    v=1;
elseif (n==2)
    v=[1 1];
else
    for i=3:n
        v(i)=v(i-1)+v(i-2);
        proporcion=v(i)/v(i-1);
    end
end
secuencia=v;
return;