% main.m - Vehicle State Estimation using Generalized High-Gain Observer
clear; clc; close all;

%% Load Parameters
params = load_vehicle_params();

%% Load and Preprocess Data
[GTData, MData] = load_simulation_data();
[tspan, y, u, ego_speed] = preprocess_data(GTData, MData);

%% Design Generalized High-Gain Observer
sys = design_observer(params, tspan, y);

%% Run Observer Simulation
X0 = zeros(3, 1);  % Initial state estimates
[t, X] = ode45(@(t, X) HighGainObserver(t, X, sys, y, u, tspan, params.limits), tspan, X0);

%% Post-process and Adjust Relative to Ego Vehicle
estimated_states = postprocess_estimation(X, ego_speed, params.vehicle_distance_to_cg);

%% Plot Estimation Results
plot_estimation_results(t, GTData, estimated_states);
