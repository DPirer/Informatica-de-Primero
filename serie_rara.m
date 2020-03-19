function[salida]=serie_rara(n)

% En este programa, introduciremos un n�mero y a partir de �l, generaremos
% un vector. 
% Si el �ltimo elemento del vector es par, el siguiente elemento 
% ser� la mitad del anterior.
% Si el �ltimo elemento es impar, el siguiente elemento ser� tres veces el
% anterior m�s uno.

% CHEQUEO DE ERRORES
if(nargin<1||n<0||n~=floor(n)||n==1)
    error('No se ha especificado argumento de entrada o �ste no es v�lido')
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