function[contenido]=prueba()

saldo=526.32;
fid=fopen('hola.txt','a');
fprintf('\n');
fprintf(fid,'%f',saldo);
fclose(fid);

fid=fopen('hola.txt','r');
contenido=fscanf(fid,'%f',inf);
fclose(fid);

n=input('cantidad: ');

contenido=contenido+n;
return;