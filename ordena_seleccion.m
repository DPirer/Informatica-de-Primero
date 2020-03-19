function[ordenado]=ordena_seleccion(v,orden)

% Esta funci�n ordenar� los elementos de un vector siguiendo el m�todo de
% selecci�n.
% El m�todo consiste en ver cu�l es el elemento m�s peque�o del vector y
% ponerlo en su sitio. Es bastante lento.
% Si el orden es -1 se ordenar� de menor a mayor.
% Si el orden es 1 se ordenar� de mayor a menor.

% CHEQUEO DE ERRORES
if (nargin<2)
    error('No se han proporcionado suficientes argumentos')
end

% ALGORITMO
if (orden==-1)
    for i=1:length(v)-1
        for j=i+1:length(v)
            if(v(j)<v(i))
                aux=v(i);
                v(i)=v(j);
                v(j)=aux;
            end
        end
    end
ordenado=v;
elseif(orden==1)
    for i=1:length(v)-1
        for j=i+1:length(v)
            if(v(j)>v(i))
                aux=v(i);
                v(i)=v(j);
                v(j)=aux;
            end
        end
    end
    ordenado=v;
end
return;
