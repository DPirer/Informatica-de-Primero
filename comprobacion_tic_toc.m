% Con este fichero de comandos, comprobaremos cu�l de los dos algoritmos de
% b�squeda de elementos en un vector es m�s eficiente.

% DICOT�MICA
tic
dicotomica(1000*floor(rand(1,10000)),547);
tiempo_dicotomica=toc;
fprintf('El tiempo de dicotomica es %f\n',tiempo_dicotomica);

% B�SQUEDA LINEAL
tic
busqueda_lineal(1000*floor(rand(1,10000)),547);
tiempo_busqueda_lineal=toc;
fprintf('El tiempo de busqueda lineal es %f\n',tiempo_busqueda_lineal);


% Despu�s de hacer la comprobaci�n en dicot�mica y b�squeda lineal:
% 1- Es casi imposible que me salga el elemento que busco en un vector
% aleatorio de 10000 elementos.
% 2- Es mucho m�s lenta la funci�n b�squea lineal que dicot�mica, del orden
% del doble de tiempo.