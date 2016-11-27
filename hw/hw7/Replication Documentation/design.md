# Theoretical hypothesis
Movies directed by women receive lower ratings than movies directed by men. 

# Dependent variables
The only dependent variable will be IMDB rating because it is available through the OMDB API, which allows downloading results from IMDB through R without copy and pasting, allowing for a larger sample size. The independent variable will be gender of first listed director. 

Rating will be compared to gender in two ways: for the complete sample and for per-director ratings. In the latter case, the ratings of all movies in the data set from each director will be averaged and the per-director ratings compared rather than the per-movie ratings. This is intended to account for skewing of the data by unequal numbers of movies per director.

# Sample size
The first 500 movies containing the word "and" in the title and the first 500 movies containing the word "or" in the title will be used as the sample. (It's necessary to have something as a search term and those words were chosen as relatively neutral.) 1000 total movies was chosen as the sample size because it's feasible to download that many with the API and it's a nice round number. 

Assuming 5% of films are directed by women, this gives a a sample size of n = 50 for women and n = 950 for men. Gender of director will be determined using the "gender" package in R. Gender results will be considered indeterminate if the proportion of a given gender is less than 85% or unavailable. Indeterminate results will be manually coded for gender by looking up the directors (or filtered out if more than 50, for feasibility). 

Using the "pwr" package in R, we can calculate that this design has >95% power to detect an effect size of d = 0.5 at an alpha level of 0.05. The code is: 
   `pwr.t2n.test(950, 50, 0.5, alternative = "greater")`

Note that this calculation is using a one-sided t-test given my hypothesis that films directed by men will have higher ratings than those by women.

Assuming that calculating per-director ratings reduces the sample size by half, the power will be reduced to about 78% for detecting an effect of the same size.

# Statistical test
Two one-sided, independent t-tests ("Welch Two Sample t-test") will be performed and p-values less than 0.05 will be considered significant. One for per-movie ratings and one for per-director ratings. 