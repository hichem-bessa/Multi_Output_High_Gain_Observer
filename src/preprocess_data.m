function [tspan, y, u, ego_speed] = preprocess_data(GTData, MData)
tspan = GTData(:, 1);
y = [MData(:, 2), MData(:, 3)];  % [position, speed]
u = GTData(:, 7);
ego_speed = GTData(:, 5);
end
