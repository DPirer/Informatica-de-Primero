function[]=funcion20(n)

% Con esta función podremos calcular cuantos billetes o monedas nos
% deebrían dar de cambio cuando introducimos una cantidad.
% El argumento de entrada será la cantidad que nosotros "pagamos" y la
% salida será el cambio correspondiente.

% CHEQUEO DE ERRORES
% Como no hemos puesto monedas de cenntimos, la entrada deberá ser positiva
% y entera.
if (nargin<1||n<0||n~=floor(n))
    error('El argumento introducido no es válido')
end

% ALGORITMO
% Definiremos un vector con los billetes y conseguiremos un vector con el
% numero de billetes necesarios para el cambio. Finalmente, lo
% traduciremos con fprintf a palabras para mayor comodidad.
v=[500 200 100 50 20 10 5 2 1];
w=[];
for i=1:9 
    if (rem(n,v(i))==0)
        w(i)=n/v(i);
        n=0;
        for j=i+1:9
            w(j)=0;
        end          
    elseif ((n/v(i)>0)&&(n/v(i))<1)
        w(i)=0;               
    elseif (n/v(i)>1)
        w(i)=floor(n/v(i));
        n=n-(floor(n/v(i))*v(i));                
    end  
end

fprintf('\n');

 for i=1:length(w)
     if(w(i)==0)      
     elseif (w(i)==1&&i<8)
        fprintf('%d Billete de %d euros\n',w(i),v(i));
     elseif (w(i)>1&&i<8)
        fprintf('%d Billetes de %d euros\n',w(i),v(i));
     elseif (w(i)==1&&i==8)
        fprintf('%d Moneda de %d euros\n',w(i),v(i));
     elseif (w(i)>1&&i==8)
        fprintf('%d Monedas de %d euros\n',w(i),v(i));
     elseif (w(i)==1&&i==9)
        fprintf('%d Moneda de %d euro\n',w(i),v(i));
     elseif(w(i)>1&&i==9)
       fprintf('%d Monedas de %d euro\n',w(i),v(i));
     end
 end
 
   