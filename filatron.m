function[v]=filatron(A)

j=1:size(A,1):(size(A,1)*size(A,2));
v=[];
v=[v A(j)];