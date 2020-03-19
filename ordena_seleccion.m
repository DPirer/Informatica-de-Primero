function[ordenado]=ordena_seleccion(v,orden)

% Esta función ordenará los elementos de un vector siguiendo el método de
% selección.
% El método consiste en ver cuál es el elemento más pequeño del vector y
% ponerlo en su sitio. Es bastante lento.
% Si el orden es -1 se ordenará de menor a mayor.
% Si el orden es 1 se ordenará de mayor a menor.

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
