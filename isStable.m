%funkcja zwracaj�ca true, je�li podany w argumencie przebieg zachowuje
%stabilno��, false w przeciwnym przypadku
function b = isStable(response,K)
thresh = 0.2;
if (max(response-K)>K+thresh)
    b = false;
else
    b = true;
end