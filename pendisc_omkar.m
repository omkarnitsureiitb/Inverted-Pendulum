function dx=pendisc_omkar(x,M,m,L,b,g,R0,u)
dx(1,1) = x(2);
dx(2,1) = (((u/R0)-b*x(2))*cos(x(3))+m*L*sin(x(3))*cos(x(3))*(x(4)).^2-(m+3*M/2)*g*sin(x(3)))/((m*(sin(x(3))).^2+3*M/2)*cos(x(3))) + g*sin(x(3))/cos(x(3));
dx(3,1) = x(4);
dx(4,1) = (((u/R0)-b*x(2))*cos(x(3))+m*L*sin(x(3))*cos(x(3))*(x(4)).^2-(m+3*M/2)*g*sin(x(3)))/((m*(sin(x(3))).^2+3*M/2)*L);
end