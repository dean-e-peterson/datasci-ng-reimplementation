function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
%GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESCENT(X, y, theta, alpha, num_iters) updates theta by 
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);

for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCost) and gradient here.
    %

    %% For loop implementation
    %theta_new = zeros(length(theta),1);
    %for j = 1:length(theta)
    %    summation = 0.0;
    %    for i = 1:m
    %        xi = X(i,:);
    %        yi = y(i);
    %        summation = summation + (xi * theta - yi) * xi(j);
    %    end
    %    theta_new(j) = theta(j) - alpha * (1/m) * summation;
    %end
    %theta = theta_new;

    % Can I vectorize it?
    hypotheses = X * theta;  % m x 1
    % [j x 1] = [j x m] * [m x 1]
    summation = X' * (hypotheses - y);
    gradient = (1/m) * summation;
    theta = theta - alpha * gradient;
    % Yup, but hard for me to wrap my head around it and understand.

    % ============================================================

    % Save the cost J in every iteration    
    J_history(iter) = computeCost(X, y, theta);

end

end
