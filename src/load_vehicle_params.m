function params = load_vehicle_params()
params.m = 1845;
params.To = 0.9;
params.Kd = 0.5;
params.dm = 100;
params.vehicle_distance_to_cg = 1.8;

params.n = 3;
params.A = [zeros(2,1), eye(2); zeros(1,3)];
params.B = [0; 0; 1];
params.C = [1, 0, 0];
z1max= 45;
z2max= 12;
z3max= 3;
params.limits={[-z1max,z1max],[-z2max,z2max],[-z3max,z3max]};
end
