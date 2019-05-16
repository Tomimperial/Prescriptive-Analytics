function [H]=BFGS(x,k,xp,Hp)
if k==0
    H = eye(2);
    return
end

gk = deltav(x)-deltav(xp');
dk = x-xp';
vk=(gk'*Hp*gk)^(1/2)*((dk/(dk'*gk))-((Hp*gk)/(gk'*Hp*gk)));

H=Hp+((dk*dk')/(dk'*gk))-((Hp*gk*gk'*Hp)/(gk'*Hp*gk))+vk*vk';

end