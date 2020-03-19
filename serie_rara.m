function[salida]=serie_rara(n)

% En este programa, introduciremos un número y a partir de él, generaremos
% un vector. 
% Si el último elemento del vector es par, el siguiente elemento 
% será la mitad del anterior.
% Si el último elemento es impar, el siguiente elemento será tres veces el
% anterior más uno.

% CHEQUEO DE ERRORES
if(nargin<1||n<0||n~=floor(n)||n==1)
    error('No se ha especificado argumento de entrada o éste no es válido')
end

% ALGORITMO
a=rand(1,n);
b=floor(a*10);

if(rem(b(n),2)==0)
    b(n+1)=b(n)/2;
    salida=[b];
else
    b(n+1)=b(n)*3+1;
    salida=[b];
end
return;