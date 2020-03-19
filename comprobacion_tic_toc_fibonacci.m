% Con este fichero de comandos, comprobaremos si es m�s eficiente la forma
% iterativa o la recursiva de las funciones de fibonacci.

tic
fibonacci(30);
t_it=toc;
fprintf('El tiempo de la versi�n iterativa es %f\n',t_it);

tic
fibonacci_rec(30);
t_rec=toc;
fprintf('El tiempo de la versi�n recursiva es %f\n',t_rec);

% Como podemos observar, el tiempo de la versi�n recursiva es
% escandalosamente alto en comparaci�n con la versi�n iterativa.