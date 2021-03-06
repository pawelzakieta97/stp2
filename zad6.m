InitialValues;
yzad = ones(250,1);
yzad(1:29) = 0;     %skok w 30 probce
t = -14.5:0.5:220;  %przesuni�cie o 15 sekund (skok w 0)

%Wyznaczone optymalne wsp�czynniki DMC
lambda = 3;
N = 20;
Nu = 1;
D = 70;

%PID na podstawie eksperymentu Z-N
Tk = 20.0006;
Kp = 0.3916;
Kr = 0.6*Kp;
Ti = 0.5*Tk;
Td = 0.12*Tk;

r2 = Kr*Td/Tp;
r1 = Kr*(Tp/2/Ti - 2*Td/Tp - 1);
r0 = Kr*(1 + Tp/2/Ti + Td/Tp);
Rd = tf([r0,r1,r2],[1,-1,0],Tp);
Gpid = Gd*Rd/(1+Gd*Rd);
Gpid_sterowanie = Rd/(1+Gd*Rd);

%r�cznie dobrany PID
Td2 = 2.0;
Ti2 = 8;
Kr2 = 0.15;

r2 = Kr2*Td2/Tp;
r1 = Kr2*(Tp/2/Ti2 - 2*Td2/Tp - 1);
r0 = Kr2*(1 + Tp/2/Ti2 + Td2/Tp);
Rd2 = tf([r0,r1,r2],[1,-1,0],Tp);
Gpid2 = Gd*Rd2/(1+Gd*Rd2);
Gpid2_sterowanie = Rd2/(1+Gd*Rd2);

yPID = Response(Gpid,yzad);
uPID = Response(Gpid_sterowanie,yzad);
yPID2 = Response(Gpid2,yzad);
uPID2 = Response(Gpid2_sterowanie,yzad);
[yDMC, uDMC] = DMCresponse(yzad,Gd,N,Nu,D,lambda);

%rysowanie sygna�u wyj�ciowego
stairs(t(21:130),yzad(21:130),'y');
hold on;
stairs(t(21:130),yPID(21:130));
stairs(t(21:130),yPID2(21:130));
stairs(t(21:130),yDMC(21:130));
PIDZNlegend = ['regulator PID Z-N Kr=',num2str(Kr),' Td=',num2str(Td),' Ti=',num2str(Ti)];
PID2legend = ['regulator PID dobrany r�cznie Kr=',num2str(Kr2),' Td=',num2str(Td2),' Ti=',num2str(Ti2)];
DMClegend = ['regulator DMC D=',num2str(D),' N=',num2str(N),' Nu=',num2str(Nu),' lambda=',num2str(lambda)];
legend('warto�� zadana',PIDZNlegend,PID2legend,DMClegend);
title(['Sygna� wyj�ciowy odpowiedzi skokowej modelu',newline,'w zale�no�ci od regulatora']);
xlabel('t');
ylabel('y(t)');
fig = gcf;
fig.Position = [10,10,900,600];
grid on;
fileName = '6\6a.svg';
print('-dsvg','-r600', fileName);
hold off;

%rysowanie sygna�u steruj�cego
stairs(t(21:130),yzad(21:130),'y');
hold on;
stairs(t(21:130),uPID(21:130));
stairs(t(21:130),uPID2(21:130));
stairs(t(21:130),uDMC(21:130));
PIDZNlegend = ['regulator PID Z-N Kr=',num2str(Kr),' Td=',num2str(Td),' Ti=',num2str(Ti)];
PID2legend = ['regulator PID dobrany r�cznie Kr=',num2str(Kr2),' Td=',num2str(Td2),' Ti=',num2str(Ti2)];
DMClegend = ['regulator DMC D=',num2str(D),' N=',num2str(N),' Nu=',num2str(Nu),' lambda=',num2str(lambda)];
legend('warto�� zadana',PIDZNlegend,PID2legend,DMClegend);
title(['Sygna� steruj�cy odpowiedzi skokowej modelu',newline,'w zale�no�ci od regulatora']);
xlabel('t');
ylabel('y(t)');
fig = gcf;
fig.Position = [10,10,900,600];
grid on;
fileName = '6\6a_sterowanie.svg';
print('-dsvg','-r600', fileName);
hold off;