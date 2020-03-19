function[C]=multiplica_v2(A,B)

% Esta vez, lo que hacemos es crear un bucle que recorra las filas de A y
% otro para las columnas de B. Inicializamos la suma y creamos otro bucle
% que vaya recorriendo las filas y las columnas de A y B al mismo tiempo.

C=zeros(size(A,1),size(B,2));
for i=1:size(A,1)
    for j=1:size(B,2)
        C(i,j)=0;
        for k=1:size(A,2)
            C(i,j)=C(i,j)+A(i,k)*B(k,j);
        end
    end
end
return;