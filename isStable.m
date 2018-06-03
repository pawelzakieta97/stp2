%funkcja zwracaj¹ca true, jeœli podany w argumencie przebieg zachowuje
%stabilnoœæ, false w przeciwnym przypadku
function b = isStable(response,K)
thresh = 0.2;
if (max(response-K)>K+thresh)
    b = false;
else
    b = true;
end