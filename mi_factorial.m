function [f]=mi_factorial (m)

% Con este programa, podremos calcular el factorial de un número.
% El dato de entrada sera el número y la salida el factorial.

% CHEQUEO DE ERRRORES
% Primero, comprobaremos que el dato de entrada es correcto y en caso
% contrario, mostraremos un mensaje de error.
if (nargin<1||m<0||floor(m)~=m)
    error('El argumento de entrada no es válido')
end

% ALGORITMO
% Tenemos que tener en cuenta un caso específico,el factorial de cero,
% que por convenio es 1.
if (m==0)
    f=1;
end

% Ahora pondremos el caso general. Es muy importante definir la variable
% factorial antes de usarla en el bucle.
f=1;
for i=2:m
    f=f*i;
end
return;
    
