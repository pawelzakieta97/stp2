InitialValues;
yzad = ones(250,1);
yzad(1:29) = 0;     %skok w 30 probce
t = -14.5:0.5:220;  %przesuniêcie o 15 sekund (skok w 0)
lambda = 10;
N = 70;
Nu = 70;
D = 70;
Nv = [40,30,20,17,15,10];
stairs(t(21:200),yzad(21:200),'y');
hold on;

%rysowanie sygna³u wyjœciowego
for i=1:length(Nv)
    N = Nv(i);
    Nu = N;
    [yDMC, uDMC] = DMCresponse(yzad,Gd,N,Nu,D,lambda);
    stairs(t(21:200),yDMC(21:200));
end
legend('wartoœæ zadana',['N = ',num2str(Nv(1))],['N = ',num2str(Nv(2))],['N = ',num2str(Nv(3))],['N = ',num2str(Nv(4))],['N = ',num2str(Nv(5))],['N = ',num2str(Nv(6))]);
title(['Sygna³ wyjœciowy odpowiedzi skokowej modelu z DMC',newline,'w zale¿noœci od parametru N',newline,'Nu = N   lambda = ',num2str(lambda)]);
xlabel('t');
ylabel('y(t)');
fig = gcf;
fig.Position = [10,10,900,600];
grid on;
fileName = '5\5b.svg';
print('-dsvg','-r600', fileName);
axis([0 30 0.7 1.3]);
fileName = '5\5bZOOM.svg';
print('-dsvg','-r600', fileName);
hold off;


%rysowanie sygna³u steruj¹cego
stairs(t(21:200),yzad(21:200),'y');
hold on;
for i=1:length(Nv)
    N = Nv(i);
    Nu = N;
    [yDMC, uDMC] = DMCresponse(yzad,Gd,N,Nu,D,lambda);
    stairs(t(21:200),uDMC(21:200));
end
legend('wartoœæ zadana',['N = ',num2str(Nv(1))],['N = ',num2str(Nv(2))],['N = ',num2str(Nv(3))],['N = ',num2str(Nv(4))],['N = ',num2str(Nv(5))],['N = ',num2str(Nv(6))]);
title(['Sygna³ steruj¹cy opowiedzi skokowej modelu z DMC',newline,'w zale¿noœci od parametru N',newline,'Nu = N   lambda = ',num2str(lambda)]);
xlabel('t');
ylabel('u(t)');
fig = gcf;
fig.Position = [10,10,900,600];
grid on;
fileName = '5\5b_sterowanie.svg';
print('-dsvg','-r600', fileName);
axis([-10 20 0 0.6]);
fileName = '5\5b_sterowanieZOOM.svg';
print('-dsvg','-r600', fileName);
hold off;

