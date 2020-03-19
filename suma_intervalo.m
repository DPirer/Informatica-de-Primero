function[suma]=suma_intervalo(v)

% Con este programa calcularemos la suma de los elementos de un vector.
% La entrada será el vector y la salida será la suma.

% CHEQUEO DE ERRORES
% La función aceptará números negativos y/o no enteros para a y b, 
% pero no para el resto, y en este caso, a<b.

for (i=2:length(v)-1)
    if(v(i)<0||v(i)~=floor(v(i)))
        error('Error porque lo digo yo')
    end
end

% ALGORITMO
suma=0;
for i=1:length(v)
    if(v(1)<0&&v(length(v))<0&&v(1)>v(length(v)))
        error ('Error porque lo digo yo')
    end
    suma=suma+v(i);
end