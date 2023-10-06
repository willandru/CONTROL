clc, clear, close all;
datos = readtable('recortado.xlsx');

tiempo = datos.xaxis; % First column
amplitud = datos.amplitud; % Second column



amplitud_normalizados = normalize(amplitud, 'range');
tiempo_normalizados = normalize(tiempo, 'range');


plot( amplitud_normalizados )