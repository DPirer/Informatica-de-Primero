function[exponencial]=mi_exponencial(x,n)

% Con este programa podremos calcular e elevado a cualquier n�mero.
% La entradas ser�n x, que es el n�mero al que elevamos e, y n, que ser� el
% n�mero de iteraciones que haga el bucle y, por tanto, cuanto mayor sea,
% mayor precisi�n tendr� el resultado.

% CHEQUEO DE ERRORES
% B�sicamente, para el factorial.
if(nargin<2||n<0||n~=floor(n))
    error('El argumento de entrada no es v�lido')
end

% ALGORITMO
% La exponencial es igual a 1 + (x^1/1!) + (x^2/2!) y as� sucesivamente.
% Si x es negativo, la exponencial ser� 1/e^x, por tanto, tendremos que
% crear un if para las x positivas y otro para las negativas.
% Las positivas tienen un algoritmo normal.
% Las negativas, no puedes poner x=-x porque entrar� en la primera
% iteraci�n pero no en la segunda, por eso tienes que poner y=-x y definir
% y en el if.
% Igualmente crearemos otros if dentro de esos para dar el resultado correcto.
suma=0;
f=1;
exponencial=0;
if(x<0)
    x=-x;
for i=1:(n-1)
     f=f*i;
     suma=suma+((x^i)/f);
     if(suma>exponencial)
        exponencial=1/(suma+1);
     end
end
elseif(x>0)
    for i=1:(n-1)
     f=f*i;
     suma=suma+((x^i)/f);
     if(suma>exponencial)
        exponencial=suma+1;
     end
    end   
end
     


