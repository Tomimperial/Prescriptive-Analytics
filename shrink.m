function [x,y,z]= shrink(a,b,c)
delt =.75
x=a;
y=x+delt(b-a);
z=x+delt(c-a)
end