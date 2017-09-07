function p = predict(Theta1, Theta2, X)
%PREDICT Predict the label of an input given a trained neural network
%   p = PREDICT(Theta1, Theta2, X) outputs the predicted label of X given the
%   trained weights of a neural network (Theta1, Theta2)

% Useful values
m = size(X, 1);
num_labels = size(Theta2, 1);

% You need to return the following variables correctly 
p = zeros(size(X, 1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Complete the following code to make predictions using
%               your learned neural network. You should set p to a 
%               vector containing labels between 1 to num_labels.
%
% Hint: The max function might come in useful. In particular, the max
%       function can also return the index of the max element, for more
%       information see 'help max'. If your examples are in rows, then, you
%       can use max(A, [], 2) to obtain the max for each row.
%

% Layer 1 - Input layer
A1 = [ones(m,1), X];
dispsize(A1);

% Layer 2 - Hidden layer
% A1 rowcount, # of input samples,
%    colcount, # of input features + 1 bias unit.
% Theta1 rowcount, # of NN units in hidden layer, including 1 bias unit.
%        colcount, # of input features + 1 bias unit.
% Z2 rowcount, # of input samples,
%    colcount, # of NN units in hidden layer.
dispsize(Theta1);

Z2 = A1 * Theta1';
dispsize(Z2);

A2 = sigmoid(Z2);
A2 = [ ones( size(A2), 1 ), A2];
dispsize(A2);

% Layer 3 - Output layer
% A2 rowcount, # of input samples,
%    colcount, # of NN units in hidden layer, including 1 bias unit.
% Theta2 rowcount, # of NN units in output layer, which equals # of classes.
%        colcount, # of NN units in hidden layer, including 1 bias unit.
% Z3 & A3 rowcounts, # of input samples,
%         colcounts, # of NN units in output layer, which equals # of classes. 
dispsize(Theta2);

Z3 = A2 * Theta2';
dispsize(Z3);

A3 = sigmoid(Z3);
dispsize(A3);

% Make predictions based on output class with max probability for each sample.
[maxProb, maxIndex] = max(A3, [], 2);
p = maxIndex;

% =========================================================================

end

function dispsize(somevar)
    printf('size(%s)=', inputname(1));
    disp(size( somevar ));
end

