function[m]=media(v)

% Con este programa, vamos a calcular la media de un vector.
% El argumento de entrada ser� un vector y el de salida ser� la media.

% CHEQUEO DE ERRORES
% Simplemente comprobaremos que la entrada sea un vector.
if(size(v,1)>1)
    error('El argumento de entrada no es un vector')
end

% ALGORITMO
% El algoritmo funcionar� de forma que acumular� las sumas de los
% elementos.
suma=0;
for i=1:length(v)
    suma=suma+v(i);
end

m=suma/length(v);

return;