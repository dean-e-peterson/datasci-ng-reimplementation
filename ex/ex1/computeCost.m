function J = computeCost(X, y, theta)
%COMPUTECOST Compute cost for linear regression
%   J = COMPUTECOST(X, y, theta) computes the cost of using theta as the
%   parameter for linear regression to fit the data points in X and y

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta
%               You should set J to the cost.

% For loop implementation
%for i = 1:m
%  xi = X(i,:);
%  yi = y(i);
%  J = J + (xi * theta - yi) ^ 2;
%end
%J = J / (2 * m);

% Can I vectorize it?
J = (1 / (2*m)) * sum((X * theta - y) .^ 2);
% Yes, but still rather ugly.

% Could have gone farther.  Notes for multivariate point out that you can
% square and sum (X*theta-y) at the same time with (X*theta-y)' * (X*theta-y)

% =========================================================================

end
