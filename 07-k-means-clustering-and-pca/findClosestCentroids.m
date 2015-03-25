function idx = findClosestCentroids(X, centroids)
%FINDCLOSESTCENTROIDS computes the centroid memberships for every example
%   idx = FINDCLOSESTCENTROIDS (X, centroids) returns the closest centroids
%   in idx for a dataset X where each row is a single example. idx = m x 1 
%   vector of centroid assignments (i.e. each entry in range [1..K])
%

% Set K
K = size(centroids, 1);

% Get number of examples in the dataset
m = size(X, 1);

% You need to return the following variables correctly.
idx = zeros(m, 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Go over every example, find its closest centroid, and store
%               the index inside idx at the appropriate location.
%               Concretely, idx(i) should contain the index of the centroid
%               closest to example i. Hence, it should be a value in the 
%               range 1..K
%
% Note: You can use a for-loop over the examples to compute this.
%

distances = zeros(K, 1);

% Loop over all examples
for i = 1:m
  % Compute distances from the current example to each centroid
  for k = 1:K
    distances(k) = norm(X(i, :) - centroids(k, :), 2);
  endfor

  % Find the index of the smallest distance
  [minDistance, idx(i)] = min(distances);
endfor

% =============================================================

end

