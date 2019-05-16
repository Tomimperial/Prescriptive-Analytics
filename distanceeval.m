
for i =2:765
    curval1=xmain(i,:);
    curval2=xmain(i-1,:);
    Val(i-1,:)=sqrt((curval1(1)-curval2(1))^2+(curval1(2)-curval2(2))^2)
end