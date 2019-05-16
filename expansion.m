function k = expansion1(x,y,z,g)
beta=1;
k=g+beta*(g -(y+z)/2);
if(evalf(k(1),k(2))>evalf(c(1),c(2)))
    k=g;
end

end