function[]=binario_rec(n)

if (n==1)
    fprintf('%d',n)
else
    binario_rec(floor(n/2));
    fprintf('%d',rem(n,2));
end

return;