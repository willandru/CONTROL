%% PRIMERO A
clc, clear, close all;

syms tf v0  z0  zf

A=[1 tf tf^2;
    tf (tf^2)/2 (tf^3)/3 ;
    (tf^2)/2 (tf^3)/6 (tf^4)/12];
b= [0 ;-v0 ; (v0*tf+z0-zf)];

x=linsolve(A,b);

%% PRIMERO B
clc, clear, close all;

v0=25; %m/s
z0=1500; %m
tf=120; %s
zf=20; %m

t=[0:0.1:tf];

a1=(6*(2*z0 - 2*zf + 3*tf*v0))/tf^2 ;
a2=-(6*(8*z0 - 8*zf + 13*tf*v0))/tf^3 ;
a3=-(6*(8*z0 - 8*zf + 13*tf*v0))/tf^3 ;

a=a1 + a2.*t + a3.*(t.^2);
v=a1.*t + a2.*(t.^2)./2 + a3.*(t.^3)./3 + v0;
x=a1.*(t.^2)./2 + a2.*(t.^3)./6 + a3.*(t.^4)./12 + v0.*t + z0;

figure(1)
subplot(1,3,1)
plot(t,a)
title('Aceleración')
subplot(1,3,2)
plot(t,v)
title('Velocidad')
subplot(1,3,3)
plot(t,x)
title('Posición')
sgtitle('Dinámica de una sonda espacial')

%%
clc, clear, close all;
syms w0 a b

eq1 = atan( (1/(1+ w0^2*a/b))/(1/(w0-w0^3/b)) ) == pi;
eq2 = sqrt(((1/(1+ w0^2*a/b)))^2+((1/(w0-w0^3/b)))^2) == 1;


sol = solve([eq1, eq2], [a, b]);

a_sol = sol.a
b_sol = sol.b

%% SEXTO

numerator = 5000;
denominator = [1, 15, 114, 100];
G = tf(numerator, denominator);


Kp = 1;

T = feedback(Kp * G, 1);

t = 0:0.01:10;  % Vector de tiempo
u = ones(size(t));  % Entrada de paso unitario
y = lsim(T, u, t);  % Simular la respuesta en lazo cerrado

% Graficar la respuesta
plot(t, y);
title('Respuesta en Lazo Cerrado con Kp = 1');
xlabel('Tiempo');
ylabel('Respuesta');
grid on;