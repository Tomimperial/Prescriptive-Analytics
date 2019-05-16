
% Defining the function  test function is the so-called Rosenbrock function, i.e.

% v(x, y) = 100(y ? x^2)^2 + (1 ? x)^2

syms x y

v=100*(y-x^2)^2+(1-x)^2

% defining the range of X & Y to be plotted

[X1,Y1]= meshgrid(-2:.002:2,-2:.002:2);
zfun = @(x, y) eval(vectorize(v))
Z1=zfun(X1,Y1);
p = [1,1];

% For function
colormap summer
[X2,Y2]= meshgrid(-2:.2:2,-2:.2:2);
zfun = @(x, y) eval(vectorize(v))
Z2=zfun(X2,Y2);
p = [1,1];


% plotting the fuction

surf(X2,Y2,log(Z2))
hold on;
grid on

% Plotting the contour

[C,h] = contour(X1,Y1,Z1,[1 5 10 50 100 500 1000])
clabel(C,h,'FontWeight','bold','Color','red','FontSize',7)

% Labelling the minimum

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

legend(h, 'Minimum');

% Axis labels & Title

title('Rosenbrock function')

xlabel('X')
ylabel('Y')
zlabel('V')
