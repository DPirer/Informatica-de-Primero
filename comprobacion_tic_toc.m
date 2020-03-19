% Con este fichero de comandos, comprobaremos cuál de los dos algoritmos de
% búsqueda de elementos en un vector es más eficiente.

% DICOTÓMICA
tic
dicotomica(1000*floor(rand(1,10000)),547);
tiempo_dicotomica=toc;
fprintf('El tiempo de dicotomica es %f\n',tiempo_dicotomica);

% BÚSQUEDA LINEAL
tic
busqueda_lineal(1000*floor(rand(1,10000)),547);
tiempo_busqueda_lineal=toc;
fprintf('El tiempo de busqueda lineal es %f\n',tiempo_busqueda_lineal);


% Después de hacer la comprobación en dicotómica y búsqueda lineal:
% 1- Es casi imposible que me salga el elemento que busco en un vector
% aleatorio de 10000 elementos.
% 2- Es mucho más lenta la función búsquea lineal que dicotómica, del orden
% del doble de tiempo.