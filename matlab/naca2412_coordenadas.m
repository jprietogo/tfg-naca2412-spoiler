%% Coordenadas del perfil NACA 2412 (Anexo I del TFG)
close all
clear all

%% Datos del perfil NACA 2412
m = 2;    % Porcentaje curvatura maxima (primer digito)
p = 4;    % Posicion de la curvatura maxima (segundo digito)
XX = 12;  % Porcentaje de espesor maximo (ultimos dos digitos)
L = 1;    % Longitud de cuerda (en metros)
d = 100;  % Numero de divisiones sobre la cuerda (cantidad de puntos)

%% Calculo de los parametros
t = L * XX / 100;  % Espesor maximo como fraccion de la cuerda
M = m / 100;       % Curvatura maxima como fraccion de la cuerda
P = p / 10;        % Posicion de la curvatura maxima como fraccion de la cuerda

% Coeficientes para el espesor
a0 = 0.2969;
a1 = -0.1260;
a2 = -0.3516;
a3 = 0.2843;
a4 = -0.1015;  % Borde de salida abierto (con -0.1036 el contorno seria cerrado)

% Funcion del espesor del perfil
Yt = @(x) (t / 0.2) * (a0 * sqrt(x) + a1 * x + a2 * x.^2 + a3 * x.^3 + a4 * x.^4);

%% Calculo de las coordenadas del perfil
x = linspace(0, L, d+1);   % Coordenadas en x a lo largo de la cuerda
yc = zeros(1, d+1);        % Coordenadas en y de la linea media
dycdx = zeros(1, d+1);     % Derivada de yc

for i = 1:length(x)
    if x(i) < P * L
        yc(i) = (M / P^2) * (2 * P * (x(i)/L) - (x(i)/L)^2);
        dycdx(i) = (2 * M / P^2) * (P - x(i)/L);
    else
        yc(i) = (M / (1 - P)^2) * ((1 - 2 * P) + 2 * P * (x(i)/L) - (x(i)/L)^2);
        dycdx(i) = (2 * M / (1 - P)^2) * (P - x(i)/L);
    end
end

theta = atan(dycdx);  % Angulo del gradiente en cada punto

% Coordenadas superiores (xu, yu) e inferiores (xl, yl)
xu = x - Yt(x) .* sin(theta);
yu = yc + Yt(x) .* cos(theta);

xl = x + Yt(x) .* sin(theta);
yl = yc - Yt(x) .* cos(theta);

%% Preparar las columnas para guardar
% Invertir las coordenadas superiores para que x vaya de 1 a 0
xu = flip(xu);
yu = flip(yu);

% Concatenar las coordenadas
x_combined = [xu, xl]';  % Combina x_upper (1 a 0) y luego x_lower (0 a 1)
y_combined = [yu, yl]';  % Combina y_upper y luego y_lower

%% Guardar los datos en un archivo .txt
filename = 'NACA2412_coordenadas.txt';
fileID = fopen(filename, 'w');

% Encabezado
fprintf(fileID, '%% Coordenadas NACA 2412\n');

% Escribir coordenadas
for i = 1:length(x_combined)
    fprintf(fileID, '%.5f\t%.5f\n', x_combined(i), y_combined(i));
end

fclose(fileID);
