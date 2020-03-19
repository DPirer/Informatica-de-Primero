function[m]=media(v)

% Con este programa, vamos a calcular la media de un vector.
% El argumento de entrada será un vector y el de salida será la media.

% CHEQUEO DE ERRORES
% Simplemente comprobaremos que la entrada sea un vector.
if(size(v,1)>1)
    error('El argumento de entrada no es un vector')
end

% ALGORITMO
% El algoritmo funcionará de forma que acumulará las sumas de los
% elementos.
suma=0;
for i=1:length(v)
    suma=suma+v(i);
end

m=suma/length(v);

return;