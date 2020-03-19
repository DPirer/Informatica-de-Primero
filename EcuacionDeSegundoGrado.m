function [x1,x2]=EcuacionDeSegundoGrado(a,b,c)

% Con este programa podremos calcular las raices de cualquier polinomio de
% 2� grado. Los argumentos de entrada ser�n los coeficientes y los de
% salida ser�n las soluciones de la ecuaci�n.

% CASOS DEGENERADOS
% Primero veremos que pasa si a,b,c son cero. Tendremos que crear
% un algoritmo aparte de forma que finalice el programa si entrara en el
% bucle o pase al caso gen�rico si no llegara a entrar.

if ((a==0)&&(b==0)&&(c==0))
    disp('La ecuaci�n tiene infinitas soluciones')
    x1=[];
    x2=[];
    return;
elseif((a==0)&&(b==0))
    disp('La ecuaci�n no tiene soluci�n')
    x1=[];
    x2=[];
    return;
elseif(a==0)
    x1=-c/b;
    x2=[]; 
    return;
end


% CASO GEN�RICO
% 1�- Definimos el discriminante.
D=(-b)^2-4*a*c;

% 2�- Planteamos el algoritmo para las distintas soluciones.

% - Ra�z simple.
if (D>0)
    x1=((-b)-sqrt(D))/(2*a);
    x2=((-b)+sqrt(D))/(2*a);
    
% - Ra�z doble
elseif (D==0)
    x1=((-b)+sqrt(D))/(2*a);
    x2=x1;
    
% - Ra�z compleja
else
    re=(-b)/(2*a);
    im=sqrt(-D)/(2*a);
    x1=re+im*1i;
    x2=re-im*1i;
end
return;
