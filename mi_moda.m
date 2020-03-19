function[m]=mi_moda(v)

% Con este programa podremos calcular la moda de un vector o una matriz, 
% que es el n�mero que se repite m�s veces.
% El argumento de entrada ser� el vector y el de salida ser� la moda.

% ALGORITMO
% CASO GENERAL
max_rep=0;
% Crearemos un bucle for que ser� para un elemento.
for i=1:size(v,1)*size(v,2)
% Y luego anidaremos otro bucle for que recorrer� el resto de elementos.
        contador=0;
    for j=1:size(v,1)*size(v,2)
% Despu�s compararemos cu�ntos elementos son iguales y los asignaremos a 
% una variable que sumar� uno cada vez que haya dos elementos iguales.
        if (v(i)==v(j))
        contador=contador+1;
        end
    end
% Por �ltimo, para cada i veremos si el contador es primero mayor que cero,
% asign�ndolo a la variable max_rep, y luego si el contador es mayor que la
% variable max_rep e imprimiremos el elemento i en el que estemos.
    if(contador>max_rep)
        max_rep=contador;
        m=v(i);
    end
end
   
  return;