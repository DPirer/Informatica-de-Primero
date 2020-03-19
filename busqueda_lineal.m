function[posiciones]=busqueda_lineal(v,numero)

% Esta funci�n nos permitir� encontrar un n�mero mediante el m�todo de
% b�squeda lineal.
% El m�todo consiste en comparar cada elemento del vector con n�mero que
% nosotros introduciremos y devolver� un vector con las posiciones en las
% que se encuentra el n�mero.
% Si no hay n�mero, devolver� un -1.

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