% to clear all the memory
clear;
% input iterations
limit=input('enter the Limit of Iteration  ');
xvar=input('enter the initial values as a column vector x ');
% highlighting the final point
figure
plot(xvar(1,1),xvar(2,1),'--gs',...
    'LineWidth',2,...
    'MarkerSize',10,...
    'MarkerEdgeColor','c',...
    'MarkerFaceColor',[0.5,0.5,0.5])
k = 0;
% Storing the initial values
kstor(1,:)=0;
vstore(1,:)=evalf(xvar(1,1),xvar(2,1))
deltav(xvar)
 xmain(1,:) = xvar;
 varc='m';
%  modelling the function
syms x y
v=100*(y-x^2)^2+(1-x)^2
% Defining the range of plot
[X1,Y1]= meshgrid(-2:.02:2,-2:.02:2);
zfun = @(x, y) eval(vectorize(v))
Z1=zfun(X1,Y1);
% plotting the function 
%mesh(X1,Y1,Z1,'FaceAlpha',.001,'FaceColor',[1 0 0],'edgecolor',[.9 .9 1])
hold on;
grid on
%plotting the level set
[C,h] = contour(X1,Y1,Z1,[1 5 10 100 1000 10000])
clabel(C,h,'FontWeight','bold','Color','red','FontSize',7)
% Highlighting the initial point
plot(1,1,'--gs',...
    'LineWidth',2,...
    'MarkerSize',10,...
    'MarkerEdgeColor','g',...
    'MarkerFaceColor',[0.5,0.5,0.5])
% Legend of the points 
h(1) =plot(NaN,NaN,'--gs',...
    'LineWidth',2,...
    'MarkerSize',10,...
    'MarkerEdgeColor','g',...
    'MarkerFaceColor',[0.5,0.5,0.5])
h(2) =plot(NaN,NaN,'--cs',...
    'LineWidth',2,...
    'MarkerSize',10,...
    'MarkerEdgeColor','c',...
    'MarkerFaceColor',[0.5,0.5,0.5])
% Labelling the plot
legend(h, 'Minimum','Start point');
title('Rosenbrock function')
xlabel('X') 
ylabel('Y')
zlabel('V')
% Algorithm
while (norm(deltav(xvar))>1e-6 )% checking if its near minimum
    dk = direct1(xvar);% calling the direction function
    alp = alpha1(xvar,dk);
    xvar = xvar+alp*dk;

    k = k+1;
    
     if k > limit
         disp('could not reach convergence in the given limt')
        break
     end
      xmain(k+1,:) = xvar;
% plotting each jump with iteration
      line([xmain(k,1) xmain(k+1,1)],[xmain(k,2) xmain(k+1,2)],'LineWidth',2, ...
         'Color',varc)
%   Changing color of each jump
       if strcmp(varc,'m') 
             varc = 'k';
       else
             varc = 'm';
       end
% storing the function values and K values

kstor(k+1,:)=k+1;
vstore(k+1,:)=evalf(xmain(k+1,1),xmain(k+1,2));

end
figure 
plot (kstor,vstore,'LineWidth',2)
xlabel('Number of iterations') % x-axis label
ylabel('Value of Function')
title('Covergence of Algorithm')
 xvar, k
xmain