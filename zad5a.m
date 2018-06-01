InitialValues;
yzad = ones(220,1);
yzad(1:29) = 0;     %skok w 30 probce
t = -14.5:0.5:220;  %przesuniêcie o 15 sekund (skok w 0)
D = 70;             %granica opowiedzi skokowej
lambda = 1;
N = 70;
Nu = 70;
[yDMC, uDMC] = DMCresponse(yzad,Gd,N,Nu,D,lambda);
stairs(t(21:80),yzad(21:80),'y');
hold on;
stairs(t(21:80),uDMC(21:80),'g');    %
stairs(t(21:80),yDMC(21:80),'b');
fig = gcf;
fig.Position = [10,10,900,450];
axis([-5 25 -0.2 1.4]);
legend('wartoœæ zadana','sygna³ steruj¹cy','sygna³ wyjœciowy');
title(['OdpowiedŸ skokowa modelu z DMC',newline,'N = ',num2str(N),'  Nu = ',num2str(Nu),'  D = ',num2str(D),' lambda = ',num2str(lambda)]);
grid on;
fileName = '5\5a.svg';
print('-dsvg','-r600', fileName);
hold off;




