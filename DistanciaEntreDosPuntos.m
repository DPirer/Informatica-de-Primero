%Con este programa, podremos calcular la distancia entre dos puntos, cada
%uno definido por tres coordenadas. Primero introduciremos mediante input
%los valores de los vectores y luego haremos las operaciones pertinentes.

x1=input('Introduce la primera coordenada de P1 ');
y1=input('Introduce la segunda coordenada de P1 ');
z1=input('Introduce la tercera coordenada de P1 ');
x2=input('Introduce la primera coordenada de P2 ');
y2=input('Introduce la segunda coordenada de P2 ');
z2=input('Introduce la tercera coordenada de P2 ');

Distancia=sqrt((x1-x2)^2+(y1-y2)^2+(z1-z2)^2);

disp('La distancia entre los dos puntos es ');
disp(Distancia);
