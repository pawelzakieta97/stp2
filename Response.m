%Funkcja zwracajπca odpowiedü modelu o transmitancji tf na sygna≥ o
%przebiegu u
function y = Response(tf,u)
[l,m] = tfdata(tf,'v');
s = size(m);
m_stopien = s(2)-1;
s = size(l);
l_stopien = s(2)-1;
s = size(u);
n = s(1);
del = tf.InputDelay+tf.OutputDelay+tf.IODelay;
m = m(1:end-tf.IODelay);
l = l(1:end-tf.IODelay);
k = m_stopien+del+1;
y = zeros(n,1);
while k<=n
    y(k) = discreteStep(tf,y(k-m_stopien:k-1),u(k-l_stopien-del:k));
    k=k+1;
end