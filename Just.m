function Just(x)
for i=1:length(x)
   
x(i,:);
curval=x(i,:);
J(i,:)= log( (curval(1)-1)^2+(curval(2)-1)^2);

K(i,:)=i;
end
xmin = min(J(1:end-1));
xmax = max(J(1:end-1));
figure 
val=polyfit(J(1:end-1),J(2:end),1)
scatter(J(1:end-1),J(2:end),'MarkerEdgeColor',[1 1 0],...
              'MarkerFaceColor',[.9 .1 .7],...
              'LineWidth',1.5)
hold on
x = xmin:xmax;
  m=val(1); b=val(2);
 plot(x, m*x+b,'color','b')
  
xlabel('value of Jk')
ylabel('value of Jk+1')
end