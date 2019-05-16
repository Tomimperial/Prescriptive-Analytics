function p=direct2(x,k,dk,xp)

delk = deltav(x);
if k == 0
    p=-delk;
    return
end
xp
delkm = deltav(xp')
p=-delk+delk'*[delk-delkm]*dk/(norm(delkm))^2

end