% Crearemos un fichero de comandos que cree un tri�ngulo de asteriscos.
% El fichero coger� del espacio de trabajo la variable de entrada que nos
% dir� cu�ntas filas debe tener nuestro tri�ngulo.

% Se parece mucho al planteamiento de recorrer una matriz, pero lo que
% vamos a hacer ahora es recorrer l�neas.
% Crearemos un for que nos dar� el n�mero de filas y dentro de ese otros
% dos for, uno para los espacios y otro para los asteriscos. Si no
% pusi�ramos el salto de l�nea, el programa seguir�a escribiendo en una
% l�nea indefinidamente, pero cuando llega ah�, saltamos y cambiamos de i,
% por lo que empezamos una l�nea nueva. Es este caso, j e i no son �ndices,
% sino m�s bien, elementos para contar.

for i=1:n
    for j=1:n-i
        fprintf(' ');
    end
    for k=1:i
        fprintf('*');
    end
    fprintf('\n');
end