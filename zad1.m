InitialValues;
[yc,tc] = step(Gc,40);
[yd,td] = step(Gd,40);

plot(tc,yc,'b');
hold on;
stairs(td,yd,'r');
xlabel('t');
ylabel('y(t)');
grid on;
title('Odpowied� skokowa modelu ci�g�ego i dyskretnego')
legend('odpowied� skokowa modelu ci�g�ego','odpowied� skokowa modelu dyskretnego','Location','Best');
fig = gcf;
fig.Position = [10,10,900,500];
fileName = '1\odpowiedzi skokowe.svg';
print('-dsvg','-r600', fileName);
