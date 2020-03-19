function[v_ord]=mi_merge_sort(v)

% Esta funci�n nos ordenar� un vector de la forma m�s �ptima posible. Sin
% embargo, tiene un problema, y es que no reserva todo el espacio necesario
% en memoria. El m�todo consiste en dividir un vector por la mitad, y cada
% subvector por la mitad y as� sucesivamente hasta llegar a vectores que
% s�lo tienen un elemento. Desp�es compararemos los elementos y crearemos
% el nuevo vector ya ordenado.

if (length(v)==1)  % CASO BASE, ser� cuando lleguemos a un vector de 1 el.
    v_ord=v;
else               % CASO GENERAL
% Primero definimos la longitud de los dos primeros subvectores y les
% asignamos sus elementos.
    v1=zeros(1,floor(length(v)/2));
    v2=zeros(1,ceil(length(v)/2));
    
    for i=1:length(v1)
        v1(i)=v(i);
    end
    for i=1:length(v2)
        v2(i)=v(length(v1)+i);
    end
% Ahora, mediante recursividad, lo volveremos a hacer hasta que lleguemos 
% a tantos vectores como longitud del vector, de un elemento.
    v1=mi_merge_sort(v1);
    v2=mi_merge_sort(v2);
% Ahora procederemos a comparar los elementos. Crearemos un bucle for para
% que vaya poniendo las posiciones del vector ordenado y compararemos los
% elementos de los dos vectores mediante los indices j y k. Si el primer
% elementos del primer vector es menor que primero del segundo vector,
% pondremos ese y avanzaremos uno en el vector 2. Tendremos que tener en
% cuenta primero que no nos hemos salido del vector y si es as�, pondremos
% todos los elementos restantes del otro vector.
    v_ord=zeros(1,length(v));  
    j=1;
    k=1;
    for i=1:length(v_ord)
        if (j>length(v1))
            v_ord(i)=v2(k);
            k=k+1;
        elseif (k>length(v2))
            v_ord(i)=v1(j);
            j=j+1;
        elseif (v1(j)<(v2(k)))
            v_ord(i)=v1(j);
            j=j+1;
        else
            v_ord(i)=v2(k);
            k=k+1;
        end
    end
end
return;
            
       