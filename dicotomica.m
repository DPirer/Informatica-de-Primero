function[posiciones]=dicotomica(v,numero)

% Con esta función, veremos la posición de un número en un vector ordenado
% mediante el algoritmo de dicotómica, que consiste en dividir un vector
% con la mitad y ver en parte estará el número y así sucesivamente.

% ALGORITMO
% Definiremos es inferior y el superior, que serán los límites, e i será la
% mitad del vector.
% Crearemos un while que se acabará o bien cuando encontremos el númemro o
% cuando el límite superior sea menor a inferior. Si el número está dentro 
% de una de las divisiones, restaremos o sumaremos al superior o inferior 
% i-+1, para que ahora el vector vaya hasta el elemento anterior o 
% posterior. Volveremos a repetir el proceso.
inferior=1;
superior=length(v);
i=floor((inferior+superior)/2);
while ((v(i)~=numero)&&(inferior<=superior))
   if(numero<v(i))
       superior=i-1;
   else
       inferior=i+1;
   end
   i=floor((inferior+superior)/2);
end
% Si nos hemos salido del bucle, comprobaremos si hemos encontrado el
% número y daremos la posición y si no, devolveremos un -1.
if(v(i)==numero)
    posiciones=i;
else
    posiciones=-1;
end
return;
