function Gd = generateObjectTF(K, T0)
%generates TF with modified K0
K0 = K;
T1 = 2.18;
T2 = 4.68;
Tp = 0.5;
b = [0,0,K0];
a = [T1*T2, T1+T2, 1];
Gc = tf(b,a);
Gc.InputDelay = T0;
Gd = c2d(Gc,Tp,'zoh');