function[texto]=invierte_v2(filename)

% Esta función recibirá como entrada un archivo de texto (una variable que 
% puede tener un nombre cualquiera que contendrá la cadena de texto) y
% cambiará la cadena de texto de orden. Además, creará otro archivo que
% cotenga ese texto que tenga también el nombre cambiado.

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
contenido=fscanf(fid,'%c',inf); % fread porque es texto
fclose(fid);
% Cambiamos de orden el contenido.
for i=1:length(contenido)
    texto(i)=contenido(length(contenido)-i+1);
end

% Ahora procederemos a crear otro fichero con el nombre cambiado que
% contenga la misma cadena.
% Primero hemos de ver hasta donde es el nombre del fichero y donde empieza
% la extensión.
j=1;
contador=0;
while(filename(j)~='.')
    contador=contador+1;
    j=j+1;
end
extension=length(filename)-contador;
% Ahora cambiamos el orden del nombre hasta la extensión.
for k=1:contador
    nombre(k)=filename(length(filename)-extension-k+1);
end
% Ahora hemos de añadir la misma extensión que tenia el archivo original.
for l=contador+1:length(filename)
    nombre(l)=filename(l);
end

% Por último, abrimos el archivo en modo de escritura, de forma que cree
% un archivo nuevo, escribimos el texto y lo cerramos.
fid=fopen(nombre,'w');
fwrite(fid,texto);
fclose(fid);
return;











