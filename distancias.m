function[salida]=distancias(tamano,f,c)

% Con esta función, introduciremos un tamaño para una matriz cuadrada, ásí
% como una fila y una columna. Crearemos una matriz cuyos elementos tendrán
% el valor de la distancia a la que se encuentren de la fila y la columna
% introducidos.

% CHEQUEO DE ERRRORES
% Lo típico, y además, tener en cuenta que la fila y la columna no pueden
% ser mayopres que tamano.
if (nargin<3||tamano<0||tamano~=floor(tamano)||f<0||f~=floor(f)||c<0||c~=floor(c)||f>tamano||c>tamano)
    error('El argumento introducido no es válido')
end

% ALGORITMO
% Definiremos una matriz de zeros de tamaño tamano y la iremos completando
% con las distancias según la siguiente fórmula:
% dMx,y=abs(Fx-Fy)+abs(Cx-Xy). 
A=zeros(tamano);

for i=1:size(A,1)
    for j=1:size(A,2)
        A(i,j)=abs(i-f)+abs(c-j);
    end
end
salida=A;
return;