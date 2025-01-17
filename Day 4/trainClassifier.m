function [trainedClassifier, validationAccuracy] = trainClassifier(trainingData)
% [trainedClassifier, validationAccuracy] = trainClassifier(trainingData)
% returns a trained classifier and its accuracy. This code recreates the
% classification model trained in Classification Learner app. Use the
% generated code to automate training the same model with new data, or to
% learn how to programmatically train models.
%
%  Input:
%      trainingData: a table containing the same predictor and response
%       columns as imported into the app.
%
%  Output:
%      trainedClassifier: a struct containing the trained classifier. The
%       struct contains various fields with information about the trained
%       classifier.
%
%      trainedClassifier.predictFcn: a function to make predictions on new
%       data.
%
%      validationAccuracy: a double containing the accuracy in percent. In
%       the app, the History list displays this overall accuracy score for
%       each model.
%
% Use the code to train the model with new data. To retrain your
% classifier, call the function from the command line with your original
% data or new data as the input argument trainingData.
%
% For example, to retrain a classifier trained with the original data set
% T, enter:
%   [trainedClassifier, validationAccuracy] = trainClassifier(T)
%
% To make predictions with the returned 'trainedClassifier' on new data T2,
% use
%   yfit = trainedClassifier.predictFcn(T2)
%
% T2 must be a table containing at least the same predictor columns as used
% during training. For details, enter:
%   trainedClassifier.HowToPredict

% Auto-generated by MATLAB on 04-Jun-2020 10:27:57


% Extract predictors and response
% This code processes the data into the right shape for training the
% model.
inputTable = trainingData;
predictorNames = {'Wmean_total_acc_x_train', 'Wmean_total_acc_y_train', 'Wmean_total_acc_z_train', 'Wmean_body_gyro_x_train', 'Wmean_body_gyro_y_train', 'Wmean_body_gyro_z_train', 'Wstd_total_acc_x_train', 'Wstd_total_acc_y_train', 'Wstd_total_acc_z_train', 'Wstd_body_gyro_x_train', 'Wstd_body_gyro_y_train', 'Wstd_body_gyro_z_train', 'Wpca1_total_acc_x_train', 'Wpca1_total_acc_y_train', 'Wpca1_total_acc_z_train', 'Wpca1_body_gyro_x_train', 'Wpca1_body_gyro_y_train', 'Wpca1_body_gyro_z_train'};
predictors = inputTable(:, predictorNames);
response = inputTable.activity;
isCategoricalPredictor = [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false];

% Train a classifier
% This code specifies all the classifier options and trains the classifier.
template = templateSVM(...
    'KernelFunction', 'polynomial', ...
    'PolynomialOrder', 3, ...
    'KernelScale', 'auto', ...
    'BoxConstraint', 1, ...
    'Standardize', true);
classificationSVM = fitcecoc(...
    predictors, ...
    response, ...
    'Learners', template, ...
    'Coding', 'onevsone', ...
    'ClassNames', categorical({'Laying'; 'Sitting'; 'ClimbingStairs'; 'Standing'; 'Walking'}, {'Laying' 'Sitting' 'ClimbingStairs' 'Standing' 'Walking'}));

% Create the result struct with predict function
predictorExtractionFcn = @(t) t(:, predictorNames);
svmPredictFcn = @(x) predict(classificationSVM, x);
trainedClassifier.predictFcn = @(x) svmPredictFcn(predictorExtractionFcn(x));

% Add additional fields to the result struct
trainedClassifier.RequiredVariables = {'Wmean_body_gyro_x_train', 'Wmean_body_gyro_y_train', 'Wmean_body_gyro_z_train', 'Wmean_total_acc_x_train', 'Wmean_total_acc_y_train', 'Wmean_total_acc_z_train', 'Wpca1_body_gyro_x_train', 'Wpca1_body_gyro_y_train', 'Wpca1_body_gyro_z_train', 'Wpca1_total_acc_x_train', 'Wpca1_total_acc_y_train', 'Wpca1_total_acc_z_train', 'Wstd_body_gyro_x_train', 'Wstd_body_gyro_y_train', 'Wstd_body_gyro_z_train', 'Wstd_total_acc_x_train', 'Wstd_total_acc_y_train', 'Wstd_total_acc_z_train'};
trainedClassifier.ClassificationSVM = classificationSVM;
trainedClassifier.About = 'This struct is a trained model exported from Classification Learner R2019a.';
trainedClassifier.HowToPredict = sprintf('To make predictions on a new table, T, use: \n  yfit = c.predictFcn(T) \nreplacing ''c'' with the name of the variable that is this struct, e.g. ''trainedModel''. \n \nThe table, T, must contain the variables returned by: \n  c.RequiredVariables \nVariable formats (e.g. matrix/vector, datatype) must match the original training data. \nAdditional variables are ignored. \n \nFor more information, see <a href="matlab:helpview(fullfile(docroot, ''stats'', ''stats.map''), ''appclassification_exportmodeltoworkspace'')">How to predict using an exported model</a>.');

% Extract predictors and response
% This code processes the data into the right shape for training the
% model.
inputTable = trainingData;
predictorNames = {'Wmean_total_acc_x_train', 'Wmean_total_acc_y_train', 'Wmean_total_acc_z_train', 'Wmean_body_gyro_x_train', 'Wmean_body_gyro_y_train', 'Wmean_body_gyro_z_train', 'Wstd_total_acc_x_train', 'Wstd_total_acc_y_train', 'Wstd_total_acc_z_train', 'Wstd_body_gyro_x_train', 'Wstd_body_gyro_y_train', 'Wstd_body_gyro_z_train', 'Wpca1_total_acc_x_train', 'Wpca1_total_acc_y_train', 'Wpca1_total_acc_z_train', 'Wpca1_body_gyro_x_train', 'Wpca1_body_gyro_y_train', 'Wpca1_body_gyro_z_train'};
predictors = inputTable(:, predictorNames);
response = inputTable.activity;
isCategoricalPredictor = [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false];

% Set up holdout validation
cvp = cvpartition(response, 'Holdout', 0.25);
trainingPredictors = predictors(cvp.training, :);
trainingResponse = response(cvp.training, :);
trainingIsCategoricalPredictor = isCategoricalPredictor;

% Train a classifier
% This code specifies all the classifier options and trains the classifier.
template = templateSVM(...
    'KernelFunction', 'polynomial', ...
    'PolynomialOrder', 3, ...
    'KernelScale', 'auto', ...
    'BoxConstraint', 1, ...
    'Standardize', true);
classificationSVM = fitcecoc(...
    trainingPredictors, ...
    trainingResponse, ...
    'Learners', template, ...
    'Coding', 'onevsone', ...
    'ClassNames', categorical({'Laying'; 'Sitting'; 'ClimbingStairs'; 'Standing'; 'Walking'}, {'Laying' 'Sitting' 'ClimbingStairs' 'Standing' 'Walking'}));

% Create the result struct with predict function
svmPredictFcn = @(x) predict(classificationSVM, x);
validationPredictFcn = @(x) svmPredictFcn(x);

% Add additional fields to the result struct


% Compute validation predictions
validationPredictors = predictors(cvp.test, :);
validationResponse = response(cvp.test, :);
[validationPredictions, validationScores] = validationPredictFcn(validationPredictors);

% Compute validation accuracy
correctPredictions = (validationPredictions == validationResponse);
isMissing = ismissing(validationResponse);
correctPredictions = correctPredictions(~isMissing);
validationAccuracy = sum(correctPredictions)/length(correctPredictions);
