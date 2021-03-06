function p=direct1(x)
% Finding gradient at x
delk = deltav(x)
% Finding 2nd order gradient at x
K=delta2v(x);
if det(K) == 0 % going back to gardient methods as 2nd Order gradient is not defined
  p=-delk  
  return
end
delk';

S = linsolve(K,-delk); % finding the minumum of the quadratic approximation

if (abs(delk'*S)/(norm(delk)*norm(S)))<1e-6
  p=-delk  % Checking the angle condition
 
  return
end
if (delk'*S<0)% checking if the S is the decent direction
    p=S
   
    return
end
p=-S

end