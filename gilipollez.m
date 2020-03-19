a=input('Introduce un número positivo ');

if(a<0)
    contador=contador+1;
    if(contador>3)
       error('Eres gilipollas o que coño te pasa?')
    end
    error('El argumento introducido no es válido');
end
