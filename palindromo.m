function[salida]=palindromo(v)

% Con esta función, comprobaremos si una palabra es palíndroma o no.
% El argumento de entrada será un vector de caracteres y la salida será la
% respuesta.

% CHEQUEO DE ERRORRES
% Comprobaremos que se haya recibido argumento de entrada y que éste sea
% una cadena de caracteres.
if (nargin==0)
    error('No se ha proporcionado argumento de entrada');
elseif (ischar(v)==0)
    error('El argumento introducido no es una cadena de caracteres');
end

% ALGORITMO
% Partiremos de que la palabra es palíndroma e iremos comprobando elemento 
% a elemento. En el momento que encontremos uno que no lo sea, nos
% saldremos del bucle.
salida='Es palíndroma';
for i=1:length(v)
    j=length(v)-i+1;
    if((v(i)>='a'&&v(i)<='z')||(v(i)>='A'&&v(i)<='Z'))
        if(v(i)~=v(j))
           salida='No es palíndroma';
        end
    else
        error('El argumento introducido no es una palabra');
    end
end
return;