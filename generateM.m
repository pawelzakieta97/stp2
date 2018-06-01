function M = generateM(s,N,Nu,K)
D = length(s);
k(1:N-D,1) = K;
s = [s;k];
M = zeros(N,Nu);
for i = 1:N
	M(i,1:min(i,Nu)) = s(i:-1:max(1,i-Nu+1));
end