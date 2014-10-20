%% Clean up
close all;
clear all;
clc;
format long;


%% Numerics
N = 1000;                   % Dimensionality of the discretized x.
n = 25;                     % Quantum number.
E = n + 1/2;                % Energy of the QM oscillator.
x = linspace(-E/3,E/3,N);   % x values.


%% Computing the quantum oscillator PDF
% Wavefunction squared for the quantum case with energy E_n.
quantum = 1/pi^(1/4)*1/(sqrt(2^n*factorial(n))).*HermitePolynomial(n,x).*exp(-x.^2/2);
quantum = quantum.*quantum;


%% Computing the classical PDF
% Probability density function for the classical case with energy E=E_n.
classical = 1 ./ pi .* 1 ./ sqrt(2*(E-x.^2./2));


%% Plot the PDFs
% Plotting the two on top of eachother. The plot is arbitrarily truncated 
% in the y-direction at 1.2*max(quantum PDF).
figure(1);
hold  ('on');
plot  (x, classical, 'b-');
plot  (x, quantum,                       'r-');
axis  ([min(x) max(x) min(quantum) max(quantum)*1.2]);
xlabel('Spatial coordinate, x [arbitrary units]');
ylabel('Probability density, [dimensionless]');
legend('Classical probability density', ...
       'Quantum probability density, |\psi|^2');

