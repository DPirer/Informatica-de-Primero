function[v]=sinrepetir(A,filename)

% Con esta función, calcularemos los elementos que no se repiten dentro de
% una matriz. 
% Los argumentos de entrada serán la matriz y un fichero.
% La salida será un vector con los elementos que no se repiten en el orden 
% de aparición (de derecha a izquierda y de arriba a abajo), y escribiremos
% en un fichero dichos elementos.

% CHEQUEO DE ERRORES
% Si no hay argumentos de entrada, generaremos una matriz aleatoria y 
% asignaremos el fichero.
% Si sólo hay una argumento, asignaremos el fichero.
% Comprobaremos que el nombre del fichero sea una cadena de caracteres.
% Podríamos comprobar que la matriz tiene más de una fila, pero un vector,
% al fin y al cabo, es una matriz.
if (nargin==0)
    A=floor(10*rand(3))-5;
    filename='sinrepetir.txt';
elseif (nargin==1)
    filename='sinrepetir.txt';
end

if (ischar(filename)==0)
    error('El argumento introducido no es una cadena de caracteres.')
end


% ALGORITMO
% Primero, desliaremos la matriz por filas pero de derecha a izquierda,
% para trabajar más fácilmente con un vector.
fA=size(A,1);
cA=size(A,2);
i=1;
while (i<=fA*cA)
    for j=1:fA
        for k=cA:-1:1
            c(i)=A(j,k);
            i=i+1;
        end
    end
end
                
% Ya tenemos la matriz desliada en el vector c, ahora comprobaremos que
% elementos no se repiten.
% Haremos dos bucles para ir comparando elemento a elemento.
% Cuando i y j sean iguales, significa que estamos en el mismo elemento así
% que lo saltaremos.
% En el momento en el que encontremos un elemento igual, debemos cambiar de
% i.
% Para el último elemento, si éste es único, se saldría del if final para 
% meterlo en el vector, así que deberemos comprobar que estemos en el
% último elemento y que sea diferente a todos los demás, si no, pasaríamos
% al continue pero no se metería en el if porque es igual a sí mismo.
contador=0;
for i=1:length(c)
    k=1:i-1; 
    for j=1:length(c)
        if (i==length(c))
            if( c(i)~=c(k))
                contador=contador+1;
                v(contador)=c(i);
                break;
            end
        elseif (i==j)
            continue;
        elseif (c(i)==c(j))
            break;
        end
    end
    if (j==length(c)&&c(i)~=c(j))
        contador=contador+1;
        v(contador)=c(i);
    end
end

% Ya tenemos un vector v con los elementos que no se repiten por orden de
% aparición. Ahora los meteremos en el fichero. Lo abriremos en modo de
% lectura para borrar los datos anteriores y escribiremos el vector.
% Finalmente lo cerrramos.
fid=fopen(filename,'w');
if (fid==-1)
    error('No se ha podido encontrar el fichero especificado.')
end
fprintf(fid,'%d ',v);
fclose(fid);

return;
