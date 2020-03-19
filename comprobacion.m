function[contenido]=comprobacion()

saldo=[1 2 3 1 2];

fid=fopen('hola.txt','w');
fprintf(fid,'%d',saldo);
fclose(fid);
