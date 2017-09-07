function [J, grad] = costFunction(theta, X, y)
%COSTFUNCTION Compute cost and gradient for logistic regression
%   J = COSTFUNCTION(theta, X, y) computes the cost of using theta as the
%   parameter for logistic regression and the gradient of the cost
%   w.r.t. to the parameters.

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta
%
% Note: grad should have the same dimensions as theta
%

% sigmoid(z) = 1 / 1 + e ^ -z  % Implemented in sigmoid.m
% h(theta, x) = sigmoid(theta' * x) 
% CostPer = - y * log(h) - (1-y) * log(1 - h)
% CostTotal = sum i=1 to m (CostPer)
% J = (1/m) * CostTotal
% Gradient sub j = (1/m) sum i= 1 to m ((h - y)*(x sub j))

% Calculate all hypothoses for current theta at once
H = hypotheses(theta, X);
sumofyones  =    -y'  * log(H);
sumofyzeros = -(1-y)' * log(1-H);
J = (1/m) * (sumofyones + sumofyzeros);

grad = (1/m) .* X' * (H - y);

%% Loop implementation
% CostTotal = 0;
% for i=1:m
%   x = X(i,:)';
%   h = hypothesis(theta, x);
%   CostPer = -y(i) * log(h) - (1-y(i)) * log(1-h);
%   CostTotal = CostTotal + CostPer;
% end
% J = CostTotal / m;
% 
% GradTotal = zeros(length(theta), 1);
% for i=1:m
%   x = X(i,:)';
%   h = hypothesis(theta, x);
%   for j=1:length(theta)
%     GradPer(j) = (h - y(i)) * x(j);
%     GradTotal(j) = GradTotal(j) + GradPer(j);
%   end
% end
% grad = (1/m) .* GradTotal;

% =============================================================

end

function h = hypothesis(theta, x) % Returns a scalar
  h = sigmoid(theta' * x);
end

function H = hypotheses(theta, X) % Returns a vector
  H = sigmoid( X * theta );
end
