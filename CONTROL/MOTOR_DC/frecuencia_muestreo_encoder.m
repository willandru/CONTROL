RPM= 150                     ; %Revoluciones Por Minuto
PulsosPorRevolucion= 408         ; % Pulsos Por Revolucion


RPS=RPM/60;
Tiempo_de_Revolucion= 1/RPS;


Frecuencia_Muestreo=Tiempo_de_Revolucion/PulsosPorRevolucion