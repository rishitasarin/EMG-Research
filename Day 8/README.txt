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
