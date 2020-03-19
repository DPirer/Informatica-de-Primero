function[texto]=invierte(filename)

% Esta función recibirá como entrada un archivo de texto (una variable que 
% puede tener un nombre cualquiera que contendrá la cadena de texto) y
% cambiará la cadena de texto de orden.

% CHEQUEO DE ERRORES
% Comprobaremos que hay argumento de entrada y que éste es un caracter.
if(nargin==0)
    error('No hay argumento de entrada')
elseif(ischar(filename)==0)
    error('El argumento introducido no es una cadena de caracteres')
end

% ALGORITMO
% Abrimos es archivo en modo de lectura y comprobamos que fid no es -1, es
% decir, que el archivo se ha abierto correctamente.
fid=fopen(filename,'r');
if(fid==-1)
    error('No se ha podido abrir el archivo')
end
% Leemos su contenido, lo guardamos en una variable y, rápidamente, cerramos
% el fichero.
contenido=fscanf(fid,'%c',inf); %o fread porque es texto
fclose(fid);
% Cambiamos el contenido de orden.
for i=1:length(contenido)
    texto(i)=contenido(length(contenido)-i+1);
end
return;