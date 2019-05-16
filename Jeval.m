function Jeval(x)
for i=1:length(x)
x(i,:);
curval=x(i,:);
J(i,:)= log( (curval(1)-1)^2+(curval(2)-1)^2);

K(i,:)=i;
end

plot(K,J,'LineWidth',1.5)
polyfit(J(1:end-1),J(2:end),1)
grid on
hold on
xlabel('value of K')
ylabel('value of cost function')
end