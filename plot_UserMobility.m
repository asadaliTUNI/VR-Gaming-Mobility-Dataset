clear all

user_number = 1; % Select user number

%---------load data------------------
file_name = [num2str(user_number) '.csv'];
file_path = [pwd '\VRGamingMobility\'];
file = [file_path file_name];
opts = detectImportOptions(file);

data   = readmatrix(file,opts);
t_Stmp = data(:,1);

X_axis = data(:,2);
Y_axis = data(:,3);
Z_axis = data(:,4);
yaw    = data(:,5);
pitch  = data(:,6);
roll   = data(:,7);


% [length(t_Stmp),length(c),length(X_axis),length(Y_axis),length(Z_axis),length(yaw)]
%---------make figures------------------
figure(1);clf(1);
title('User lateral movement over time')
c=(t_Stmp(1):(t_Stmp(end)-t_Stmp(1))/(length(t_Stmp)-1):t_Stmp(end))./60;
colormap(hsv)
patch(X_axis,Y_axis,Z_axis,c,'FaceColor','none','EdgeColor','interp')
colorbar
grid on
view(3)
xlabel("X [m]")
zlabel("Z [m]")
ylabel("Y [m]")
c1 = colorbar;
c1.Label.String = 'time [min]';
axis equal
xlim([-1 1])
ylim([-1 1])
zlim([0 2])
caxis([0 5])

figure(2);clf(2);
title('User angular movement over time')
colormap(jet(256)); 
surface('XData',  [yaw(:) yaw(:)],'YData',[-pitch(:) -pitch(:)],...
        'ZData',0*[yaw(:) yaw(:)],'CData',[c(:) c(:)],'EdgeColor','flat');
c2 = colorbar;
xlabel("Yaw [deg]")
ylabel("Pitch [deg]")
axis equal
xlim([-180 180])
ylim([-90 90])
c2.Label.String = 'time [min]';
caxis([0 5])


    
