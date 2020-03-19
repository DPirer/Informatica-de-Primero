function[mnsje]=encripta2(mensaje,llave)
mnsje=double(mensaje);
for i=1:length(mensaje)      
    if(mensaje(i)<'A'||(mensaje(i)>'Z' && mensaje(i)<'a')||mensaje(i)>'z')
        mnsje(i)=mensaje(i);           
   elseif(mensaje(i)+llave<'A')
        mnsje(i)=('A'+('Z'-'A'))+1+llave;        
    elseif(mensaje(i)+llave>'z')
        mnsje(i)=('z'-('z'-'a'))-1+llave;     
    elseif(mensaje(i)>='A' && mensaje(i)<='Z' && mensaje(i)+llave>'Z')
        mnsje(i)=('Z'-('Z'-'A'))-1+llave;     
    elseif(mensaje(i)>='a' && mensaje(i)<='z' && mensaje(i)+llave<'a')
        mnsje(i)=('a'+('z'-'a'))+1+llave;                   
    else
    mnsje(i)=mensaje(i)+llave;
    end
end
mnsje=char(mnsje);