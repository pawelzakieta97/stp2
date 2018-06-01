Td2 = 2.0;      %2.4
Ti2 = 8;       %10
Kr2 = 0.15;    %0.235
r2 = Kr2*Td2/Tp;                  %1.127
r1 = Kr2*(Tp/2/Ti2 - 2*Td2/Tp - 1);%-2.485
r0 = Kr2*(1 + Tp/2/Ti2 + Td2/Tp);  %1.369
%Rd = tf([r0,r1,r2],[1,-1,0],Tp);
Rd2 = tf([r0,r1,r2],[1,-1,0],Tp);

step(Gd*Rd/(1+Gd*Rd),'r');
hold on;
step(Rd/(1+Gd*Rd),'g');
step(Gd*Rd2/(1+Gd*Rd2),'b');
step(Rd2/(1+Gd*Rd),'m');
