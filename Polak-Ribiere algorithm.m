% clearing the work space
clear;
%input of variables
limit=input('enter the Limit of Iteration  ');
xvar=input('enter the initial values as a column vector x ');
% plotting the initial point
plot(xvar(1,1),xvar(2,1),'--gs',...
    'LineWidth',2,...
    'MarkerSize',10,...
    'MarkerEdgeColor','c',...
    'MarkerFaceColor',[0.5,0.5,0.5])
% intializing and storing the parameters
k = 0;
kstor(1,:)=0;
vstore(1,:)=evalf(xvar(1,1),xvar(2,1))
deltav(xvar)
 xmain(1,:) = xvar;
 varc='m';
% modelling the fuction 
syms x y
v=100*(y-x^2)^2+(1-x)^2
% Selecting the range of plot
[X1,Y1]= meshgrid(-2:.02:2,-2:.02:2);
zfun = @(x, y) eval(vectorize(v))
Z1=zfun(X1,Y1);
hold on;
grid on
% plotting the function
[C,h] = contour(X1,Y1,Z1,[1 5 10 100 1000 10000])
clabel(C,h,'FontWeight','bold','Color','red','FontSize',7)
% marking the minimum point
plot(1,1,'--gs',...
    'LineWidth',2,...
    'MarkerSize',10,...
    'MarkerEdgeColor','g',...
    'MarkerFaceColor',[0.5,0.5,0.5])
% Labelling the Start and Minimum points
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
% Legends, Axis titles and labels
legend(h, 'Minimum','Start point');
title('Rosenbrock function')
xlabel('X') 
ylabel('Y')
zlabel('V')
%initializing dk
dk=0;
% Algorithm
while (norm(deltav(xvar))>1e-6 )
   if k == 0
        par=xvar;
    else
        par=xmain(k,:);
   end
% Direction Function
    dk = direct2(xvar,k,dk,par);
% alpha function
    alp = alpha1(xvar,dk);
    xvar = xvar+alp*dk;
    k = k+1;
% Breaking condition
     if k > limit
         disp('could not reach convergence in the given limt')
        break
     end
      xmain(k+1,:) = xvar;
% Plotting each step
      line([xmain(k,1) xmain(k+1,1)],[xmain(k,2) xmain(k+1,2)],'LineWidth',2, ...
         'Color',varc)
% Changing color in each step
       if strcmp(varc,'m') 
             varc = 'k';
       else
             varc = 'm';
       end
% 

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