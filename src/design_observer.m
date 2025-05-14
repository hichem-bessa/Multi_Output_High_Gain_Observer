function sys = design_observer(params, tspan, y)
n = params.n;
a = params.A;
b = params.B;
c = params.C;
sigma = 1;
lambda = 1;

% Vertices for Psi
APsi1 = [0, 22*sigma, 0];
APsi2 = [0, -22*sigma, 0];

% LMI Variables
P = sdpvar(n, n);
Y = sdpvar(1, n);
Z = sdpvar(1, n);
Xi = sdpvar(1);

M1 = [a'*P + P*a - c'*Y - Y'*c - APsi1'*Z - Z'*APsi1 + lambda * eye(n), Y';
      Y, -Xi];
M2 = [a'*P + P*a - c'*Y - Y'*c - APsi2'*Z - Z'*APsi2 + lambda * eye(n), Y';
      Y, -Xi];

const = [M1 <= 0; M2 <= 0; P >= 0; Z >= 20];
diagnostic = optimize(const, []);

if diagnostic.problem ~= 0
    error("LMI not solved");
end

% Extract gains
sys.K = value(P) \ value(Y)';
sys.M = value(P) \ value(Z)';

% Lipschitz gain calculation
syms z1 z2 z3
f_sym = 2*params.Kd/params.m*z2*z3 - 1/params.To*(z3 + params.Kd/params.m*z2^2 + params.dm/params.m);
J = jacobian(f_sym, [z1, z2, z3]);
f_handle = matlabFunction(norm(J), 'Vars', {z1, z2, z3});
L = f_handle(45, 12, 3);

% Lipschitz for h
h_sym = z2;
Jh = jacobian(h_sym, [z1, z2, z3]);
h_handle = matlabFunction(norm(Jh), 'Vars', {z1, z2, z3});
k_h = h_handle(45, 12, 3);

% Compute theta and adjust gains
Theta0 = max(2 * L * max(eig(value(P))) / lambda, 1);
Theta=5;
T = diag(Theta .^ (1:n));

sys.A = a;
sys.B = b;
sys.C = c;
sys.na = n;
sys.bb = b / (params.m * params.To);
sys.f = @(z) 2*params.Kd/params.m*z(2)*z(3) - 1/params.To*(z(3) + params.Kd/params.m*z(2)^2 + params.dm/params.m);
sys.T = T;
end
