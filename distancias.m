function[salida]=distancias(tamano,f,c)

% Con esta funci�n, introduciremos un tama�o para una matriz cuadrada, �s�
% como una fila y una columna. Crearemos una matriz cuyos elementos tendr�n
% el valor de la distancia a la que se encuentren de la fila y la columna
% introducidos.

% CHEQUEO DE ERRRORES
% Lo t�pico, y adem�s, tener en cuenta que la fila y la columna no pueden
% ser mayopres que tamano.
if (nargin<3||tamano<0||tamano~=floor(tamano)||f<0||f~=floor(f)||c<0||c~=floor(c)||f>tamano||c>tamano)
    error('El argumento introducido no es v�lido')
end

% ALGORITMO
% Definiremos una matriz de zeros de tama�o tamano y la iremos completando
% con las distancias seg�n la siguiente f�rmula:
% dMx,y=abs(Fx-Fy)+abs(Cx-Xy). 
A=zeros(tamano);

for i=1:size(A,1)
    for j=1:size(A,2)
        A(i,j)=abs(i-f)+abs(c-j);
    end
end
salida=A;
return;