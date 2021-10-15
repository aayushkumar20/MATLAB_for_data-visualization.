clear all
close all
clc

t = linspace(0, 2*pi, 100);
x = 5*cos(t);
y = 2*sin(t);
z = t; 

figure,
for i = 1:length(t)
    clf
    t_i = t(i);
    x_i = x(i);
    y_i = y(i);
    z_i = z(i);
    
    % Plot each location with markers ---
    plot3(x_i, y_i, z_i, 'go', 'LineWidth', 3, 'MarkerSize', 15);
    hold on
    % Plot the entire data --
    plot3(x, y, z, 'k-', 'LineWidth', 2);
    
    % Define labels --
    xlabel('X')
    ylabel('Y')
    zlabel('Z')
    title(['Location at t = ', num2str(t_i), 'Seconds']);
%     pause(0.1)
%     drawnow
    MovieVec(i) = getframe;
end

%% Save your Animation Video
MyWriter = VideoWriter('MyAnimation');
MyWriter.FrameRate = 20;

open(MyWriter);
writeVideo(MyWriter, MovieVec);
close(MyWriter)
