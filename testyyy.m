Kborder = findBorderK0DMC(N, Nu, D, lambda ,5);

Gd = generateObjectTF(5.5,5);
u = ones(D+10,1);
u(1:10) = 0;
resp = Response(Gd,u);
s = resp(11:D+10);      %nadpisanie odpowiedzi skokowej
yzad = ones(100,1);
yzad(1:10) = 0;
Gd = generateObjectTF(Kborder,5);
[y,u] = CustomDMCresponse(yzad,Gd,s,N, Nu, D, lambda);
plot(y);