function Kn = findBorderK0PID(Kr, Td, Ti,T0)
thresh = 0.01;
Kn = 5.5;
Gd = generateObjectTF(Kn,5);
Tp = 0.5;
r2 = Kr*Td/Tp;
r1 = Kr*(Tp/2/Ti - 2*Td/Tp - 1);
r0 = Kr*(1 + Tp/2/Ti + Td/Tp);
Rd = tf([r0,r1,r2],[1,-1,0],Tp);
Gpid = Gd*Rd/(1+Gd*Rd);
while isStable(step(Gpid,2000),1)
    Kn = Kn*2;
    Gd = generateObjectTF(Kn,T0);
    r2 = Kr*Td/Tp;
    r1 = Kr*(Tp/2/Ti - 2*Td/Tp - 1);
    r0 = Kr*(1 + Tp/2/Ti + Td/Tp);
    Rd = tf([r0,r1,r2],[1,-1,0],Tp);
    Gpid = Gd*Rd/(1+Gd*Rd);
end
upper = Kn;
lower = Kn/2;
while upper-lower>thresh
    Kn = (upper+lower)/2;
    Gd = generateObjectTF(Kn,T0);
    r2 = Kr*Td/Tp;
    r1 = Kr*(Tp/2/Ti - 2*Td/Tp - 1);
    r0 = Kr*(1 + Tp/2/Ti + Td/Tp);
    Rd = tf([r0,r1,r2],[1,-1,0],Tp);
    Gpid = Gd*Rd/(1+Gd*Rd);
    if isStable(step(Gpid,2000),1)
        lower = Kn;
    else
        upper = Kn;
    end
end
step(Gpid,2000);