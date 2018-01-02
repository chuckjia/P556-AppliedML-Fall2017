function cost = J( X, y, theta )
%J Summary of this function goes here
%   Detailed explanation goes here
    D = X * theta - y;
    cost = D' * D / 784.;
end

