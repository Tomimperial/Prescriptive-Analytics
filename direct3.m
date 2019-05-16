function p=direct3(x,H)

delk = deltav(x);

q=-H*delk;
if (abs(delk'*q)/(norm(delk)*norm(q)))<1e-6
  p=-delk  
 
  return
end
if (delk'*q<0)
    p=q
   
    return
end
p=-q

end