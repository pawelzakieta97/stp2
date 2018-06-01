T0 = 5;


%Wyznaczone optymalne wspó³czynniki DMC
lambda = 3;
N = 20;
Nu = 1;
D = 70;
Gd = generateObjectTF(5.5,5);
u = ones(D+10,1);
u(1:10) = 0;
resp = Response(Gd,u);
s = resp(11:D+10);      %nadpisanie odpowiedzi skokowej

%PID na podstawie eksperymentu Z-N
Tk = 20.0006;
Kp = 0.3916;
Kr = 0.6*Kp;
Ti = 0.5*Tk;
Td = 0.12*Tk;

%rêcznie dobrany PID
Td2 = 2.0;
Ti2 = 8;
Kr2 = 0.15;


BorderK = zeros(11,3);

for Tratio = 10:20
    BorderK(Tratio-9,1)=findBorderK0PID(Kr, Td, Ti, T0*Tratio/10);
    BorderK(Tratio-9,2)=findBorderK0PID(Kr2, Td2, Ti2, T0*Tratio/10);
    BorderK(Tratio-9,3)=findBorderK0DMC(N, Nu, D, lambda ,T0*Tratio/10);
end

BorderK(:,1:3) = BorderK(:,1:3)/5.5;
BorderK(:,4) = [1:0.1:2];
plot(BorderK(:,4),BorderK(:,1),'-o');
hold on;
plot(BorderK(:,4),BorderK(:,2),'-o');
plot(BorderK(:,4),BorderK(:,3),'-o');
legend('PID Z-N','PID rêczny','DMC');
title('Obszar stabilnoœci poszczególnych regulatorów');
xlabel('T0 / T nom');
ylabel('K0 / K nom');
fig = gcf;
fig.Position = [10,10,900,600];
grid on;
fileName = '6\6b.svg';
print('-dsvg','-r600', fileName);
hold off;

    