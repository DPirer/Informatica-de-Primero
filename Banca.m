function[]=Banca

% Autor: Pedro Antonio Est�vez P�rez
% Para una mayor claridad, no pondr� comentarios dentro de c�digos iguales,
% los pondr� antes para facilitar la traza.
% El c�digo est� perfectamente medido, es decir, tiene en cuenta un espacio
% de m�s o de menos, tildes y dem�s, por lo que una introducci�n err�nea de
% datos, puede dar un error o una mala ejecuci�n.

% PRIMER APARTADO
% Mostraremos el mensaje de bienvenida y crearemos un bucle que se pare
% cuando un contador llegue a 4, es decir, cuando hayas tenido 3 intentos,
% mostrando un warning en cada uno de ellos y otra vez el men�. Si fallas 3
% veces, dar� error.
fprintf('\n');
disp('Bienvenido.Por favor, elija una opci�n.');
fprintf('\n');
n=0;
contador=0;
while (n~=1 && n~=2)
    contador=contador+1;
    if (contador==4)
         error('Ha introducido tres veces un n�mero no v�lido.')
    end
    disp('1-Introduzca una cuenta bancaria.');
    disp('2-Dese de alta como nuevo usuario.');
    fprintf('\n');
    n=input('-->'); 
    if (n~=1 && n~=2)
        warning('Introduzca un 1 � un 2.');
    end
end

% SEGUNDO APARTADO
% En este apartado, el usuario ha seleccionado correctamente una opci�n.
% Si selecciona la opci�n 1, le pedir� que introduzca el nombre, la
% contrase�a, la cuenta y el c�digo del banco, para as� disponer de toda la
% informaci�n del usuario.
% El nombre se ha de introducir como caracter, al igual que la contrase�a y
% el c�digo del banco.
% La cuenta del usuario la introducir� como un vector porque consta de 20
% d�gitos. Si la introdujera como un n�mero, se sale de la precisi�n de
% Matlab, que es de 17 � 18 cifras por lo que las �ltimas dos o tres ser�n
% siempre cero. Utilizando un vector evitamos este problema adem�s de
% simplificar los c�lculos.
if (n==1)
    fprintf('\n');
    nombre=input('Introduzca su nombre(caracter): ');
    password=input('Introduzca el password(caracter): ');
    cuenta=input('Introduzca la cuenta bancaria(vector): ');
    codigo=input('Introduzca el c�digo del banco(carater): ');    
    % El usuario ya nos ha introducido todos sus datos. Ahora comprobaremos
    % que sean correctos.
    
    % PASSWORD
    % Comprobaremos que la contrase�a tiene 5 caracteres y que son n�meros
    % o may�sculas o min�sculas. Si no es as� daremos un error.
    if (length(password)~=5)
        error('El password debe ser una cadena de caracateres v�lida.');
    else
        for i=1:length(password)
            if (password(i)<'0' || password(i)>'9'&&password(i)<'A' || password(i)>'Z'&&password(i)<'a' || password(i)>'z')
                error ('El password debe ser una cadena de caracateres v�lida.');
            end
        end
    end
    
    % Ahora procederemos a encriptarla. He usado un m�todo de encriptaci�n
    % en el cual cambiaremos cada uno de los caracteres por el siguiente.
    % El m�todo dar� la vuelta al abecedario si es necesario. Todo lo que
    % no sea una letra, en este caso, n�meros, lo dejar� igual.
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
        error('La cuenta bancaria no es v�lida.');
    else
        for i=1:length(cuenta)
            if (cuenta(i)~=floor(cuenta(i)) || cuenta(i)<0 || cuenta(i)>9)
                error('La cuenta bancaria no es v�lida.');
            end
        end
    end
  
    % C�DIGO DEL BANCO
    % El c�digo del banco debe ser ES24 en todos los casos, as� que
    % compararemos las cadenas de texto y cuando sean distintas, error.
    if (strcmp('ES24',codigo)==0)
        error('El c�digo del banco no es v�lido.'); 
    end
    
    % SALDO
    % Como es la primera vez que introducimos este usuario,
    % consideraremos que su saldo es 0.
    saldo=0;
    
    % ESCRITURA DE LOS DATOS EN EL SISTEMA
    % Si llegamos hasta aqu�, es que todos los datos introducidos por el
    % usuario son correctos. Antes de nada, aunque el enunciado no lo pone,
    % por completar, comprobaremos si el nombre est� ya en el sistema, de
    % forma que si est�, no lo escribiremos, y daremos un mensaje diciendo
    % que estamos en �l.
    
    % Abriremos el sistema en modo de lectura y copiaremos todos
    % los contenidos.
    % Lo que haremos ser� usar esos dos bucles para comprobar si est� el 
    % usuario. Mirar�n la primera letra del nombre y la comparar�n con la 
    % primera del contenido, si coinciden, avanzan y si no, vuelve atr�s en
    % el nombre y contin�a en contenido.
        
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
    % nombre est� en el fichero y daremos a i y j el valor de inf para que
    % se salgan del bucle.
    % Daremos un mensaje si es as� y si no, procederemos a ingresarlos en
    % el sistema.
    
    % S�lo comprobaremos el nombre, ya que si el usuario est� en el
    % sistema, se supone que es porque primero ingres� en �l, entonces se
    % le proporcion� una contrase�a as� como una cuenta que el usuario
    % debi� conservar y son �stas las que ha debido de introducir en este
    % apartado.
      
     if (valor==(length(nombre))+1)
         fprintf('\n');
         disp('Felicidaddes, ud. disfruta de nuestros sevicios.');             
     else     
    % Debido a que en el enunciado se usaba todo el rato la
    % palabra sistema, he usado sistema.txt sin darme cuenta de que al
    % final pon�a Clientes_Banca, pero el resultado ser� el mismo.
    
    % El fichero lo tendr� ya creado simplemente porque tiene una peque�a
    % cabecera y por eliminar unas cuantas l�neas m�s de c�digo.
    
    % Escribiremos en el fichero el nombre del usuario, su cuenta, su
    % contrase�a, pero la encriptada, y el saldo. Los saltos de l�nea los
    % he puesto aparte para poder copiar y pegar.
     fid=fopen('sistema.txt','a');
     fprintf(fid,'\n\n');
     fprintf(fid,'NOMBRE DEL USUARIO:\n');
     fprintf(fid,'%c',nombre);
     fprintf(fid,'\n');
     fprintf(fid,'N�MERO DE CUENTA:\n');
     fprintf(fid,'%d',cuenta);
     fprintf(fid,'\n');
     fprintf(fid,'PASSWORD\n');
     fprintf(fid,'%c',passenc);
     fprintf(fid,'\n');
     fprintf(fid,'C�DIGO DEL BANCO\n');
     fprintf(fid,'%c',codigo);
     fprintf(fid,'\n');
     fprintf(fid,'SALDO\n');
     fprintf(fid,'%d�',saldo);
     fprintf(fid,'\n');
     fclose(fid);
     end          
     % La escritura de los datos en el sistema de este apartado
     % lo he hecho para una mayor robustez, pero realmente no tiene mucho
     % sentido porque si el usuario introduce un nombre distinto, el
     % programa lo meter� en el sistema, pero, de d�nde salen los datos que
     % ha introducido? Porque el sistema no se los ha proporcionado porque
     % si fuera as�, dir�a que est� en el sistema. Es decir, este apartado
     % s�lo tiene sentido si se usa despu�s de segundo y sin tener que ser
     % necesario meter un nombre nuevo.
else
    % TERCER APARTADO
    % Si llegamos aqu�, significa que el usuario ha elegido la opci�n 2.
    % Deber� introducir su nombre, comprobar� si est� o no en el sistema y
    % si no lo est�, le generar� unos nuevos datos.
    
    % COMPROBACI�N DEL NOMBRE
    % Le pediremos al usuario que introduzca el nombre, por supuesto, como
    % caracter. Abriremos el sistema en modo de lectura y copiaremos todos
    % los contenidos.
    % La comprobaci�n ser� an�loga a la anterior.    
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
        % Le generaremos una contrase�a al usuario. Como deben ser n�meros y
        % letras aleatorios, lo que har� ser� coger un n�mero aleatorio del
        % 1 al 3, y cada n�mero corresponde con un m�todo.
        % Si sale el 1, crear� un n�mero aleatorio entre 0 y 9.
        % Si sale el 2, crear� una min�scula aleatoria.
        % Si sale el 3, crear� una may�scula aleatoria.
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
            % Ahora crearemos un fichero llamado password.txt que se crear�
            % la primera vez que ejecutemos el programa y se borrar� las
            % siguientes, y a partir de ah�, lo mantendremos para ir
            % escribiendo e iremos escribiendo en �l el elemento obtenido,
            % ya que como tenemos caracteres y n�meros, no lo podremos
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
        disp('Su password ser�:')
        fprintf('%c',password);
        fprintf('\n\n')
        % �sta ser� la contrase�a que mostraremos por pantalla.
        % Ahora procederemos a encriptarla, porque ser� esa la que
        % escribiremos en el fichero con los datos. El m�todo de
        % encriptaci�n ser� el mismo que el anterior.
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
        disp('Su cuenta bancaria ser�:')
        fprintf('%d',cuenta);
        fprintf('\n\n');

        % C�DIGO DEL BANCO
        % El c�digo del banco debe ser ES24 y lo mostraremos por pantalla.
        codigo='ES24';
        disp('El c�digo de su banco es:')
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
        fprintf(fid,'N�MERO DE CUENTA:\n');
        fprintf(fid,'%d',cuenta);
        fprintf(fid,'\n');
        fprintf(fid,'PASSWORD\n');
        fprintf(fid,'%c',passenc);
        fprintf(fid,'\n');
        fprintf(fid,'C�DIGO DEL BANCO\n');
        fprintf(fid,'%c',codigo);
        fprintf(fid,'\n');
        fprintf(fid,'SALDO\n');
        fprintf(fid,'%d�',saldo);
        fprintf(fid,'\n');
        fclose(fid);
    
    end
end


% CUARTO APARTADO
% Resumiendo, lo que hemos hecho hasta ahora es meter los datos en el
% fichero, y cada vez que volviamos a ejecutar el programa, tanto si
% cogemos la opci�n uno o la dos, comprobar si est� en el sistema y si no,
% asignarle al usuario sus datos
% El usuario ahora posee sus datos
% tanto si los ha introducido como si se los he proporcionado y �stos
% figuran en el fichero sistema.txt.
% Ahora procederemos la la utilizaci�n del 'cajero' en s�.
% Mostraremos otro men� en el que podremos ingresar dinero, sacar dinero
% o salir.
fprintf('\n');
disp('�Qu� operaci�n desea realizar?');
fprintf('\n');
disp('1-Ingresar dinero.');
disp('2-Sacar dinero.');
disp('3-Salir del sistema.');
fprintf('\n');

% Antes de proceder a meter o sacar dinero, debemos saber cual es el saldo
% de la cuenta del usuario. Antes comprobaba si el usuario estaba en el
% sistema, ahora con un c�digo muy parecido, encuentro la posici�n del
% final del nombre, para no equivocarnos de saldo, y a partir de esa
% posici�n, siempre hay exactamente la misma distancia hasta el comienzo
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
% Ya tenemos la posici�n del final del nombre. 83 carateres m�s all� se
% encuentra el saldo. El problema ser�a hasta donde llega, cosa que
% solucionamos con un while, haciendo que pare de leer cuando lleguemos al
% s�mbolo del euro.
i=posicion+83;
p=1;
while (strcmp(contenido(i),'�')==0)
    saldo(p)=contenido(i);
    p=p+1;
    i=i+1;
end
% Ya tenemos el saldo. El problema es que lo tenemos como caracter y no
% podr�amos trabajar con �l. La primera vez que lo leamos saldr� como
% vector y a partir de ah� como caracter, as� lo que haremos ser� primero
% transformarlo a caracter, de forma que si ya estaba en caracter no lo
% altera, y luego con str2double, pasarlo a n�meros para as� poder operar
% con �l.
saldo=char(saldo);
saldo=str2double(saldo);

% Ya tenemos el saldo del usuario. Ahora ejecutaremos las acciones del
% men�. Introduciremos una cantidad que no puede superar los 1000� ni ser
% negativa. Se la sumaremos o restaremos al saldo, creando la variable
% saldo nuevo. Si el saldo nuevo fuera negativo, daremos un mensaje de
% aviso muy original.
n=input('-->');
fprintf('\n');
if (n==1)
    cantidad=input('Introduzca la cantidad: ');
    fprintf('\n');
    if (cantidad>1000 || cantidad<0)
        error('Las cantidades no deben superar los 1000�');
    end
    saldonuevo=saldo+cantidad;
    fprintf('Su saldo es de: %.2f�\n',saldonuevo);
    if (saldonuevo<0)
        fprintf('Felices juegos del hambre y que la suerte est� siempre de vuestra parte.\n');
    end
elseif (n==2)
    cantidad=input('Introduzca la cantidad: ');
    fprintf('\n');
    if (cantidad>1000 || cantidad<0)
        error('Las cantidades no deben superar los 1000�');
    end
    saldonuevo=saldo-cantidad;
    fprintf('Su saldo es de: %.2f�\n',saldonuevo);
    if (saldonuevo<0)
        fprintf('Felices juegos del hambre y que la suerte est� siempre de vuestra parte.\n');
    end
else
    return;
end

% Ya tenemos el saldo final que tendr� el usuario. Ahora debemos modificar
% el fichero para que figure en �l. Como no se puede sobreescribir un
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
fprintf(fid,'�\n');
% Ahora debemos meter todo lo que hab�a en el contenido despu�s del saldo.
% Lo que har� ser� locacizar la distancia desde el nombre hasta el s�mbolo
% del euro.
x=1;
contador=0;
j=posicion;
while (x==1)
    if (strcmp(contenido(j),'�')==1)
        x=2;
    else
        contador=contador+1;
        j=j+1;
    end
end
% Finalmente lo que tengo que copiar es desde la posici�n+contador, +1
% para saltar el s�mbolo, hasta el final.
for i=posicion+contador+1:length(contenido)
    fprintf(fid,'%c',contenido(i));
end
fclose(fid);
% FIN
return;

















