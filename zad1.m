InitialValues;
[yc,tc] = step(Gc,40);
[yd,td] = step(Gd,40);

plot(tc,yc,'b');
hold on;
stairs(td,yd,'r');
legend('odpowiedü skokowa modelu ciπg≥ego','odpowiedü skokowa modelu dyskretnego','Location','Best');
fileName = '1\odpowiedzi skokowe.svg';
print('-dsvg','-r600', fileName);
