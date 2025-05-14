function [GTData, MData] = load_simulation_data()
GT = load('data/Ground_Truth_data.mat');
MD = load('data/Measurement_data.mat');
GTData = GT.GTData;
MData = MD.MData;
end
