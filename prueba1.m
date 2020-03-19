function[M]=prueba1(v)

% Este fue el ejercicio que nos pidieron en la primera prueba de Matlab.
% Se trata en construir una matriz a partir de un vector de la siguiente
% forma:
% Cada elemento del vector se situa en la columna correspondiente a su
% posición y en la fila correspondiente a su valor empezando por abajo.

% CHEQUEO DE ERRORES
% Comprobaremos que cada uno de los valores introducidos sea mayor que cero
% y si no es así, mostraremos un mensaje de error. Si el número no es
% entero, lo redondearemos.
for i=1:length(v)
    if (v(i)<0)
        error('El argumento de entrada no es válido')
    elseif(v(i)~=floor(v(i)))
        v(i)=floor(v(i));
    end
end

% ALGORITMO
% Primero necesitamos crear la matriz, para lo que necesitamos un bucle
% para sacar el mayor de los elementos. Cuando lo tenemos, construimos la
% matriz usando rand ya que zeros no está permitido. Una vez construida la
% matriz, asignamos cada elemento a su posición.
mayor=0;
for i=1:length(v)
    if(v(i)>mayor)
        mayor=v(i);
    end
end
M=0*rand(mayor,length(v));

for i=1:length(v)
    M(mayor-v(i)+1,i)=v(i);
end
return;
