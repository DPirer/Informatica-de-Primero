% Con este programa vamos a calcular las raíces de un polinomio de 2º
% grado. Con la función input introduciremos los datos de los coeficientes
% y la salida serán las soluciones de la ecuación.

a=input('Introduce el valor de a ');
b=input('Introduce el valor de b ');
c=input('Introduce el valor de c ');

D=b^2-4*a*c;

if (D>0)
    fprintf('x1= %f\n',((-b)-sqrt(D))/(2*a));
    fprintf('x2= %f\n',((-b)+sqrt(D))/(2*a));
elseif (D==0)
    fprintf('x1= %f\n',((-b)+sqrt(D))/(2*a));
    fprintf('x2= %f\n',((-b)+sqrt(D))/(2*a));
else
    re=(-b)/(2*a);
    im=sqrt(-D)/(2*a);
    fprintf('x1= %f + %f*i\n',re,im);
    fprintf('x2= %f - %f*i\n',re,im);
end
return;