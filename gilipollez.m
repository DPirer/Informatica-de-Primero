a=input('Introduce un n�mero positivo ');

if(a<0)
    contador=contador+1;
    if(contador>3)
       error('Eres gilipollas o que co�o te pasa?')
    end
    error('El argumento introducido no es v�lido');
end
