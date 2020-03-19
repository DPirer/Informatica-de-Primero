function count = counter( initialize )
persistent currentCount;
if nargin == 1
      currentCount = initialize;
else
      currentCount = currentCount + 1;
end
count = currentCount;