% Armijo method of Alpha estimation

function a = alphat(x,dk,sig)
alp=1; % the initial step
gamm = .5; % the gamma value 
% sig = .1; % the Sigma value
 
 while ((f(x+alp*dk)-f(x)) > gamm * alp* deltav(x)'*dk)% Checking if the the difference between
     %new point and old point are within our pre-set limts
     alp = sig * alp; % if not we change alpha
 
 end
    a = alp;    
  
end