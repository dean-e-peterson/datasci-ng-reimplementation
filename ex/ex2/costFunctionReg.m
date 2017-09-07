function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

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

% Hypotheses.
h = sigmoid(X * theta);

% Theta parameters as used for regularization, with intercept param set to 0.
thetaReg = theta;
thetaReg(1) = 0;

% Calculate cost.
sumErrs = (-y' * log(h)) - ((1-y)' * log(1-h));
sumReg = thetaReg' * thetaReg;  % Sum of thetaReg's squared.
J = (1/m) * sumErrs + (lambda/(2*m)) * sumReg;

% Calculate gradient.
sumsPartial = X' * (h - y);
grad = (1/m) .* sumsPartial + (lambda/m) .* thetaReg; 

% =============================================================

end
