function plot_estimation_results(t, GTData, x_hat)
gt_states = GTData(:, 2:4);
labels = {'Position (m)', 'Velocity (m/s)', 'Acceleration (m/s^2)'};
titles = {'Vehicle Position', 'Vehicle Velocity', 'Vehicle Acceleration'};

for i = 1:3
    figure;
    plot(t, gt_states(:, i), 'k', 'LineWidth', 2); hold on;
    plot(t, x_hat(:, i), 'r--', 'LineWidth', 2);
    grid on;
    xlabel('Time (s)');
    ylabel(labels{i});
    title(titles{i});
    legend('Ground Truth', 'Estimated');
end
end
