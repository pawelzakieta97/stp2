function Mp = generateMp(s,N,K)
D = length(s);
k(1:N,1) = K;
s = [s;k];
Mp = zeros(N,D-1);
for row = 1:N
    for col = 1:D-1
        Mp(row,col) = s(row+col)-s(col);
    end
end