function [F1_score_macro, classMetrics] = getMetrics(c_matrix)
    % This function calculates the Precision, Recall, F1-score for each class,
    % and the macro-averaged F1-score, given a confusion matrix.
    
    % Get the number of classes from the size of the confusion matrix
    numClasses = size(c_matrix, 1);
    
    % Initialize variables to store True Positives, False Positives, 
    % False Negatives, True Negatives for each class
    TP = zeros(1, numClasses);
    FP = zeros(1, numClasses);
    FN = zeros(1, numClasses);
    
    % Calculate TP, FP, FN for each class
    for i = 1:numClasses
        TP(i) = c_matrix(i,i);
        FP(i) = sum(c_matrix(:,i)) - TP(i);
        FN(i) = sum(c_matrix(i,:)) - TP(i);
    end
    
    % Calculate Precision, Recall for each class
    Precision = TP ./ (TP + FP);
    Recall = TP ./ (TP + FN);  % This is also known as sensitivity
    
    % Calculate F1-score for each class
    F1ScorePerClass = 2 * (Precision .* Recall) ./ (Precision + Recall);
    
    % Create a structure to store Precision, Recall, F1-score for each class
    classMetrics = struct();
    classMetrics.Precision = Precision';
    classMetrics.Recall = Recall';
    classMetrics.F1ScorePerClass = F1ScorePerClass';
    
    % Calculate macro-averaged F1-score
    F1_score_macro = mean(F1ScorePerClass);
end