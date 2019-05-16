clear;% input conditions from the user
limit=input('enter the Limit of Iteration  ');
xvar=input('enter the initial values as a column vector x ');
% marking the initial point
plot(xvar(1,1),xvar(2,1),'--gs',...
    'LineWidth',2,...
    'MarkerSize',10,...
    'MarkerEdgeColor','c',...
    'MarkerFaceColor',[0.5,0.5,0.5])
% initializing and storing initial values
k = 0;
kstor(1,:)=0;
vstore(1,:)=evalf(xvar(1,1),xvar(2,1))
deltav(xvar)
 xmain(1,:) = xvar;
 varc='m';
% Function Level set plots
syms x y
v=100*(y-x^2)^2+(1-x)^2
[X1,Y1]= meshgrid(-2:.002:2,-2:.002:2);
zfun = @(x, y) eval(vectorize(v));
Z1=zfun(X1,Y1);
p = [1,1];
hold on;
grid on
[C,h] = contour(X1,Y1,Z1,[1 5 10 100 1000 10000])
clabel(C,h,'FontWeight','bold','Color','red','FontSize',7)
% Labelling the plots points 
plot(1,1,'--gs',...
    'LineWidth',2,...
    'MarkerSize',10,...
    'MarkerEdgeColor','g',...
    'MarkerFaceColor',[0.5,0.5,0.5])
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
legend(h, 'Minimum','Start point');
% title and Axis labels
title('Rosenbrock function')
xlabel('X') 
ylabel('Y')
zlabel('V')
% Optimization Algorithm

while (norm(deltav(xvar))>1e-6 )
    tic
    dk = -deltav(xvar);
    alp = alpha1(xvar,dk);
    xvar = xvar+alp*dk;
   
    k = k+1;
    
     if k > limit
         disp('could not reach convergence in the given limt')
        break
     end
      xmain(k+1,:) = xvar;
      % plotting the points of each iteration
      
      line([xmain(k,1) xmain(k+1,1)],[xmain(k,2) xmain(k+1,2)],'LineWidth',2, ...
         'Color',varc)
     % changing colors with each iteration

       if strcmp(varc,'m') 
             varc = 'k';
       else
             varc = 'm';
       end
    % storing the values of each iteration

kstor(k+1,:)=k+1;
vstore(k+1,:)=evalf(xmain(k+1,1),xmain(k+1,2));
tstore(k+1,:)=toc;

end
% plotting the convergence curve
figure 
plot (kstor,vstore,'LineWidth',2)
xlabel('Number of iterations') % x-axis label
ylabel('Value of Function')
title('Covergence of Algorithm')
