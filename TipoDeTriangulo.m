function [x1]=TipoDeTriangulo (a,b,c)

% Con este programa veremos el tipo de triángulo que se forma según la
% longitud de sus lados, siendo éstos los valores de entrada.

%La condición para que se forme un triángulo es que la suma de dos de sus
%lados debe ser mayor que el tercer lado.

if ((a+b)<c) || ((a+c)<b) || ((b+c)<a)
    x1=0;
end

if (a==b) & (b==c)
    x1=1; 
end

if (a==b) & (b~=c)
    x1=2;
end

if (a~=b) & (a~=c) & (b~=c)
    x1=3;
end
return;