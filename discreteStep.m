%zwraca nowa wartosc y po wykonaniu kroku o transmitancji tf
%i poprzednich wartosciach sygnalow yPrev i uPrev
function y = discreteStep(tf,yPrev,uPrev)


[l,m] = tfdata(tf,'v');


l_stopien = length(l)-1;
m_stopien = length(m)-1;

del = tf.InputDelay+tf.OutputDelay+tf.IODelay;
vy = yPrev(end:-1:1);
vu = uPrev(end-del:-1:1);
a1 = -m(2:end)*yPrev(end:-1:1);
a2 = l*uPrev(end-del:-1:1);
y = a1+a2;