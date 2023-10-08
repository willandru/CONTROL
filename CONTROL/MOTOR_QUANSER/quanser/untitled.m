clc, clear, close all;

% Carga el archivo MAT
datos= load("Cuadrada A 2 frec 0,4.mat");

% Supongamos que los datos cargados se almacenan en una variable llamada "datos"
% Puedes acceder a la primera columna de "datos" de la siguiente manera:
primera_columna = datos(:, 1);


senal = datos.Cuadrada_A_2_frec_0_4_Value  ;


figure(1)
plot (senal)

