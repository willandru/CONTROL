clc, clear, close all; 

datos_2= load("Cuadrada A 2 frec 0,4.mat");
datos_3= load("Cuadrada A 3 frec 0,4.mat");
datos_5= load("Cuadrada A 5 frec 0,4.mat");



time_A2=datos_2.Cuadrada_A_2_frec_0_4_Time(:,1);
value_A2=datos_2.Cuadrada_A_2_frec_0_4_Value(:,1);


time_A3=datos_3.Cuadrada_A_3_frec_0_4_Time(:,1);
value_A3=datos_3.Cuadrada_A_3_frec_0_4_Value(:,1);

time_A5=datos_5.Cuadrada_A_5_frec_0_4_Time(:,1);
value_A5=datos_5.Cuadrada_A_5_frec_0_4_Value(:,1);


time_A2=time_A2-time_A2(1);
time_A3=time_A3-time_A3(1);
time_A5=time_A5-time_A5(1);

T_A2=time_A2(419:460);
V_A2=value_A2(419:460);

T_A3=time_A3(607:652);
V_A3=value_A3(607:652);

T_A5=time_A5(317:358);
V_A5=value_A5(317:358);

T_A2=T_A2-T_A2(1);
T_A3=T_A3-T_A3(1);
T_A5=T_A5-T_A5(1);

%CALCULAMOS LA AMPLITUD

V_A2=normalize(V_A2, 'range', [0, 1]);
V_A3=normalize(V_A3, 'range', [0, 1]);
V_A5=normalize(V_A5, 'range', [0, 1]);


figure(1)

subplot(3,1,1)
plot(T_A2, V_A2)
hold on
plot( T_A2(11), V_A2(11), 'ro')
title('Señal Amplitud 2V')
xlabel('Tiempo [s]')
ylabel('% Amplitud')

subplot(3,1,2)
plot(T_A3, V_A3)
hold on
plot( T_A3(11), V_A3(11), 'ro')
title('Señal Amplitud 3V')
xlabel('Tiempo [s]')
ylabel('% Amplitud')

subplot(3,1,3)
plot(T_A5, V_A5)
hold on
plot( T_A5(10), V_A5(10), 'ro')
title('Señal Amplitud 5V')
xlabel('Tiempo [s]')
ylabel('% Amplitud')

sgtitle('TAU = 0.1 s')

disp(['El TAO 1 es: ', num2str(T_A2(11)) ]);
disp(['El TAO 2 es: ', num2str(T_A3(11))]);
disp(['El TAO 3 es: ', num2str(T_A5(10))]);
