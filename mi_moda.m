function[m]=mi_moda(v)

% Con este programa podremos calcular la moda de un vector o una matriz, 
% que es el número que se repite más veces.
% El argumento de entrada será el vector y el de salida será la moda.

% ALGORITMO
% CASO GENERAL
max_rep=0;
% Crearemos un bucle for que será para un elemento.
for i=1:size(v,1)*size(v,2)
% Y luego anidaremos otro bucle for que recorrerá el resto de elementos.
        contador=0;
    for j=1:size(v,1)*size(v,2)
% Después compararemos cuántos elementos son iguales y los asignaremos a 
% una variable que sumará uno cada vez que haya dos elementos iguales.
        if (v(i)==v(j))
        contador=contador+1;
        end
    end
% Por último, para cada i veremos si el contador es primero mayor que cero,
% asignándolo a la variable max_rep, y luego si el contador es mayor que la
% variable max_rep e imprimiremos el elemento i en el que estemos.
    if(contador>max_rep)
        max_rep=contador;
        m=v(i);
    end
end
   
  return;