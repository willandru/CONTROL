s=tf('s')

Gv=0.5/(0.5*s+1);
Gp=6/((3*s+1)*(10*s+1));

t=linspace(0,100,10000);
y = step(Gv*Gp,t)

K=3
L1=2.92
Tau=16.33
Gm=K/(Tau*s+1)

ym1=step(Gm,t)


y_t1=3*(1-exp(-1/3))
y_t2=3*(1-exp(-1))

A=[1 1 
   1 1/3]

X=inv(A)*[14.94;7.67]

L=X(1)
Tau=X(2)

Gm=K/(Tau*s+1)

ym2=step(Gm,t)

plot(t+1,y,'b',LineWidth=3)
hold on 
plot(t+L1,ym1,'r',LineWidth=3)
plot(t+L,ym2,'c',LineWidth=3)
grid minor
legend('Salida Proceso','Ajuste Recta','Ajuste Smith')
