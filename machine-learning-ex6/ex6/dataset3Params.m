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

Set = [0.01 0.02 0.03 0.05 0.08 0.1 0.3 0.5 0.8 1 3 5 8 10 20 30];
count = 1;
for loopC=1:16
    for loopSigma=1:16
        testC = Set(loopC);
        testSigma = Set(loopSigma);
        model= svmTrain(X, y, testC, @(X, y) gaussianKernel(X, y, testSigma)); 
        predict = svmPredict(model, Xval);
        testError = mean(double(predict ~= yval));
        results(count,:) = [testC, testSigma, testError];
        count = count + 1;
    end
end

    [minErr, minInd] = min(results(:,3));
    C = results(minInd,1);
    sigma = results(minInd,2);


% =========================================================================

end
