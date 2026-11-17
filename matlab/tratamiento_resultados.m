%% Tratamiento y representacion de los resultados: CD, CL y CL frente a CD (Anexo II del TFG)
close all
clear all

% Flujo a nivel del mar y 20 C
Re = 783761;
mu = 1.825e-5;  % kg/m*s
rho = 1.225;    % kg/m^3
D = 1;          % m (cuerda)

% Angulos de ataque (grados)
alpha = [-8, -4, 0, 4, 8, 12, 16, 20, 24, 28, 32];
alpha1 = [-8, -4, 0, 4, 8, 12, 16, 20, 24, 28];
alpha2 = [-8, -4, 0, 4, 8, 12, 16, 20, 24];
alpha3 = [-8, -4, 0, 4, 8, 12, 16, 20];

% Velocidad del flujo para el numero de Reynolds dado (m/s)
V = (Re * mu) / (rho * D);

% Sin spoiler
Cd = [0.02083, 0.013759, 0.013091, 0.017697, 0.027893, 0.044257, 0.076982, 0.34757];
Cl = [-0.60846, -0.21029, 0.2017, 0.60795, 0.99174, 1.3148, 1.4317, 1.2199];

% Spoiler 60x10 8 grados
Cd_s1 = [0.03639, 0.03108, 0.03091, 0.03406, 0.04237, 0.05442, 0.07719, 0.36312, 0.4702, 0.536];
Cl_s1 = [-0.718, -0.39623, -0.04318, 0.33281, 0.69631, 1.0623, 1.38255, 1.4409, 1.1696, 1.013, 0.30921];
Cl_s1p = Cl_s1(1:10);

% Spoiler 60x10 15 grados
Cd_s2 = [0.04892, 0.04286, 0.04066, 0.043901, 0.0526, 0.065376, 0.087235, 0.24657, 0.43953, 0.5848];
Cl_s2 = [-0.92413, -0.58562, -0.19354, 0.19085, 0.57786, 0.94139, 1.36635, 1.3807, 1.3985, 1.508, 1.119];
Cl_s2p = Cl_s2(1:10);

% Spoiler 60x10 25 grados
Cd_s3 = [0.048, 0.0602, 0.0602, 0.06402, 0.074678, 0.08291, 0.09926, 0.42785, 0.45964];
Cl_s3 = [-1.123, -0.663, -0.29012, 0.085, 0.486, 0.8702, 1.2779, 1.4638, 1.3639];

% Spoiler 60x15 8 grados
Cd_s4 = [0.04445, 0.037, 0.03473, 0.0375, 0.0449, 0.06233, 0.084113, 0.16517, 0.17461, 0.5241];
Cd_s4p = Cd_s4(1:9);
Cl_s4 = [-0.89804, -0.5448, -0.16268, 0.22543, 0.62135, 1.0187, 1.2755, 1.685, 1.0367];

% Spoiler 60x15 15 grados
Cd_s5 = [0.05803, 0.05227, 0.04697, 0.0518, 0.063, 0.0723, 0.09079, 0.4066, 0.30727, 0.41811, 0.64124];
Cd_s5p = Cd_s5(1:10);
Cl_s5 = [-1.0907, -0.675, -0.32278, 0.08474, 0.521, 0.8997, 1.3028, 1.2595, 1.2478, 0.99888];

% Spoiler 60x15 25 grados
Cd_s6 = [0.085254, 0.083943, 0.08548, 0.08979, 0.10087, 0.10594, 0.1195, 0.4802, 0.54036];
Cl_s6 = [-1.20225, -0.7855, -0.40623, -0.01881, 0.3836, 0.764955, 1.1908, 1.406, 1.3037, 0.62137];
Cl_s6p = Cl_s6(1:9);

naranja = [1 0.5 0];
etiquetas = {'sin spoiler', '\delta = 8°, b = 10, a = 60', '\delta = 15°, b = 10, a = 60', ...
             '\delta = 25°, b = 10, a = 60', '\delta = 8°, b = 15, a = 60', ...
             '\delta = 15°, b = 15, a = 60', '\delta = 25°, b = 15, a = 60'};
texto_re = {'Re = 783761'};

%% Figura 1: CD frente a alpha
figure(1)
plot(alpha3, Cd, '-or', 'LineWidth', 0.6)
hold on
plot(alpha1, Cd_s1, '-^b', 'LineWidth', 0.6)
plot(alpha1, Cd_s2, '-pentagram', 'Color', naranja, 'LineWidth', 0.6)
plot(alpha2, Cd_s3, '-hexagramm', 'LineWidth', 0.6)
plot(alpha1, Cd_s4, '-squareg', 'LineWidth', 0.6)
plot(alpha, Cd_s5, '-*c', 'LineWidth', 0.6)
plot(alpha2, Cd_s6, '-diamondk', 'LineWidth', 0.6)
xlabel('\alpha (deg)')
ylabel('C_D')
grid on
grid minor
legend(etiquetas{:}, 'Location', 'northeastoutside')
xticks([-8, -4, 0, 4, 8, 12, 16, 20, 24, 28, 32])
xlim([-10 34])
annotation('textbox', [0.634, 0.53, 0.2, 0.1], 'String', texto_re, 'EdgeColor', 'black', 'FontSize', 10);

%% Figura 2: CL frente a alpha
figure(2)
plot(alpha3, Cl, '-or', 'LineWidth', 0.6)
hold on
plot(alpha, Cl_s1, '-^b', 'LineWidth', 0.6)
plot(alpha, Cl_s2, '-pentagram', 'Color', naranja, 'LineWidth', 0.6)
plot(alpha2, Cl_s3, '-hexagramm', 'LineWidth', 0.6)
plot(alpha2, Cl_s4, '-squareg', 'LineWidth', 0.6)
plot(alpha1, Cl_s5, '-*c', 'LineWidth', 0.6)
plot(alpha1, Cl_s6, '-diamondk', 'LineWidth', 0.6)
xlabel('\alpha (deg)')
ylabel('C_L')
grid on
grid minor
legend(etiquetas{:}, 'Location', 'northeastoutside')
xticks([-8, -4, 0, 4, 8, 12, 16, 20, 24, 28, 32])
xlim([-10 34])
annotation('textbox', [0.634, 0.53, 0.2, 0.1], 'String', texto_re, 'EdgeColor', 'black', 'FontSize', 10);

%% Figura 3: CL frente a CD
figure(3)
plot(Cd, Cl, '-or', 'LineWidth', 0.6)
hold on
plot(Cd_s1, Cl_s1p, '-^b', 'LineWidth', 0.6)
plot(Cd_s2, Cl_s2p, '-pentagram', 'Color', naranja, 'LineWidth', 0.6)
plot(Cd_s3, Cl_s3, '-hexagramm', 'LineWidth', 0.6)
plot(Cd_s4p, Cl_s4, '-squareg', 'LineWidth', 0.6)
plot(Cd_s5p, Cl_s5, '-*c', 'LineWidth', 0.6)
plot(Cd_s6, Cl_s6p, '-diamondk', 'LineWidth', 0.6)
xlabel('C_D')
ylabel('C_L')
grid on
grid minor
legend(etiquetas{:}, 'Location', 'northeastoutside')
xlim([-0.05 0.65])
annotation('textbox', [0.634, 0.53, 0.2, 0.1], 'String', texto_re, 'EdgeColor', 'black', 'FontSize', 10);
