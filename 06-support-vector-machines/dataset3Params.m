function [C, sigma] = dataset3Params(X, y, Xval, yval)
%EX6PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = EX6PARAMS(X, y, Xval, yval) returns your choice of C and 
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

% Create a list of values to choose from for C and sigma
cAndSigmaValues = [0.01; 0.03; 0.1; 0.3; 1; 3; 10; 30];

predictionError = [];

% Try all permutations of C and sigma values from the list above
for cIndex = 1:size(cAndSigmaValues)
  C = cAndSigmaValues(cIndex);

  for sigmaIndex = 1:size(cAndSigmaValues)
    sigma = cAndSigmaValues(sigmaIndex);
    
    % Train a model using our test dataset
    model= svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma)); 
    % Compute predictions for the given cross validation set
    predictions = svmPredict(model, Xval);

    % Compute and collect prediction errors with their associated C and sigma values
    predictionError = [predictionError; [mean(double(predictions ~= yval)), C, sigma]];
  endfor
endfor

% Determine the C and sigma values that resulted in the lowest prediction error
[minError, minErrorIndex] = min(predictionError(:, 1));
C = predictionError(minErrorIndex, 2);
sigma = predictionError(minErrorIndex, 3);

% =========================================================================

end
