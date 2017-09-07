function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

%%Cs = [0, .01, .03, .1, .3, 1, 3, 10, 30, 100];
%Cs = [.3, .5, .7, .9, 1.0, 1.1, 1.3, 1.5, 2, 2.5, 3];
%%sigmas = [.01, .03, .1, .3, 1, 3, 10, 30, 100];
%sigmas = [.03, .05, .07, .09, .10, .11, .13, .15, .2, 2.5, 3];
%Errors = zeros(length(Cs), length(sigmas));
%
%for i = 1:length(Cs)
%    C = Cs(i);
%    for j = 1:length(sigmas)
%        %printf('C=%f, sigma=%f training...\n', C, sigma);
%        sigma = sigmas(j);
%        % Train with training set.
%        model = svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma));
%        % Test with validation set.
%        pred = svmPredict(model, Xval);
%        % Show and save results.
%        err = mean(pred ~= yval);
%        printf('C=%f, sigma=%f, err=%f\n\n', C, sigma, err);
%        Errors(i,j) = err;
%    end
%end
%Cs'
%sigmas
%Errors
%
%[minRowValues, minRowIndexes] = min(Errors);
%[minColValue, minColIndex] = min(minRowValues);
%sigma = sigmas(minColIndex);
%C = Cs(minRowIndexes(minColIndex));
%printf('\n');
%printf('Lowest error %f at C=%f and sigma=%f\n', minColValue, C, sigma);

C = 1.0;
sigma = .1;

% =========================================================================

end


