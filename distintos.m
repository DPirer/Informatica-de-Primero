function [nd,vd] = distintos(v)

% Con este programa, podremos ver c�antos n�meros de un vector que
% introducimos son distintos.
% La entrada ser� el vector.
% La salida ser� el n�mero de elementos distintos que hay en el vector.

% [Crearemos un bucle for para que est� fijo en un elemento y anidaremos
% otro para que vaya comparando ese elemento con el resto.] 

% De hecho, no hace falta un segundo bucle, ya que como los elementos 
% siempre son los mismos, siempre va a haber el mismo n�mero de distintos.
% Si hacemos un segundo bucle, el resultado ser� el de la i del �ltimo 
% elemento, lo cual, es inutil pudiendo hacerlo con el primero.

% El problema es que no s�lo los elementos que comparamos deben ser
% distintos, el elemento v(j) en el que estamos tambi�n debe ser distinto a
% todos los elementos v(j) anteriores, por eso hay que definir un vector 
% k que vaya desde 1 hasta el elemento v(j-1). 

% Una vez dentro de ese if, comprobaremos si el elemento v(j) es distinto 
% del v(i). Si es as�, sumaremos uno al contador, si no, pasaremos al 
% siguiente valor de j. 

% Por �ltimo, al contador final (nd), habr� que sumarle 1, por el 
% primer elemento.

% CHEQUEO DE ERRORES
if(nargin<1)
    error('No se ha facilitado argumento de entrada')
end

% ALGORTIMO 
if (size(v,1)>1)
    A=v;
    j=1:size(A,1):(size(A,1)*size(A,2));
    v=[];
    v=[v A(j)];
end

contador=0;
w=[];
for j=2:length(v)
    k=1:(j-1);
    if (v(j)~=v(k))      
        contador=contador+1;
        w(contador)=v(j);
    end
end
nd=contador+1;
vd=[v(1) w];
return;