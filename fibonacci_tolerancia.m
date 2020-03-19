function[secuencia,proporcion1,proporcion2]=fibonacci_tolerancia(t)

% Con esta función,nos pasarán un valor de tolerancia, y calcularemos la
% secuencia hasta que la proporcion aurea del termino n menos el anterior 
% sean menor que dicho valor de tolerancia.
% La entrada será la tolerancia y la salida, la secuencia hasta ese valor,
% así como la proporción.

% CHEQUEO DE ERRORES
if(nargin<0||t<0)
    error('El argumento de entrada no es válido')
end

% ALGORITMO
% Como cada elemento es la suma de los dos anteriores y los dos primeros
% son 1 y 1, los pondré en un vector y definiré el bucle desde 3 en
% adelante, para que no me de un error al intentar accceder a un elemento
% que no existe.
v=[1 1];
i=3;
proporcion=1;
proporcion2=1;
diferencia=1;
while (diferencia>t)
    v(i)=v(i-1)+v(i-2);
    proporcion1=v(i)/v(i-1);
    proporcion2=v(i-1)/v(i-2);
    diferencia=proporcion1-proporcion2;
    diferencia=abs(diferencia);
    i=i+1;
end
secuencia=v;
proporcion1;
proporcion2;
return;