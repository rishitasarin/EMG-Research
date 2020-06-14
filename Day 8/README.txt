README

**Please note, we were on a strike on 6/10/2020**

Day 8 Overview (6/11/2020)
-Read the sensors paper. Annotated version can be found on OneNote.
	Overall Thoughts: This was quite  a dense paper, they didn't really explain the features they were using, which was kind of confusing.
	The main result of this experiment was that if we decrease the signal frequency from 1000 Hz to 200Hz, we lose out on some important 
	information which leads to lower classification accuracy rates. The reason this experiment was performed was because Myo armbands record 
	EMG at 200Hz which is much lower than that of 1000Hz in a clinical setting, so the researchers hypothesized that these armbands are probably
	not very accurate. They were right. Further investigation needs to be done on other factors that can affect the overall accuracy of these
	armbands. These include, but are not limited to, the position the forearm, muscle contraction effort, etc. 

-Looked at all the features mentioned in the paper and tried to code them in matlab (features_matlab_code.mlx). Some of the code was extracted from a Toolbox
available on Matlab File Exchange.

Day 9 Overview (6/12/2020)
-Looked up all the features mentioned in the sensors paper and the feature extraction paper
-After understanding each feature formula, coded it into Matlab independently
-Separated features into 4 categories:
	Signal Amplitude and Power Feature Group
	Frequency Information Feature Group
	Nonlinear Complexity Feature Group
	Time Series Modelling Feature Group
	Unique Feature Group
More detail can be found in the features_matlab_code.mlx file.
-Questions for Team: 
	1. L-scale? Sample Entropy?
	2. Difference between AR and CC?
	3. Function of MFL?
