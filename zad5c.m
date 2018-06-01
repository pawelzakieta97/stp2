InitialValues;
yzad = ones(250,1);
yzad(1:29) = 0;     %skok w 30 probce
t = -14.5:0.5:220;  %przesuni�cie o 15 sekund (skok w 0)
lambda = 10;
N = 20;
Nu = 70;
D = 70;
Nuv = [1,2,4,8,12,20];

%sygna� wyj�ciowy
stairs(t(21:130),yzad(21:130),'y');
hold on;
for i=1:length(Nuv)
    Nu = Nuv(i);
    [yDMC, uDMC] = DMCresponse(yzad,Gd,N,Nu,D,lambda);
    stairs(t(21:130),yDMC(21:130));
end
legend('warto�� zadana',['Nu = ',num2str(Nuv(1))],['Nu = ',num2str(Nuv(2))],['Nu = ',num2str(Nuv(3))],['Nu = ',num2str(Nuv(4))],['Nu = ',num2str(Nuv(5))],['Nu = ',num2str(Nuv(6))]);
title(['Sygna� wyj�ciowy odpowiedzi skokowej modelu z DMC',newline,'w zale�no�ci od parametru Nu',newline,'N = ',num2str(N),'  lambda = ',num2str(lambda)]);
xlabel('t');
ylabel('y(t)');
fig = gcf;
fig.Position = [10,10,900,600];
grid on;
fileName = '5\5c.svg';
print('-dsvg','-r600', fileName);
axis([5 25 0.9 1.15]);
fileName = '5\5cZOOM.svg';
print('-dsvg','-r600', fileName);
hold off;

%sygna� steruj�cy
stairs(t(21:130),yzad(21:130),'y');
hold on;
for i=1:length(Nuv)
    Nu = Nuv(i);
    [yDMC, uDMC] = DMCresponse(yzad,Gd,N,Nu,D,lambda);
    stairs(t(21:130),uDMC(21:130));
end
legend('warto�� zadana',['Nu = ',num2str(Nuv(1))],['Nu = ',num2str(Nuv(2))],['Nu = ',num2str(Nuv(3))],['Nu = ',num2str(Nuv(4))],['Nu = ',num2str(Nuv(5))],['Nu = ',num2str(Nuv(6))]);
title(['Sygna� steruj�cy odpowiedzi skokowej modelu z DMC',newline,'w zale�no�ci od parametru Nu',newline,'N = ',num2str(N),'  lambda = ',num2str(lambda)]);
xlabel('t');
ylabel('u(t)');
fig = gcf;
fig.Position = [10,10,900,600];
grid on;
fileName = '5\5c_sterowanie.svg';
print('-dsvg','-r600', fileName);
axis([-5 10 0.1 0.55]);
fileName = '5\5c_sterowanieZOOM.svg';
print('-dsvg','-r600', fileName);
hold off;
