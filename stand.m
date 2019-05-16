function d = stand(x,y,z)
fmean = (evalf(x(1),x(2))+evalf(y(1),y(2))+evalf(z(1),z(2)))/3;
d=((evalf(x(1),x(2))-fmean)^2+(evalf(y(1),y(2))-fmean)^2+(evalf(z(1),z(2))-fmean)^2)/3;
end