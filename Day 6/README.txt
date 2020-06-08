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
	

