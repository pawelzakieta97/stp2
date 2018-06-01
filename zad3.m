InitialValues;
upper = 1;
lower = 0;
thresh = 0.001;
while upper-lower>thresh
    Kp = (upper+lower)/2;
    K = K0*Kp/(1+K0*Kp);
    G = Gc*Kp/(1+Kp*Gc);
    [response,time] = step(G,2000);
    if isStable(response,K)
        lower = Kp;
    else
        upper = Kp;
    end
end
Tk = getPeriod(response,time);
Kr = 0.6*Kp;
Ti = 0.5*Tk;
Td = 0.12*Tk;

b = [Kr*Td*Ti, Kr*Ti, Kr];
a = [0,Ti,0];
Rc = tf(b,a);

r2 = Kr*Td/Tp;
r1 = Kr*(Tp/2/Ti - 2*Td/Tp - 1);
r0 = Kr*(1 + Tp/2/Ti + Td/Tp);
Rd = tf([r0,r1,r2],[1,-1,0],Tp);

step(Gc*Rc/(1+Gc*Rc),'r');
hold on;
step(Gd*Rd/(1+Gd*Rd),'b');

%lepsze wartoœci PID
Td2 = 2.0;
Ti2 = 8;
Kr2 = 0.15;
r2 = Kr2*Td2/Tp;
r1 = Kr2*(Tp/2/Ti2 - 2*Td2/Tp - 1);
r0 = Kr2*(1 + Tp/2/Ti2 + Td2/Tp);
Rd2 = tf([r0,r1,r2],[1,-1,0],Tp);
step(Gd*Rd2/(1+Gd*Rd2),'m');

grid on; 
xlabel('t');
ylabel('y(t)');
legend('model ci¹g³y','model dyskretny, PID Z-N','model dyskretny, rêcznie dobrany PID');
title('OdpowiedŸ skokowa z regulatorem PID');
fileName = '3\skokowaPID.svg';
print('-dsvg','-r600', fileName);
hold off;
