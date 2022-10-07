function disp_pendisc_omkar(t,x,L)

pos = x(1,1);

theta = x(3, 1);

%Disc
R0 = 1.5;
Px = pos;

%pendulum
r = 0.5;
px = pos + L*sin(theta);
py = R0 + L*cos(theta);

figure()

plot([-10 10],[0 0],'k','LineWidth',2)
hold on

h1 = rectangle('Position',[Px-R0, 0, 2*R0, 2*R0],'Curvature',[1 1],'FaceColor',[1 1 0],'EdgeColor',[0 0 0]);

h2 = plot([Px+R0*sin(theta) px],[R0*(1+cos(theta)) py],'k','LineWidth',1);

h3 = rectangle('Position',[px-r, py-r, 2*r, 2*r],'Curvature',[1 1],'FaceColor',[1 0 1],'EdgeColor',[0 0 0]);

xlim([-5 15]);
ylim([-10 10]);

set(gca,'Color','w')
set(gcf,'Color','w')

Button = uicontrol("Style",'pushbutton','String','End','Callback','delete(gcbf)');

for k = 1:length(t)
    set(h1,'position',[Px-R0, 0, 2*R0, 2*R0]);
    set(h2,'XData',[Px+R0*sin(theta) px],'YData',[R0*(1+cos(theta)) py]);
    set(h3,'position',[px-r, py-r, 2*r, 2*r]);
    drawnow();

    if ~ishandle(Button)
        break;
    end
end