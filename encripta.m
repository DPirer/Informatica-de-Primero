function[mnsje]=encripta(mensaje,llave)

% Con esta función introduciremos un mensaje y un número y lo encriptaremos
% de la siguiente forma, cambiaremos únicamente las letras (mayúsculas o 
% minúsculas) por la letra que está tantas posiciones adelante o atrás como
% indique llave.

% CHEQUEO DE ERRORES 
% Comprobaremos que haya argumentos de entrada, que el mensaje sea un
% caracter, que si no se introduce un valor de llave se use 1 por defecto y
% que si la llave no es entera se redondee.
if (nargin==0)
    error('No se ha proporcionado argumetos de entrada')
end
if(ischar(mensaje)==0)
    error('No se ha introducido una cadenad de texto')
end
if(nargin==1)
    llave=1;
end
if(llave~=floor(llave))
    llave=round(llave);
end

% ALGORITMO
% Primero, haremos que si el valor de llave es mayor de 25 o menor que -25
% (número de letras), lo cambie por el valor que le correspondería si fuera
% simple. (Hay que tener en cuenta que llave puede ser + y -).
if (llave>25)
   contador=0;
    while(llave>25)
        llave=llave-25;
        contador=contador+1;
    end
    llave=llave-contador;
elseif(llave<-25)
    llave=abs(llave);
    contador=0;
    while(llave>25)
        llave=llave-25;
        contador=contador+1;
    end
    llave=-llave+contador;
end

% En el algortimo propiamente dicho, cambiaremos cada letra por la que nos
% indique llave. Además, si nos saliéramos del rango de letras, con el if
% lo corregiremos para que de la vuelta al abecedario. Finalmente,
% transformaremos el vector a sus caracteres.
mnsje=double(mensaje);
for i=1:length(mensaje)      
    if(mensaje(i)<'A'||(mensaje(i)>'Z' && mensaje(i)<'a')||mensaje(i)>'z')
        mnsje(i)=mensaje(i);           
   elseif(mensaje(i)+llave<'A')
        mnsje(i)=('A'+('Z'-'A'))+1+llave;        
    elseif(mensaje(i)+llave>'z')
        mnsje(i)=('z'-('z'-'a'))-1+llave;     
    elseif(mensaje(i)>='A' && mensaje(i)<='Z' && mensaje(i)+llave>'Z')
        mnsje(i)=('Z'-('Z'-'A'))-1+llave;     
    elseif(mensaje(i)>='a' && mensaje(i)<='z' && mensaje(i)+llave<'a')
        mnsje(i)=('a'+('z'-'a'))+1+llave;                   
    else
    mnsje(i)=mensaje(i)+llave;
    end
end
mnsje=char(mnsje);
return;
