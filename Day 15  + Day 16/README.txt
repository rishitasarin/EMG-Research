Day 15 Overview (6/25/2020)
- commented and cleaned up classification loop code
- Tried to add lscale feature - works really well; accuracy of 73.91% (tied for second best feature with RMS)
- Still having a bit trouble running the DFA feature

Day 16 Overview (6/26/2020)
- added mean freq, median freq, ssi, m2 as cases
- Having difficulty adding features that iterate through (ZC, SSC, MYOP, WAMP) - wrong array size could be the issue
	Need ZC to not output a singular number-- if in a loop through all of the time points, how many times does each pair cross zero.
	The difference between the two needs to be greater than the threshold to be taken into account.  Only counts if the slope passes the mentioned threshold. 
		The value that is acting as the threshold needs to be more carefully decided --- if the threshold value is something unachievable, all data will be excluded.
- Read paper testing hand gestures EMG  - "Analysis of Extracted Forearm" - Found in this folder

Next Step/Goals: work through error message 
Make a correlation matrix from this dataset - how much do these values correlate between each other
Start adding and learning about the features in new paper



CLASSIFICATION LOOP AND SUMMER 2020 EEG EPOCH FILES ARE IN DAY 12- 14 FOLDER