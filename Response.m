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
%     vy = y(k-1:-1:k-m_stopien);
%     a1 = -m(2:end)*y(k-1:-1:k-m_stopien);
%     vu = u(k:-1:k-l_stopien);
%     a2 = l*u(k-del:-1:k-l_stopien-del);
%     y(k) = a1+a2;
    vy = y(k-m_stopien:k-1);
    vu = u(k-l_stopien-del:k);
    y(k) = discreteStep(tf,y(k-m_stopien:k-1),u(k-l_stopien-del:k));
    k=k+1;
end