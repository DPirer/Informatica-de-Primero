function[v]=primitiva

% Con esta función, calcularemos un boleto válido para la primitiva.
% No habrá entrada, y la salida debe ser un vector de 6 elementos
% distintos, enteros, entre 1 y 49.
% En este caso, no será necesario un chequeo de errores, ya que lo hacemos
% todo en el propio algoritmo.

% ALGORITMO
% Crearemos un vector de 6 elementos entre 1 y 49, y comprobaremos que sean
% distintos.
% En el momento en que tengamos dos elementos iguales, lo cambiaremos y
% pondremos la j=1, de forma que vuelva a comprobar otra vez el vector
% entero. Si ya son distintos, pasará al else y j=j+1. Si finalmente, no
% hay más elementos iguales, pasará al siguiente valor de i y así
% sucesivamente.
v=ceil(49*rand(1,6));
i=2;
while (i<=6)    
    j=1;   
    while (j<i)        
        if(v(i)==v(j))
            while (v(i)==v(j))
                v(i)=ceil(49*rand(1));
            end
            j=1;
        else
            j=j+1;
        end
    end
    i=i+1;
end
v;
return;
