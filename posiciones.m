%% Ejercicio original de teoría
A = 1:5;
% Creamos un fichero y guardamos en él los contenidos de la variable A en
% formato short (enteros de 16 bits)
fid = fopen('five.bin','w')
fwrite(fid, A,'short')
status = fclose(fid)

disp('Fichero creado');
disp('A continuacion abrimos el fichero, avanzamos 6 bytes y leemos dato');
disp('Pulse para continuar');
pause;

% Ahora abrimos el fichero creado anteriormente pero en modo de lectura
fid = fopen('five.bin','r')
% Saltamos seis bytes desde el principio del fichero
status = fseek(fid,6,'bof')
% Leemos un valor de tipo short, el cuatro, y el cursor avanza
% automáticamente tras la lectura
four = fread(fid,1,'short')
% Ahora estaremos en la posición 8, puesto que hemos avanzado 6 manualmente
% y 2 más al leer un short. Lo comprobamos
position = ftell(fid)

disp('Lectura de posicion actual realizada');
disp('A continuación retrocedemos 4 bytes y leemos un short');
disp('Pulse para continuar');
pause;

% Retrocedemos 4 bytes
status = fseek(fid,-4,'cof')
% Si leemos ahora un 'short', será el número 3 (hemos retrocedido las dos
% posiciones de cuatro y las dos posiciones de 3, colocándonos al principio
% de la lectura del número 3)
numero = fread(fid,1,'short')

disp('A continuacion vamos a comprobar que los numeros que guardemos aparecen como caracteres al abrirlos con el bloc de notas');
disp('Pulse para continuar');
pause;

asciis = double('hola,amigo')
valores = asciis(1:2:end)*256+asciis(2:2:end)
fid = fopen('saludo.txt','w')
fwrite(fid, valores,'short')
fclose(fid)

disp('Que ha ocurrido con el mensaje que queríamos escribir???');
disp('Pulse para continuar');
pause;

valores2 = asciis(2:2:end)*256+asciis(1:2:end)
fid = fopen('saludobueno.txt','w')
fwrite(fid, valores2,'short')
fclose(fid)

disp('Los valores se escriben en formato BYTE menos significativo primero!!!');
