function[C]=multiplica(A,B)

% Esta función nos permitirá multiplicar matrices.
% La entrada serán las dos matrices y la salida será la matriz C
% resultante.

% CHEQUEO DE ERRORES
% Si no introducimos matrices, daremos un mensaje de error. Si sólo
% introducimos una, B=A, y si las dimensiones no son las adecuadas,
% mostaremos un -1.
if (nargin==0)
    error('No se ha introducido ningún argumento de entrada')
elseif (nargin==1)
    B=A;
end
if (size(A,1)~=size(B,2))
    C=-1;
    return;
end
% ALGORITMO
% Crearemos la matriz C de zeros para reservar el espacio de la memoria.
% Haremos los dos bucles for para recorrer la matriz, y dividiremos la
% multiplicacion en dos, cuando la i valla entre 1 y las filas de A, y de
% ahí en adelante.
% En el primer caso, haremos la multiplicación, la acumularemos, la
% sumaremos y cambiaremos la posición correspondiente en C por su valor.
% En el primer caso, el problema está en que i, que es la posición de las
% filas de A es mayor que las filas de A y crearemos un elemento l para los
% elementos de B, que ya son mayores que j.
% Para conseguir el i y el j correctos, crearemos l, y haremos un while
% para que vaya pasando por aquellos valores que hagan que i sea la
% adecuada al multiplicar l por el tamaño de las filas de A, para i, y B,
% para k. 
% Finalmente, acumularemos y sustituiremos el valor en la posición de C.
C=zeros(size(A,1),size(B,2));
for i=1:size(C,1)*size(C,2)
    max_suma=0;
   for j=1:size(A,2)
       if(i<=size(A,1))
           suma=A(i,j)*B(j);
           max_suma=max_suma+suma;
           suma=0;
           C(i)=max_suma;
       else
           l=0;
           while (l>=0 && l<=size(A,2))
               if (size(A,1)*l<i)
                   l=l+1;
               else
                   l=l-1;
                   i=i-(size(A,1)*l);
                   k=size(B,1)*l+j;
                   suma=A(i,j)*B(k);
                   max_suma=max_suma+suma;
                   suma=0;
                   i=i+(size(A,1)*l);
                   l=-inf;
                   C(i)=max_suma;
               end
           end
       end
   end
end
return;
   