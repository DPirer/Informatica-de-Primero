%Con este programa, podremos calcular el tiempo en el que muri� un ser vivo
%bas�ndonos en la cantidad de carbono14 que posee. El argumento de
%entrada ser� la cantidad de carbono14 restante, siendo la cantidad de
%carbono14 inicial siempre el 100%.

Qf=input('Introduzca el pordentaje de C14 restante ');

Tiempo=((log(Qf/100))/(-0.00012097));

disp('La antig�edad de la muestra en a�os es ');
disp(Tiempo);