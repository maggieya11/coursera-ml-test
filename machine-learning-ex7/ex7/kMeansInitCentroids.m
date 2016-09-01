function centroids = kMeansInitCentroids(X, K)
%KMEANSINITCENTROIDS This function initializes K centroids that are to be 
%used in K-Means on the dataset X
%   centroids = KMEANSINITCENTROIDS(X, K) returns K initial centroids to be
%   used with the K-Means on the dataset X
%

% You should return this values correctly
centroids = zeros(K, size(X, 2));

% ====================== YOUR CODE HERE ======================
% Instructions: You should set centroids to randomly chosen examples from
%               the dataset X
%

len_col = size(X,2);

for i=1:K                     % Row Iteration

    % Initialize chosen columns
    chosen_col = zeros(len_col,1);
    
    for j=1:len_col         % Column Iteration
        % index column
       ind_col = floor(len_col*rand(1))+1;
 
       % Check whether the index is chosen
       while ismember(chosen_col,ind_col)==1
            ind_col = floor(len_col*rand(1))+1;
       end
       
       chosen_col(j,1) = ind_col;
       centroids(i,j) = X(i,ind_col);     % assign X(ind_row,ind_col) to centroids
       
    end
  
end


% =============================================================

end

