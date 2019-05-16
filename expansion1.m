function k = expansion1(x,y,z,g)
beta=1;
k=g+beta*(g -(y+z)/2);
if(evalf(k(1),k(2))>evalf(g(1),g(2)))
    k=g;
end

end