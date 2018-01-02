clear
% Read data
obs = csvread("Prob1-Obs.csv");
size_of_obs = size(obs);
m = size_of_obs(1); n = size_of_obs(2);
X = obs(:, 1:2);
y = obs(:, 3);
theta_soln = [39.93586; -0.1578447];
% J(X, y, theta_soln)

% Define domain geometry
numDivisions = 100;
Nx = numDivisions; Ny = numDivisions;
xLeft = 35; xRight = 45;
yBott = -0.2; yTop = -0.1;

xStepSize = (xRight - xLeft) / Nx;
meshX = xLeft:xStepSize:xRight;
yStepSize = (yTop - yBott) / Ny;
meshY = yBott:yStepSize:yTop;

[meshX, meshY] = meshgrid(meshX, meshY);
Z = zeros(Nx + 1, Ny + 1);
for i = 1:Nx + 1
    for j = 1:Ny + 1
        theta = [meshX(i, j); meshY(i, j)];
        Z(i, j) = J(X, y, theta);
    end
end

orange_color = [255, 99, 71] ./ 256;
darkgreen_color = [0, 100, 0] ./ 256;

% Plot the surface 
surf(meshX, meshY, Z);
title({'Surface Plot of the Cost Function J(\theta)', 'Mesh: 100\times100'});
% hold on
% plot3(39.93586, -0.1578447, 11.9718,  '.', 'MarkerSize', 10, 'Color', 'y');
% view([0, 0, 1])
% hold off

% Make the contour plot
figure
contour(meshX, meshY, Z, 50)
title({'Contour Plot of the Cost Function J(\theta)',''});
hold on
plot3(39.93586, -0.1578447, 100,  '.', 'MarkerSize', 15, 'Color', orange_color);
hold off


