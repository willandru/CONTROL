clear all 
close all 

%% Parametros del Simulador
Ts=100e-3
Tsim=60; 

%% Torque Generado por el Motor 

Tm=200; %% Torque maximo Generado por el Motor [Nm]
Beta=0.4;
Omgm=418.87; %%[rad/s] => 4000 RPM
omg=0:1:Omgm*(1+sqrt(1/Beta));
T=Tm*(1-Beta*(omg/Omgm-1).^2); %% Calcula El Torque del Motor 
plot(omg,T)
grid on 
xlabel('Velocidad Angular del Motor $\omega$ [rad/s]','Interpreter','latex')
ylabel('Torque del Motor $\tau$ [Nm]','Interpreter','latex')

r=30e-2 %% Radio de una llanta 

alfn=[40,25,16,12,10] %% Relación alfa
n=alfn*r;


%% Crea las Curvas de Torque en función de la velocidad. 
v=0:0.5:80;
for i=1:length(alfn)
Tv(i,:)=Tm*(1-Beta*(alfn(i)*v/Omgm-1).^2); %% Calcula El Torque del Motor en funcin de la velocidad 
end
figure 
plot(v,Tv)
axis([0,80,0,1.1*Tm])
grid on 
xlabel('Velocidad del vehiculo $v$ [m/s]','Interpreter','latex')
ylabel('Torque del Motor $\tau$ [Nm]','Interpreter','latex')
legend('Primera','Segunda','Tercera','Cuarta','Quinta')
for i=1:length(alfn)
Fm(i,:)=Tv(i,:)*alfn(i)
end

figure 
plot(v,Fm)
axis([0,80,0,1.1*Tm*alfn(1)])
grid on 
xlabel('Velocidad del vehiculo $v$ [m/s]','Interpreter','latex')
ylabel('Fuerza del Motor $F_{m}$ [N]','Interpreter','latex')
legend('Primera','Segunda','Tercera','Cuarta','Quinta')

%% Parametros Fuerza Aerodinamica
rho=1.3 %Densidad del Aire [km/m^3]
Cd=0.32;
A=2.4 %% Area Equivalente [m^2]
Ka=(1/2)*rho*Cd*A;
Fd=Ka*v.^2
figure 
plot(v,Fd)
grid on 
xlabel('Velocidad del vehiculo $v$ [m/s]','Interpreter','latex')
ylabel('Fuerza Aerodinmaica $F_{a}$ [N]','Interpreter','latex')

%% Parametros del Vehiculo 
m=1200; % Peso del Vehiculo [Kg] 
V0=20; %% Velocidad Inicial 
%% Parametros Fuerza de Frinción 
Cr=0.001;
g=9.8 %[m/s^2]
%% Parametros de la Fuerza de Gravedad
Ti=7 %% Tiempo Inicial del Cambio en el Peralte
Td=4 %% Tiempo de Duración del Cambio de Peralte
Tf=Ti+Td;
Angle=6;
Thetap=Angle*pi/180;
Kperalte=Thetap/Td;

%% Parametros del Controlador
Cambio=5; %% Cambio en donde esta el Vehiculo
F=Ka*V0^2+m*g*Cr


%%

Ki=0.1
Kp=0.5
Ue=0.1187
I0 = Ue/Ki %% Usted debe Encontrar este valor para garantizar que la velocidad 
% inicial del vehiculo sea constante antes de la aparición de la perturbación 

%% Lanzar el Simulador

out=sim("CruiseControlSK")

%%
figure
plot(out.tout,out.u.Data,'Linewidth',2)
grid on 
ylabel('Nivel del Accelerador $u(t)$',Interpreter='latex')
xlabel("Tiempo de Simulaci\'on en [s]",'Interpreter','latex');
axis([0,Tsim,0,1.1])
%%
figure
plot(out.tout,out.theta.Data*180/pi,'LineWidth',2)
grid on 
ylabel('Angulo de la Via $\theta(t)$ en deg',Interpreter='latex');
xlabel("Tiempo de Simulaci\'on en [s]",'Interpreter','latex');
%%
figure
plot(out.tout,out.v.Data*3.6,'LineWidth',2)
grid on 
ylabel('Velocidad $v(t)$ [km/h]',Interpreter='latex')
xlabel("Tiempo de Simulaci\'on en [s]",'Interpreter','latex');
%%

figure
plot(out.tout,out.Tm.Data,'LineWidth',2)
grid on 
ylabel('Torque del Motor $\tau$ [N/m]','Interpreter','latex')
xlabel("Tiempo de Simulaci\'on en [s]",'Interpreter','latex');
