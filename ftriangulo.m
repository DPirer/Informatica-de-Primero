function[salida]=ftriangulo(n)

% Con esta función crearemos un triángulo de asteriscos de tamaño n.

% CHEQUEO DE ERRORES
% Comprobaremos que haya entrada y que sea un número entero y positivo.
if(nargin==0||n<0||n~=floor(n))
    error('No se ha proporcionado argumento de entrada o éste no es válido');
end

% ALGORITMO
% Crearemos un bucle para las filas y los otros dos serán, uno para los
% espacios y el otro para los asteriscos. El segundo bucle for nunca puede
% depender del primero, debe depender de i.
salida=ones(n);
for i=1:n
    for j=1:n-i
        salida(i,j)=' ';
    end
    for k=n-i+1:n
        salida(i,k)='*';
    end
end
salida=char(salida);
return;