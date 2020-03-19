% Con este fichero de comandos, comprobaremos si es más eficiente la forma
% iterativa o la recursiva de las funciones de fibonacci.

tic
fibonacci(30);
t_it=toc;
fprintf('El tiempo de la versión iterativa es %f\n',t_it);

tic
fibonacci_rec(30);
t_rec=toc;
fprintf('El tiempo de la versión recursiva es %f\n',t_rec);

% Como podemos observar, el tiempo de la versión recursiva es
% escandalosamente alto en comparación con la versión iterativa.