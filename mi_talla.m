function[talla]=mi_talla(v)

% Con este programa podremos calcular la talla de un vector, que es el
% m�ximo n�mero de veces que un n�mero esta repetido consecutivamente.
% El argumento de entrada ser� el vector.
% El argumento de salida ser� la talla.

% CHEQUEO DE ERRORES
% Si el argumento de entrada no es v�lido, daremos un mensaje de aviso.
if (nargin<1||size(v,1)>1)
    warning('El argumento de entrada no es v�lido')
    talla=[];
end

% Si hay alg�n elemento negativo, usaremos su valor absoluto.
for i=1:length(v)
    if(v(i)<0)
        v(i)=-v(i);
    end
end


% ALGORITMO
% Lo que haremos ser� comparar cada elemento con el siguiente. Cada vez que
% un elemento se repita, contaremos uno, y cuando deje de repetirse,
% pondremos el contador a cero para que empieze de nuevo. Cada vez que el
% contador supere el valor anterior, lo almacenaremos y al final, �ste ser�
% la talla si sumamos uno, puesto que el �ltimo elemento no se compara.

% Como para comparar el �ltimo elemento con el siguiente tendr�amos que
% acceder a un dato que no existe, limitaremos el if de forma que la i sea
% menor que la longitud del vector, as� nunca acceder� al elemento
% siguiente.
max_rep=0;
contador=0;

for i=1:length(v)-1    
    if((v(i)==v(i+1)))
        contador=contador+1;        
        if (contador>max_rep)
            max_rep=contador;
            talla=max_rep+1;
        end        
    else
        contador=0;        
    end
end
return;