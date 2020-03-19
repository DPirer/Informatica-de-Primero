function[v]=sinrepetir_mejor(A,filename)

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
% Crearemos 4 bucles, dos para recorrer la matriz como nos dicen y otros
% dos par a recorrerla correctamente. Iremos comparando cada elemento y
% contando. Si al final resulta que el contador es 1, significa que el
% único elemento igual en la matriz es él mismo, por tanto habrá que
% añadirlo al vector.
fA=size(A,1);
cA=size(A,2);

total=0;
for i=1:fA
    for j=cA:-1:1
        contador=0;   
        for k=1:fA 
            for l=1:cA
                if (A(i,j)==A(k,l))
                    contador=contador+1; 
                end
            end
        end
        if (contador==1)
            total=total+1;
            v(total)=A(i,j);
        end
    end
end

                

% Ya tenemos un vector v con los elementos que no se repiten por orden de
% aparición. Ahora los meteremos en el fichero. Lo abriremos en modo de
% escritura para borrar los datos anteriores y escribiremos el vector.
% Finalmente lo cerrramos.
fid=fopen(filename,'w');
if (fid==-1)
    error('No se ha podido encontrar el fichero especificado.')
end
fprintf(fid,'%d ',v);
fclose(fid);

return;