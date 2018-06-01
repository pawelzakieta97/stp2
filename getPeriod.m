function T = getPeriod(response, time)
K = mean(response);
k = 1;
nmax = 20;
tmax = 2000;
while response(k)<K
    k=k+1;
end
t0 = time(k);
n = 0;
while n<nmax && time(k)<tmax
    if (response(k)-K)*(response(k+1)-K)<0
        n=n+1;
    end
    k=k+1;
end
T = (time(k)-t0)*2/n;