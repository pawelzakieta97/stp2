InitialValues;
u = ones(200,1);
u(1:10) = 0;
[respReal,time] = step(Gd);
resp = Response(Gd,u);

K = 5.5;
D = 80;
s = resp(11:D+10);
N = 100;
Nu = 50;
lambda = 1;

M = generateM(s,N,Nu,K);
Mp = generateMp(s,N,K);
Up = zeros(D-1,1);
U = zeros(Nu,1);
Y = M*U + Mp*Up;
plot(1:N,Y);
K = (M'*eye(N)*M + lambda*eye(Nu))^(-1)*M';



