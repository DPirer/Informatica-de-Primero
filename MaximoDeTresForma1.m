function [maximo]=MaximoDeTresForma1 (a,b,c)

% Con este programa podremos ver cual de los tres n�meros que introduzcamos
% es m�s grande.

%CASO DEGENERADO
if(a==b)
    if(a==c)
        maximo=a;
    end
    if(c>a)
        maximo=c;
    end
    if(c<a)
        maximo=b;
    end
elseif (b==c)
    if(a>b)
        maximo=a;
    end
    if(a<b)
        maximo=c;
    end
elseif (a==c)
    if(a>b)
        maximo=a;
    end
    if (a<b)
        maximo=b;
    end
end
        

% CASO GEN�RICO
if(a>b)
    if(a>c)
        maximo=a;
    end
    if(c>a)
        maximo=c;
    end
elseif (b>c)
    maximo=b;
else
    maximo=c;
end
return;