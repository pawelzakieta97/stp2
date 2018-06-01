function [y,u] = CustomDMCresponse(yzad, tf, s, N, Nu, D, lambda)
%calculates overwritten K matrix and simulates response to yzad signal
[l,m] = tfdata(tf,'v');
l_stopien = length(l)-1;
m_stopien = length(m)-1;
del = tf.InputDelay+tf.OutputDelay;


kmax = length(yzad);
y = zeros(kmax,1);
u = ones(D+10,1);
u(1:10) = 0;
u = zeros(200,1);       %wyznaczone wartoœci sterowania
K = s(end);
M = generateM(s,N,Nu,K);
Mp = generateMp(s,N,K);
Up = zeros(D-1,1);
K = (M'*M + lambda*eye(Nu))^(-1)*M';

for k=m_stopien+del+1:kmax-1
    Y0 = Mp*Up + ones(N,1)*y(k);    %swobodna sk³adowa sygna³u  
    Yzad = ones(N,1)*yzad(k);      
    dU = K*(Yzad-Y0);
    u(k) = u(k-1)+dU(1);
    yPrev = y(k-m_stopien+1:k);
    uPrev = u(k-l_stopien-del:k);
    y(k+1) = discreteStep(tf,yPrev,uPrev);
    Up(2:D-1) = Up(1:D-2);
    Up(1) = dU(1);
end
    