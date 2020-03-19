%Con este programa, podremos calcular el tiempo en el que murió un ser vivo
%basándonos en la cantidad de carbono14 que posee. El argumento de
%entrada será la cantidad de carbono14 restante, siendo la cantidad de
%carbono14 inicial siempre el 100%.

Qf=input('Introduzca el pordentaje de C14 restante ');

Tiempo=((log(Qf/100))/(-0.00012097));

disp('La antigüedad de la muestra en años es ');
disp(Tiempo);