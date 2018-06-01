function Kn = findBorderK0DMC(N, Nu, D, lambda ,T0)

thresh = 0.1;
Kn = 5.5;
Gd = generateObjectTF(Kn,5);
u = ones(D+10,1);
u(1:10) = 0;
resp = Response(Gd,u);
s = resp(11:D+10);      %nadpisanie odpowiedzi skokowej
yzad = ones(200,1);
yzad(1:10) = 0;

[resp,~] = CustomDMCresponse(yzad,Gd,s,N, Nu, D, lambda);
while isStable(resp,1)
    Kn = Kn*2;
    Gd = generateObjectTF(Kn,T0);
    [resp,~] = CustomDMCresponse(yzad,Gd,s,N, Nu, D, lambda);
end
upper = Kn;
lower = Kn/2;
while upper-lower>thresh
    Kn = (upper+lower)/2;
    Gd = generateObjectTF(Kn,T0);
    [resp,~] = CustomDMCresponse(yzad,Gd,s,N, Nu, D, lambda);
    if isStable(resp,1)
        lower = Kn;
    else
        upper = Kn;
    end
end
[resp,~] = CustomDMCresponse(yzad,Gd,s,N, Nu, D, lambda);
plot(resp);