function[c]=mas_repetida(filename)

% Esta función nos dirá cual es el elemento que más se repite de un fichero
% que introduzcamos como argumento de entrada, y modificará el fichero
% para que nos diga cual es el elemento que más se repite y cuántas veces.

% CHEQUEO DE ERRORES
% Comprobaremos que hemos introducido un argumento de entrada y si no es
% así, devolveremos un -1. Comprobaremos también que el argumento
% introducido es una cadena de caracteres.
if (nargin==0)
    error('No se ha proporcionado argumentos de entrada');
elseif (ischar(filename)==0)
    error('El argumento introducido no es una cadena de caracteres');
end

% ALGORITMO
% Abriremos el fichero, comprobaremos que se ha abierto correctamente, lo
% leeremos y copiaremos en una variable y lo cerraremos. Ahora procedemos a
% hacer el código, que debe saltarse los elementos que no sean letras. 
% Una vez hecho, abrimos el fichero en modo lectura escritura y escrribimos
% la solución.
fid=fopen(filename,'r');
if (fid==-1)
    c=-1;
    error('No se ha podido abrir el archivo');
end
v=fscanf(fid,'%c',inf);
fclose(fid);

max_rep=1;
for i=1:length(v) 
    contador=0;
    if (v(i)>='a'&&v(i)<='z'||v(i)>='A'&&v(i)<='A')
        for j=1:length(v)
            if (v(j)>='a'&&v(j)<='z'||v(j)>='A'&&v(j)<='A')
                if((v(i)==v(j)))
                    contador=contador+1;        
                    if (contador>=max_rep)
                        max_rep=contador;
                        c=v(i);
                    end                     
                end
            else
            continue;
            end
        end
    else
        continue;
    end
end
fid=fopen(filename,'a');
fprintf(fid,'\n\nEl carater más repetido es %c, que aparece %d veces',c,max_rep );
fclose(fid);

return;
