InitialValuesMati;
yzad = ones(250,1);
yzad(1:29) = 0;     %skok w 30 probce
t = -14.5:0.5:220;  %przesuniêcie o 15 sekund (skok w 0)
lambda = 10;
N = 60;
Nu = 3;
D = 75;
lambdav = [1000,100,20,10,3,1];

%rysowanie sygna³u wyjœciowego
stairs(t(21:130),yzad(21:130),'y');
hold on;
for i=1:length(lambdav)
    lambda = lambdav(i);
    [yDMC, uDMC] = DMCresponse(yzad,Gd,N,Nu,D,lambda);
    stairs(t(21:130),yDMC(21:130));
end
legend('wartoœæ zadana',['lambda = ',num2str(lambdav(1))],['lambda = ',num2str(lambdav(2))],['lambda = ',num2str(lambdav(3))],['lambda = ',num2str(lambdav(4))],['lambda = ',num2str(lambdav(5))],['lambda = ',num2str(lambdav(6))],'Location','Best');
title(['Sygna³ wyjœciowy odpowiedzi skokowej modelu z DMC',newline,'w zale¿noœci od parametru lambda',newline,'N = ',num2str(N),'  Nu = ',num2str(Nu)]);
xlabel('t');
ylabel('y(t)');
fig = gcf;
fig.Position = [10,10,900,600];
grid on;
fileName = '5\d.svg';
print('-dsvg','-r600', fileName);
axis([10 40 0.8 1.2]);
legend('Location','Best');
fileName = '5\5dZOOM.svg';
print('-dsvg','-r600', fileName);
hold off;

%rysowanie sygna³u steruj¹cego
stairs(t(21:130),yzad(21:130),'y');
hold on;
for i=1:length(lambdav)
    lambda = lambdav(i);
    [yDMC, uDMC] = DMCresponse(yzad,Gd,N,Nu,D,lambda);
    stairs(t(21:130),uDMC(21:130));
end
legend('wartoœæ zadana',['lambda = ',num2str(lambdav(1))],['lambda = ',num2str(lambdav(2))],['lambda = ',num2str(lambdav(3))],['lambda = ',num2str(lambdav(4))],['lambda = ',num2str(lambdav(5))],['lambda = ',num2str(lambdav(6))],'Location','Best');
title(['Sygna³ steruj¹cy odpowiedzi skokowej modelu z DMC',newline,'w zale¿noœci od parametru lambda',newline,'N = ',num2str(N),'  Nu = ',num2str(Nu)]);
xlabel('t');
ylabel('u(t)');
fig = gcf;
fig.Position = [10,10,900,600];
grid on;
fileName = '5\5d_sterowanie.svg';
print('-dsvg','-r600', fileName);
axis([-5 20 0 0.7]);
legend('Location','Best');
fileName = '5\5d_sterowanieZOOM.svg';
print('-dsvg','-r600', fileName);
hold off;



