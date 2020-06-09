README

Day 6 Overview (6/8/2020)
Worked on extension of Neurotech Week 11 Assignment, Option B - MATLAB
- Goal: Attain best classification rates for argry vs smile conditions
	By rewriting the week 11 code, I gained a deeper understanding of the code itself and ML
	Added new features to extract: 
		maximum signal (MPV)
		mean of the absolute value of the signal (MAV)
		mmav1 - extension of MAV with weighing factor
		root mean square (RMS) 
		variance of the signal
		bandpower 2- 20 Hz
		bandpower 20 -40 Hz
		bandpower 40 - 56 Hz
		bandpower 64 - 110 hZ
	Had trouble setting up cases for the following features:
		integrated EMG (iEMG) 
		simple squared integral (SSI)
	Will use classification learner and play around with parameters:
		type of classification algorithm
		best features to select
		optimal time window
	

Day 7 Overview (6/9/2020)
Finished working on extension of Neurotech Week 11 Assignment, Option B - MATLAB
- Goal: Attain best classification rates for argry vs smile conditions
	Loaded traindata in classificationLearner.
	Played around with predictors to see where the blue and red dots were separated the most.
		When these combinations of predictors were found, those were selected in the feature selection menu.
	For each feature selection combo, I played around with multiple classification models
		Linear Discriminant
		Quadratic Discriminant
		Linear SVM
		Quadaratic SVM
		Fine Guassian SVM
		Fine KNN
		Fine Tree
		Medium Tree
	The two feature selection combos which had the highest accuracy rates were: 
		FEAT_ch1_mpv + FEAT_ch2_absmean (81.5% with Linear SVM)
		FEAT_ch1_bp20t40, FEAT_ch2_rms (79.3%  with Linear SVM)
	From here, I deduced that linear SVM will probably achieve the highest accuracy. 
	Then, I combined all 4 of these features and ran it with linear SVM to get an accuracy rate of 82.6%.
		Thus, I realized that some combo of these 4 would maybe yield an even higher accuracy rate.
	Higest accuracy rate was achieved with the following combination. (84.8%)
		Linear SVM
		FEAT_ch1_mpv + FEAT_ch1_bp20t40 + FEAT_ch2_absmean
	I exported the model into my MATLAB workspace and ran it with my test data. Results can be found in the angry_smiling.mlx file.

Worked on MATLAB file to explain iEMG
-iEMG means integrated EMG. This is the sum of the absolute value of raw EMG data. We use it to understand a raise in signal power and amplitude.


