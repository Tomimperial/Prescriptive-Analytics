clear;
colsel=1
% Input the variables
limit=input('enter the Limit of Iteration  ');
xvar=input('enter the initial values as a column vector x ');
% Indicating the initialpoint
plot(xvar(1,1),xvar(2,1),'--gs',...
    'LineWidth',2,...
    'MarkerSize',10,...
    'MarkerEdgeColor','c',...
    'MarkerFaceColor',[0.5,0.5,0.5])
% Initializing the Variables
k = 0;
kstor(1,:)=0;
vstore(1,:)=evalf(xvar(1,1),xvar(2,1))
deltav(xvar)
 xmain(1,:) = xvar;
 u = eye(2);
xvar1 = u(:,1)+xvar;
xvar2 = u(:,2)+xvar;
 varc='k';
%  Defining the function
syms x y
v=100*(y-x^2)^2+(1-x)^2;
% Defining the function plot limits
[X1,Y1]= meshgrid(-2:.002:2,-2:.002:2);
zfun = @(x, y) eval(vectorize(v));
Z1=zfun(X1,Y1);
hold on;
grid on;
% Plotting the level set
[C,h] = contour(X1,Y1,Z1,[1 5 10 100 1000 10000])
clabel(C,h,'FontWeight','bold','Color','red','FontSize',7)
% indicating the minima
plot(1,1,'--gs',...
    'LineWidth',2,...
    'MarkerSize',10,...
    'MarkerEdgeColor','g',...
    'MarkerFaceColor',[0.5,0.5,0.5])
% Legends
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
% Title & Labels
title('Rosenbrock function')
xlabel('X')
ylabel('Y')
zlabel('V')


% Optimization Algorithm
xa=xvar;
xb= xvar1;
xc=xvar2;

  line([xa(1) xb(1)],[xa(2) xb(2)],'LineWidth',2, ...
         'Color',[1 .2 .4]);
      line([xb(1) xc(1)],[xb(2) xc(2)],'LineWidth',2, ...
         'Color',[1 .2 .4]);
       line([xc(1) xa(1)],[xc(2) xa(2)],'LineWidth',2, ...
         'Color',[1 .2 .4]);

while (stand(xa,xb,xc)>1e-30 )
    k = k+1;
    if k > limit
         disp('could not reach convergence in the given limt')
        break
     end
    [xa,xb,xc]=sort1(xa,xb,xc)
    xat=reflection(xa,xb,xc);
    
        if evalf(xat(1),xat(2))<evalf(xc(1),xc(2))
            
         
            xa= expansion1(xa,xb,xc,xat);
            
             
        else if evalf(xat(1),xat(2))<evalf(xb(1),xb(2))
                   
                        xa = xat ; 
                        
               
            else
                 if evalf(xat(1),xat(2))<evalf(xa(1),xa(2))   
                xd=contractiono(xat,xb,xc)
                    if evalf(xd(1),xd(2))<evalf(xa(1),xa(2))  
                        xa=xd;
                        
                    else
                         [xa,xb,xc]=shrink(xa,xb,xc);
                          
                    end
                 else
                 xd = contractioni(xa,xb,xc)
                    if evalf(xd(1),xd(2))<evalf(xa(1),xa(2))  
                        xa=xd;
                         
                    else
                        [xa,xb,xc]=shrink(xa,xb,xc);
                        
                    end
                end
          evalf(xa(1),xa(2))
           xa=xd;
           evalf(xa(1),xa(2))
            end 
        end
        
  
  % Plotting each step
       line([xa(1) xb(1)],[xa(2) xb(2)],'LineWidth',2, ...
         'Color',varc);
      line([xb(1) xc(1)],[xb(2) xc(2)],'LineWidth',2, ...
         'Color',varc);
       line([xc(1) xa(1)],[xc(2) xa(2)],'LineWidth',2, ...
         'Color',varc);

% Changing step color
       switch colsel
           case 1
               varc = 'b'
               colsel = 2
           case 2
               varc = 'm'
               colsel = 3
           case 3
               varc = [0 .2 0]
               colsel = 4
           case 4
               varc = [.6 0 0]
               colsel = 5
           case 5
               varc = 'k'
               colsel = 1
       end
       [xate,xbte,xcte]=sort1(xa,xb,xc)
       xmain(k+1,:) = xcte;
 kstor(k+1,:)=k+1;
vstore(k+1,:)=evalf(xcte(1),xcte(2));
        end 

  xa
    
% Plotting the graph
figure 
plot (kstor,vstore,'LineWidth',2)
xlabel('Number of iterations') % x-axis label
ylabel('Value of Function')
title('Covergence of Algorithm')
xvar, k
xmain    
   
    