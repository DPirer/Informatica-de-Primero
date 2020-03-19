function [p] = es_primo(n)

% Con este programa podremos calcular si un número es primo o no. 
% Si el bucle no se para, habrá llegado hasta n y el número será primo.
% Si el bucle para, es porque el resto es cero y por tanto el último valor
% del divisor es divisor de n. 

%CHEQUEO DE ERRORES
if(nargin<0||n<0||n~=floor(n))
    error('El argumento de entrada no es válido')
end

% ALGORITMO
% CASOS ESPECÍFICOS
% Por convenio, tanto el 0 como el 1 no se consideran primos.
if (n==0||n==1)
    p=0;
end

% CASO GENERAL
divisor=2;
resto=1;
while (divisor<n && resto>0)
    resto=rem(n,divisor);
      divisor=divisor+1;
end
if(divisor==n)
    p=1;
else
    p=0;
end
return