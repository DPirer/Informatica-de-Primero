function[v]=numerosprimos(n)

% Esta funci�n nos calcular� los n primeros n�meros primos y los meter� en
% un vector que ser� la salida.
v=1;
if (n==1)
else
    for i=2:n
        contador=0;
        for j=2:i
            if (rem(i,j)==0)
                contador=contador+1;
            end
        end
        if (contador==1)
            v=[v i];
        end
    end
end
return;
            