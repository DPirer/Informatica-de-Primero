function[posiciones]=dicotomica(v,numero)

% Con esta funci�n, veremos la posici�n de un n�mero en un vector ordenado
% mediante el algoritmo de dicot�mica, que consiste en dividir un vector
% con la mitad y ver en parte estar� el n�mero y as� sucesivamente.

% ALGORITMO
% Definiremos es inferior y el superior, que ser�n los l�mites, e i ser� la
% mitad del vector.
% Crearemos un while que se acabar� o bien cuando encontremos el n�memro o
% cuando el l�mite superior sea menor a inferior. Si el n�mero est� dentro 
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
% n�mero y daremos la posici�n y si no, devolveremos un -1.
if(v(i)==numero)
    posiciones=i;
else
    posiciones=-1;
end
return;
