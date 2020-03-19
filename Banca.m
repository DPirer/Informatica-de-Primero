function[]=Banca

% Autor: Pedro Antonio Estévez Pérez
% Para una mayor claridad, no pondré comentarios dentro de códigos iguales,
% los pondré antes para facilitar la traza.
% El código está perfectamente medido, es decir, tiene en cuenta un espacio
% de más o de menos, tildes y demás, por lo que una introducción errónea de
% datos, puede dar un error o una mala ejecución.

% PRIMER APARTADO
% Mostraremos el mensaje de bienvenida y crearemos un bucle que se pare
% cuando un contador llegue a 4, es decir, cuando hayas tenido 3 intentos,
% mostrando un warning en cada uno de ellos y otra vez el menú. Si fallas 3
% veces, dará error.
fprintf('\n');
disp('Bienvenido.Por favor, elija una opción.');
fprintf('\n');
n=0;
contador=0;
while (n~=1 && n~=2)
    contador=contador+1;
    if (contador==4)
         error('Ha introducido tres veces un número no válido.')
    end
    disp('1-Introduzca una cuenta bancaria.');
    disp('2-Dese de alta como nuevo usuario.');
    fprintf('\n');
    n=input('-->'); 
    if (n~=1 && n~=2)
        warning('Introduzca un 1 ó un 2.');
    end
end

% SEGUNDO APARTADO
% En este apartado, el usuario ha seleccionado correctamente una opción.
% Si selecciona la opción 1, le pediré que introduzca el nombre, la
% contraseña, la cuenta y el código del banco, para así disponer de toda la
% información del usuario.
% El nombre se ha de introducir como caracter, al igual que la contraseña y
% el código del banco.
% La cuenta del usuario la introducirá como un vector porque consta de 20
% dígitos. Si la introdujera como un número, se sale de la precisión de
% Matlab, que es de 17 ó 18 cifras por lo que las últimas dos o tres serán
% siempre cero. Utilizando un vector evitamos este problema además de
% simplificar los cálculos.
if (n==1)
    fprintf('\n');
    nombre=input('Introduzca su nombre(caracter): ');
    password=input('Introduzca el password(caracter): ');
    cuenta=input('Introduzca la cuenta bancaria(vector): ');
    codigo=input('Introduzca el código del banco(carater): ');    
    % El usuario ya nos ha introducido todos sus datos. Ahora comprobaremos
    % que sean correctos.
    
    % PASSWORD
    % Comprobaremos que la contraseña tiene 5 caracteres y que son números
    % o mayúsculas o minúsculas. Si no es así daremos un error.
    if (length(password)~=5)
        error('El password debe ser una cadena de caracateres válida.');
    else
        for i=1:length(password)
            if (password(i)<'0' || password(i)>'9'&&password(i)<'A' || password(i)>'Z'&&password(i)<'a' || password(i)>'z')
                error ('El password debe ser una cadena de caracateres válida.');
            end
        end
    end
    
    % Ahora procederemos a encriptarla. He usado un método de encriptación
    % en el cual cambiaremos cada uno de los caracteres por el siguiente.
    % El método dará la vuelta al abecedario si es necesario. Todo lo que
    % no sea una letra, en este caso, números, lo dejará igual.
    passenc=double(password);
    for i=1:length(password)      
        if(password(i)<'A'||(password(i)>'Z' && password(i)<'a')||password(i)>'z')
           passenc(i)=password(i);           
        elseif(password(i)+1<'A')
           passenc(i)=('A'+('Z'-'A'))+2;        
        elseif(password(i)+1>'z')
           passenc(i)=('z'-('z'-'a'));     
        elseif(password(i)>='A' && password(i)<='Z' && password(i)+1>'Z')
           passenc(i)=('Z'-('Z'-'A'));     
        elseif(password(i)>='a' && password(i)<='z' && password(i)+1<'a')
           passenc(i)=('a'+('z'-'a'))+2;                   
        else
           passenc(i)=password(i)+1;
        end
    end
    passenc=char(passenc);
    
    % CUENTA BANCARIA
    % La longitud del vector cuenta debe ser de 20 elementos enteros entre
    % 0 y 9. Lo comprobaremos y en caso negativo, daremos un error.
    if (length(cuenta)~=20)
        error('La cuenta bancaria no es válida.');
    else
        for i=1:length(cuenta)
            if (cuenta(i)~=floor(cuenta(i)) || cuenta(i)<0 || cuenta(i)>9)
                error('La cuenta bancaria no es válida.');
            end
        end
    end
  
    % CÓDIGO DEL BANCO
    % El código del banco debe ser ES24 en todos los casos, así que
    % compararemos las cadenas de texto y cuando sean distintas, error.
    if (strcmp('ES24',codigo)==0)
        error('El código del banco no es válido.'); 
    end
    
    % SALDO
    % Como es la primera vez que introducimos este usuario,
    % consideraremos que su saldo es 0.
    saldo=0;
    
    % ESCRITURA DE LOS DATOS EN EL SISTEMA
    % Si llegamos hasta aquí, es que todos los datos introducidos por el
    % usuario son correctos. Antes de nada, aunque el enunciado no lo pone,
    % por completar, comprobaremos si el nombre está ya en el sistema, de
    % forma que si está, no lo escribiremos, y daremos un mensaje diciendo
    % que estamos en él.
    
    % Abriremos el sistema en modo de lectura y copiaremos todos
    % los contenidos.
    % Lo que haremos será usar esos dos bucles para comprobar si está el 
    % usuario. Mirarán la primera letra del nombre y la compararán con la 
    % primera del contenido, si coinciden, avanzan y si no, vuelve atrás en
    % el nombre y continúa en contenido.
        
    fid=fopen('sistema.txt','r');
    contenido=fscanf(fid,'%c',inf);
    fclose(fid);
    i=1;
    j=1;
    while (i<=length(nombre))
        while (j<=length(contenido))
            if (nombre(i)==contenido(j))
                i=i+1;
                j=j+1;
            else
                j=j+1;
                i=1;
            end
            
            if (j==length(contenido)+1 ||i==length(nombre)+1)
                posicion=j;
                valor=i;
                j=inf;
                i=inf;
            end
        end
    end
    
    % Finalmente, si hemos llegado a la longitud del nombre, es que el
    % nombre está en el fichero y daremos a i y j el valor de inf para que
    % se salgan del bucle.
    % Daremos un mensaje si es así y si no, procederemos a ingresarlos en
    % el sistema.
    
    % Sólo comprobaremos el nombre, ya que si el usuario está en el
    % sistema, se supone que es porque primero ingresó en él, entonces se
    % le proporcionó una contraseña así como una cuenta que el usuario
    % debió conservar y son éstas las que ha debido de introducir en este
    % apartado.
      
     if (valor==(length(nombre))+1)
         fprintf('\n');
         disp('Felicidaddes, ud. disfruta de nuestros sevicios.');             
     else     
    % Debido a que en el enunciado se usaba todo el rato la
    % palabra sistema, he usado sistema.txt sin darme cuenta de que al
    % final ponía Clientes_Banca, pero el resultado será el mismo.
    
    % El fichero lo tendré ya creado simplemente porque tiene una pequeña
    % cabecera y por eliminar unas cuantas líneas más de código.
    
    % Escribiremos en el fichero el nombre del usuario, su cuenta, su
    % contraseña, pero la encriptada, y el saldo. Los saltos de línea los
    % he puesto aparte para poder copiar y pegar.
     fid=fopen('sistema.txt','a');
     fprintf(fid,'\n\n');
     fprintf(fid,'NOMBRE DEL USUARIO:\n');
     fprintf(fid,'%c',nombre);
     fprintf(fid,'\n');
     fprintf(fid,'NÚMERO DE CUENTA:\n');
     fprintf(fid,'%d',cuenta);
     fprintf(fid,'\n');
     fprintf(fid,'PASSWORD\n');
     fprintf(fid,'%c',passenc);
     fprintf(fid,'\n');
     fprintf(fid,'CÓDIGO DEL BANCO\n');
     fprintf(fid,'%c',codigo);
     fprintf(fid,'\n');
     fprintf(fid,'SALDO\n');
     fprintf(fid,'%d€',saldo);
     fprintf(fid,'\n');
     fclose(fid);
     end          
     % La escritura de los datos en el sistema de este apartado
     % lo he hecho para una mayor robustez, pero realmente no tiene mucho
     % sentido porque si el usuario introduce un nombre distinto, el
     % programa lo meterá en el sistema, pero, de dónde salen los datos que
     % ha introducido? Porque el sistema no se los ha proporcionado porque
     % si fuera así, diría que está en el sistema. Es decir, este apartado
     % sólo tiene sentido si se usa después de segundo y sin tener que ser
     % necesario meter un nombre nuevo.
else
    % TERCER APARTADO
    % Si llegamos aquí, significa que el usuario ha elegido la opción 2.
    % Deberá introducir su nombre, comprobaré si está o no en el sistema y
    % si no lo está, le generaré unos nuevos datos.
    
    % COMPROBACIÓN DEL NOMBRE
    % Le pediremos al usuario que introduzca el nombre, por supuesto, como
    % caracter. Abriremos el sistema en modo de lectura y copiaremos todos
    % los contenidos.
    % La comprobación será análoga a la anterior.    
    fprintf('\n');
    nombre=input('Introduzca el nombre y el primer apellido(caracter): ');
    fprintf('\n');
    fid=fopen('sistema.txt','r');
    contenido=fscanf(fid,'%c',inf);
    fclose(fid);
    i=1;
    j=1;
    while (i<=length(nombre))
        while (j<=length(contenido))
            if (nombre(i)==contenido(j))
                i=i+1;
                j=j+1;
            else
                j=j+1;
                i=1;
            end
            
            if (j==length(contenido)+1 ||i==length(nombre)+1)
                posicion=j;
                valor=i;
                j=inf;
                i=inf;
            end
        end
    end

    if (valor==(length(nombre))+1)
        disp('Felicidaddes, ud. disfruta de nuestros sevicios.');     
        
    else       
        % PASSWORD  
        % Le generaremos una contraseña al usuario. Como deben ser números y
        % letras aleatorios, lo que haré será coger un número aleatorio del
        % 1 al 3, y cada número corresponde con un método.
        % Si sale el 1, creará un número aleatorio entre 0 y 9.
        % Si sale el 2, creará una minúscula aleatoria.
        % Si sale el 3, creará una mayúscula aleatoria.
        v=ones(1,5);
        for i=1:5
            m=ceil(3*rand(1));
            if (m==1)
                n=floor(9*rand(1));
                v(i)=n*v(i);
            elseif (m==2)
                n=ceil(('a'+'z')*(rand(1))-'a');
                while (n<'a')
                    n=ceil(('a'+'z')*(rand(1))-'a');
                end
                v(i)=n*v(i);
            else
                n=ceil(('A'+'Z')*(rand(1))-'A');
                while(n<'A')
                    n=ceil(('A'+'Z')*(rand(1))-'A');
                end
                v(i)=n*v(i);
            end
            % Ahora crearemos un fichero llamado password.txt que se creará
            % la primera vez que ejecutemos el programa y se borrará las
            % siguientes, y a partir de ahí, lo mantendremos para ir
            % escribiendo e iremos escribiendo en él el elemento obtenido,
            % ya que como tenemos caracteres y números, no lo podremos
            % guardar en una variable.
            if (i==1)
                fid=fopen('password.txt','w');
            else
                fid=fopen('password.txt','a');
            end
            if (v(i)>'9')
                fwrite(fid,v(i));
            else
                fprintf(fid,'%d',v(i));
            end
            fclose(fid);
        end
        % Una vez que tenemos el fichero, lo leemos y copiamos los datos a
        % la variable password, de forma que lo que nos queda son solo
        % caracteres en una variable.
        fid=fopen('password.txt','r');
        password=fscanf(fid,'%c',inf);
        fclose(fid);
        disp('Su password será:')
        fprintf('%c',password);
        fprintf('\n\n')
        % Ésta será la contraseña que mostraremos por pantalla.
        % Ahora procederemos a encriptarla, porque será esa la que
        % escribiremos en el fichero con los datos. El método de
        % encriptación será el mismo que el anterior.
        passenc=double(password);
        for i=1:length(password)      
            if(password(i)<'A'||(password(i)>'Z' && password(i)<'a')||password(i)>'z')
               passenc(i)=password(i);           
            elseif(password(i)+1<'A')
               passenc(i)=('A'+('Z'-'A'))+2;        
            elseif(password(i)+1>'z')
               passenc(i)=('z'-('z'-'a'));     
            elseif(password(i)>='A' && password(i)<='Z' && password(i)+1>'Z')
               passenc(i)=('Z'-('Z'-'A'));     
            elseif(password(i)>='a' && password(i)<='z' && password(i)+1<'a')
               passenc(i)=('a'+('z'-'a'))+2;                   
            else
               passenc(i)=password(i)+1;
            end
        end
        passenc=char(passenc);
    
        % CUENTA BANCARIA
        % Para la cuenta bancaria, simplemente generaremos un vector de 20
        % elementos entre 0 y 9 y lo mostraremos por pantalla.
        cuenta=floor(9*rand(1,20));
        disp('Su cuenta bancaria será:')
        fprintf('%d',cuenta);
        fprintf('\n\n');

        % CÓDIGO DEL BANCO
        % El código del banco debe ser ES24 y lo mostraremos por pantalla.
        codigo='ES24';
        disp('El código de su banco es:')
        fprintf('ES24\n\n');
        
        % SALDO
        % Como es la primera vez que introducimos este usuario,
        % consideraremos que su saldo es 0.
        saldo=0;
        
        % ESCRITURA DE LOS DATOS EN EL SISTEMA
        % Nuevamente, escribiremos los datos en el sistema.
        fid=fopen('sistema.txt','a');
        fprintf(fid,'\n\n');
        fprintf(fid,'NOMBRE DEL USUARIO:\n');
        fprintf(fid,'%c',nombre);
        fprintf(fid,'\n');
        fprintf(fid,'NÚMERO DE CUENTA:\n');
        fprintf(fid,'%d',cuenta);
        fprintf(fid,'\n');
        fprintf(fid,'PASSWORD\n');
        fprintf(fid,'%c',passenc);
        fprintf(fid,'\n');
        fprintf(fid,'CÓDIGO DEL BANCO\n');
        fprintf(fid,'%c',codigo);
        fprintf(fid,'\n');
        fprintf(fid,'SALDO\n');
        fprintf(fid,'%d€',saldo);
        fprintf(fid,'\n');
        fclose(fid);
    
    end
end


% CUARTO APARTADO
% Resumiendo, lo que hemos hecho hasta ahora es meter los datos en el
% fichero, y cada vez que volviamos a ejecutar el programa, tanto si
% cogemos la opción uno o la dos, comprobar si está en el sistema y si no,
% asignarle al usuario sus datos
% El usuario ahora posee sus datos
% tanto si los ha introducido como si se los he proporcionado y éstos
% figuran en el fichero sistema.txt.
% Ahora procederemos la la utilización del 'cajero' en sí.
% Mostraremos otro menú en el que podremos ingresar dinero, sacar dinero
% o salir.
fprintf('\n');
disp('¿Qué operación desea realizar?');
fprintf('\n');
disp('1-Ingresar dinero.');
disp('2-Sacar dinero.');
disp('3-Salir del sistema.');
fprintf('\n');

% Antes de proceder a meter o sacar dinero, debemos saber cual es el saldo
% de la cuenta del usuario. Antes comprobaba si el usuario estaba en el
% sistema, ahora con un código muy parecido, encuentro la posición del
% final del nombre, para no equivocarnos de saldo, y a partir de esa
% posición, siempre hay exactamente la misma distancia hasta el comienzo
% del saldo.
% Debemos volver a copiar el contenido del fichero, ya que al introducir
% nuevos datos, las posiciones de los elementos puedes haber cambiado.
fid=fopen('sistema.txt','r');
contenido=fscanf(fid,'%c',inf);
fclose(fid);
i=1;
j=1;
while (i<=length(nombre))
    while (j<=length(contenido))
        if (nombre(i)==contenido(j))
            i=i+1;
            j=j+1;
        else
            j=j+1;
            i=1;
        end
            
        if (j==length(contenido)+1 ||i==length(nombre)+1)
            posicion=j;
            valor=i;
            j=inf;
            i=inf;
        end
    end
end
% Ya tenemos la posición del final del nombre. 83 carateres más allá se
% encuentra el saldo. El problema sería hasta donde llega, cosa que
% solucionamos con un while, haciendo que pare de leer cuando lleguemos al
% símbolo del euro.
i=posicion+83;
p=1;
while (strcmp(contenido(i),'€')==0)
    saldo(p)=contenido(i);
    p=p+1;
    i=i+1;
end
% Ya tenemos el saldo. El problema es que lo tenemos como caracter y no
% podríamos trabajar con él. La primera vez que lo leamos saldrá como
% vector y a partir de ahí como caracter, así lo que haremos será primero
% transformarlo a caracter, de forma que si ya estaba en caracter no lo
% altera, y luego con str2double, pasarlo a números para así poder operar
% con él.
saldo=char(saldo);
saldo=str2double(saldo);

% Ya tenemos el saldo del usuario. Ahora ejecutaremos las acciones del
% menú. Introduciremos una cantidad que no puede superar los 1000€ ni ser
% negativa. Se la sumaremos o restaremos al saldo, creando la variable
% saldo nuevo. Si el saldo nuevo fuera negativo, daremos un mensaje de
% aviso muy original.
n=input('-->');
fprintf('\n');
if (n==1)
    cantidad=input('Introduzca la cantidad: ');
    fprintf('\n');
    if (cantidad>1000 || cantidad<0)
        error('Las cantidades no deben superar los 1000€');
    end
    saldonuevo=saldo+cantidad;
    fprintf('Su saldo es de: %.2f€\n',saldonuevo);
    if (saldonuevo<0)
        fprintf('Felices juegos del hambre y que la suerte esté siempre de vuestra parte.\n');
    end
elseif (n==2)
    cantidad=input('Introduzca la cantidad: ');
    fprintf('\n');
    if (cantidad>1000 || cantidad<0)
        error('Las cantidades no deben superar los 1000€');
    end
    saldonuevo=saldo-cantidad;
    fprintf('Su saldo es de: %.2f€\n',saldonuevo);
    if (saldonuevo<0)
        fprintf('Felices juegos del hambre y que la suerte esté siempre de vuestra parte.\n');
    end
else
    return;
end

% Ya tenemos el saldo final que tendrá el usuario. Ahora debemos modificar
% el fichero para que figure en él. Como no se puede sobreescribir un
% fichero, haremos lo siguiente:
% Recordemos que tenemos todo el contenido del fichero guardado.
% Abriremos el fichero en modo de lectura, de forma que borraremos todos
% los datos anteriores y escribiremos todos los elementos hasta el saldo de
% el usuario.
fid=fopen('sistema.txt','w');
for i=1:posicion+82
    fprintf(fid,'%c',contenido(i));
end
% Ahora impriminos el saldo nuevo.
fprintf(fid,'%.2f',saldonuevo);
fprintf(fid,'€\n');
% Ahora debemos meter todo lo que había en el contenido después del saldo.
% Lo que haré será locacizar la distancia desde el nombre hasta el símbolo
% del euro.
x=1;
contador=0;
j=posicion;
while (x==1)
    if (strcmp(contenido(j),'€')==1)
        x=2;
    else
        contador=contador+1;
        j=j+1;
    end
end
% Finalmente lo que tengo que copiar es desde la posición+contador, +1
% para saltar el símbolo, hasta el final.
for i=posicion+contador+1:length(contenido)
    fprintf(fid,'%c',contenido(i));
end
fclose(fid);
% FIN
return;

















