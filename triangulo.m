% Crearemos un fichero de comandos que cree un triángulo de asteriscos.
% El fichero cogerá del espacio de trabajo la variable de entrada que nos
% dirá cuántas filas debe tener nuestro triángulo.

% Se parece mucho al planteamiento de recorrer una matriz, pero lo que
% vamos a hacer ahora es recorrer líneas.
% Crearemos un for que nos dará el número de filas y dentro de ese otros
% dos for, uno para los espacios y otro para los asteriscos. Si no
% pusiéramos el salto de línea, el programa seguiría escribiendo en una
% línea indefinidamente, pero cuando llega ahí, saltamos y cambiamos de i,
% por lo que empezamos una línea nueva. Es este caso, j e i no son índices,
% sino más bien, elementos para contar.

for i=1:n
    for j=1:n-i
        fprintf(' ');
    end
    for k=1:i
        fprintf('*');
    end
    fprintf('\n');
end