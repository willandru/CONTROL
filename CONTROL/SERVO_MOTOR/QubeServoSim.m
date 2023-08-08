clear all 
close all
%% Parametros Generales del Integrador Numero 
Tin=0.1e-3;
Tsim=10;
rad2deg=180/pi;
%% Parametros del Proceso
Proceso.Km=0.036; %% [V/(rad/s)] Costante del Motor.
Proceso.J=2.09e-5; %% [Kgm^2] Inercia Total
Proceso.R=6.3; %% [OMS] Resistencia
Proceso.L=0.85e-3; %% [H] Inductancia 
Proceso.X0.theta=0; %%[rad] Condicion Inicial
Proceso.X0.omg=0; %%[rad/s] Condicion Inicial
Proceso.X0.im=0; %% [A] COndicion Inicial
%% Parametros del Enconder
Proceso.encoder.dQ=(2*pi)/2048;  %% [rad] Error de Cuantizacion del Encoder. 
Proceso.encoder.gain=2048/(2*pi); %% [Cuentas/rad] Ganancia del Encoder
Proceso.sensor.error.mean=0; %% [rad] Error de Bias
Proceso.sensor.error.std=10*Proceso.encoder.dQ/3; %% [rad] Error de Medida Asumido 10 Veces mas que la Cuantizacion
Proceso.sensor.error.seed=564606431; %% Semilla Para la Generacion de los Numeros Aleatorios. 
Proceso.sensor.NF=0; %% Agrega los Errors de Medida. 
%% Parametros del Amplificador.
Proceso.VinUP=10; %% [V] Voltaje de Saturacion a la Entrada
Proceso.VinDOWN=-10; %% [V] Voltaje de Saturacion a la Entrada
%% Parametros de la Perturbancion 
Disturbance.select=2; %% Seleciona el Tipo de Perturbacion 0=Paso/1=Sinosoidal/2=Perturbacion Estocastica. 
Disturbance.step.time=5; %% [s] Tiempo del Paso
Disturbance.step.initialvalue=0;  %% [N] Valor del inicial Paso de la Perturbacion
Disturbance.step.finalvalue=0.015;    %% [N] Valor del final Paso de la Perturbacion
Disturbance.sin.amplitude=0.005;      %% [N] Amplitud de la  Perturbacion Sinosoidal. 
Disturbance.sin.bias=0;           %% [N] Bias de la  Perturbacion Sinosoidal.     
Distrubance.sin.omg=2*pi/5;            %% [rad/s] Frecuencia de la Perturbacion Sinosoidal
Disturbance.Forder.mean=0;         %% [N] Valor medio de la Perturbacion Aleatoria. 
Disturbance.Forder.std=0.015/3;          %% [N] Desviacion Estandar de la Perturbacion Aleatoria.
Disturbance.Forder.Seed=6548421;  %%  Semilla de la Generacion Aleatoria. 
Disturbance.bw=5;                 %% Ganancia Modelo de la Perturbacion Aleatoria. 
Disturbance.DF=0; %% Agrega la Perturbacion al Simulador
CloseLoopFlag=0; %% 1= Simulador Corre en Lazo Cerrado (Control PD Quanser) / 0= Simulador Corre en Lazo Abierto.
StudentID=00; %% Ultimos 2 Digitos del Codigo del Estudiante 
%% Ejecutar Simulador
Decimation= 1; %% Decimacion de los Datos del Simulador
options=simset('decimation',Decimation,'solver','ode4','FixedStep',Tin,'OutputVariables','ty');
var=input('Ejecutar Simulador [s/n]','s');
if(strcmp(var,'s'))
disp('El Simulador Esta Corriendo');
if Proceso.sensor.NF==1
disp('Los Errores de Medida Estan Presentes');
else
disp('Los Errores de Medida no Estan Presentes');
end
if Disturbance.DF==1
disp('Las Perturbaciones Estan Presentes');
if Disturbance.select==0
disp('La Perturbacion es Torque Tipo Paso');   
end
if Disturbance.select==1
disp('La Perturbacion es un Torque Sinosoidal');   
end
if Disturbance.select==2
disp('La Perturbacion es una Perturbacion Aleatoria');   
end
else
disp('Las Perturbaciones No Estan Presentes');
end

disp ('Por Favor Espere');
tic;
sim('QubeServoSimSK');
time=toc;
message=['Duracion de la Simulacion:=',num2str(time)];
disp(message);
Simulationdate=datestr(now);
save SimOut
end
%% Configuracion de Graficas
set(0,'DefaultFigureWindowStyle','docked')
set(0,'defaultLineLinewidth',2);
%% Graficar Datos 
var=input('Cargar Datos [s/n]','s');
if(strcmp(var,'s'))
load SimOut
end
disp(['Fecha de la Simulacion =>',Simulationdate,'<=']);
figure
stairs(Proceso_X.time,Proceso_X.signals.values(:,1)*rad2deg,'b',LineWidth=2);
if CloseLoopFlag==1
    hold on 
    stairs(Proceso_Ref.time,Proceso_Ref.signals.values(:,1)*rad2deg,'r',LineWidth=2);
end
title('Angulo del Disco');
ylabel('Angulo -[Deg]');
xlabel('Tiempo');
grid on 
%%
figure
stairs(Proceso_X.time,Proceso_X.signals.values(:,2),'r',LineWidth=2);
title('Velocidad Angular Disco');
ylabel('Velocidad Angular -[rad/s]');
xlabel('Tiempo');
grid on 

figure
stairs(Proceso_X.time,Proceso_X.signals.values(:,3),LineWidth=2);
title('Corriente del Motor');
ylabel('Corriente -[A]');
xlabel('Tiempo');
grid on 

figure
stairs(Proceso_Vin.time,Proceso_Vin.signals.values(:,1),LineWidth=2);
title('Voltaje Aplicado al Motor');
ylabel('Voltios -[V]');
xlabel('Tiempo');
grid on 


figure
stairs(Proceso_Te.time,Proceso_Te.signals.values(:,1),LineWidth=2);
title('Torque Electrico');
ylabel('Torque -[N]');
xlabel('Tiempo');
grid on 


figure
stairs(Sensor_y.time,Sensor_y.signals.values,LineWidth=2);
title('Angulo Medido Por el Sensor');
ylabel('Angulo -[Rad]');
xlabel('Tiempo');
grid on 

%%

if Disturbance.DF==1
figure
stairs(Disturbance_Td.time,Disturbance_Td.signals.values(:,1),'r',LineWidth=2);
hold on 
stairs(Disturbance_Td.time,Disturbance_Td.signals.values(:,2),'g',LineWidth=2);
stairs(Disturbance_Td.time,Disturbance_Td.signals.values(:,3),'b',LineWidth=2);
stairs(Disturbance_ATd.time,Disturbance_ATd.signals.values(:,1),'k',LineWidth=2);
title('Perturbaciones');
ylabel('Torque -[N]');
xlabel('Tiempo');
legend('Paso','Sinosoidal','Aleatoria','Actuando sobre el Proceso');
grid on 
end

