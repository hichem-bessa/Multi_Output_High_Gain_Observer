function x_hat = postprocess_estimation(X, ego_speed, vehicle_length)
x_hat = X(:, 1:3);
x_hat(:, 1) = x_hat(:, 1) + vehicle_length;
x_hat(:, 2) = x_hat(:, 2) + ego_speed;
end
