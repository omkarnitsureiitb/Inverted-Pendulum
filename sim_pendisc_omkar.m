m = 1; M = 5; L = 5; b = 1; g = 10; r = 0.5; R0 = 1.5;

tspan = 0:0.1:100;

x0 = [0; 0; 0.03; 0];

xf = [0; 0; 0; 0];

A = [0, 1, 0, 0; 0, (-2)*b/(3*M), (-2)*m*g/(3*M), 0; 0, 0, 0, 1; 0, (-2)*b/(3*M*L), (-2)*m*g/(3*M*L)-(g/L), 0];

B = [0; 2/(3*M*R0); 0; 2/(3*M*R0*L)];

Q = [1, 0, 0, 0; 0, 1, 0, 0; 0, 0, 10, 0; 0, 0, 0, 100];

R = 0.001;

K = lqr(A,B,Q,R);

[t,x] = ode45(@(t,x)pendisc_omkar(x,M,m,L,b,g,R0,-K*(x - xf)),tspan,x0);

tiledlayout(2,4)

nexttile

plot(t,x(:,1),'r')
hold on
plot(t,repmat(xf(1),length(t),1),'b')
title('position')
xlabel('t')
ylabel('l')

nexttile

plot(t,x(:,2),'r')
hold on
plot(t,repmat(xf(2),length(t),1),'b')
title('velocity')
xlabel('t')
ylabel('l-dot')

nexttile

plot(t,x(:,3),'r')
hold on
plot(t,repmat(xf(3),length(t),1),'b')
title('Angle')
xlabel('t')
ylabel('theta')

nexttile

plot(t,x(:,4),'r')
hold on
plot(t,repmat(xf(4),length(t),1),'b')
title('Angular velocity')
xlabel('t')
ylabel('theta-dot')

disp_pendisc_omkar(t,x,L)