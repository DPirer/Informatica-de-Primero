function[valor]=integraldefinida(a,b,n)

% Esta función nos calculará la integral de una función mediante el método
% de los trapecios. La función se encuentra en la función examen. Cambiando
% ahí la función, podremos calcular con ésta su valor.

% CHEQUEO DE ERRORES
% Lo primero, calcularemos es paso de integración, h.
% Comprobaremos que b>a y que si los límites de integración son iguales, la
% integral es cero.
h=(b-a)/n;
if (a==b)
    valor=0;
    return;
elseif (b<a || rem(b-a,h)~=0)
    valor=inf;
    return;
end

% ALGORTIMO
% Crearemos un bucle que vaya desde a hasta b con incremento h y para cada
% trapecio, calcularemos si altura por la parte izquierda (h1) y por la 
% parte derecha (h2) y usaremos la fórmula S=(h/2)*(h1+h2).
suma=0;
for i=a:h:b-h
    izquierda=examen(i);
    derecha=examen(i+h);
    suma=suma+(h/2)*(izquierda+derecha);
end
valor=suma;
return;