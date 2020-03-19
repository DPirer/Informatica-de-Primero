function[posiciones]=busqueda_lineal(v,numero)

% Esta función nos permitirá encontrar un número mediante el método de
% búsqueda lineal.
% El método consiste en comparar cada elemento del vector con número que
% nosotros introduciremos y devolverá un vector con las posiciones en las
% que se encuentra el número.
% Si no hay número, devolverá un -1.

% CHEQUEO DE ERRORES
 if (nargin<2)
     error('No se han proporcionado suficientes argumentos')
 end

 % ALGORITMO
contador=0;
posiciones=[];
for i=1:length(v)
    if(v(i)==numero)
        contador=contador+1;
        posiciones(contador)=i;
    end
    if (contador==0)
        posiciones(1)=-1;
    end
end
return;