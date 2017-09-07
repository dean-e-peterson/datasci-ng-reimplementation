function idx = findClosestCentroids(X, centroids)
%FINDCLOSESTCENTROIDS computes the centroid memberships for every example
%   idx = FINDCLOSESTCENTROIDS (X, centroids) returns the closest centroids
%   in idx for a dataset X where each row is a single example. idx = m x 1 
%   vector of centroid assignments (i.e. each entry in range [1..K])
%

% Set K
K = size(centroids, 1);

% You need to return the following variables correctly.
idx = zeros(size(X,1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Go over every example, find its closest centroid, and store
%               the index inside idx at the appropriate location.
%               Concretely, idx(i) should contain the index of the centroid
%               closest to example i. Hence, it should be a value in the 
%               range 1..K
%
% Note: You can use a for-loop over the examples to compute this.
%

m = size(X,1);
normsq = zeros(K, 1);
for i = 1:m
    for k = 1:K
        distance = X(i, :) - centroids(k, :);
        % distance is a row vector.
        normsq(k) = distance * distance';
    end
    [minNormsq, minNormsqIndex] = min(normsq);
    idx(i) = minNormsqIndex;
end

% Attempt at vectorizing, SEEMED to work, but probably not worth it.
%m = size(X,1);
%normsq = zeros(m, K);
%for k = 1:K
%    % Depends on broadcasting the centroid row vector for all rows of X
%    distance = X - centroids(k, :);
%    normsq(:, k)  = sum(distance.^2, 2);
%end
%[minNormsq, minNormsqIndex] = min(normsq, [], 2);
%idx = minNormsqIndex;


% =============================================================

end


function dispsize(myvar)
    printf('size(%s) = ', inputname(1));
    disp(size(myvar));
end

