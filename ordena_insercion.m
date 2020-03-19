function[ordenado]=ordena_insercion(v,orden)

% Esta funci�n nos permitir� ordenar un vector por el m�todo de inserci�n.
% El m�todo consiste en comparar cada elemento con los anteriores y
% desplazar los elementos que sean mayores a la derecha y poner el lemento
% en su sitio.

% CHEQUEO DE ERRORES
if (nargin<2)
    error('No se han proporcionado suficientes argumentos')
end

% ALGORITMO
if(orden==-1)
for i=2:length(v)
    aux=v(i);
    j=i-1;
    while (j>=1 && aux<v(j))
        v(j+1)=v(j);       
        j=j-1;
    end
    v(j+1)=aux;
end
ordenado=v;
elseif(orden==1)
    for i=2:length(v)
    aux=v(i);
    j=i-1;
    while (j>=1 && aux>v(j))
        v(j+1)=v(j);       
        j=j-1;
    end
    v(j+1)=aux;
    end
end
ordenado=v;
return;



