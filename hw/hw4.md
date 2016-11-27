## Homework 4: Effect sizes

### Cohen's d and friends

Q1) Below the graph, you see some ways to interpret Cohen’s d in non-mathematical terms (the summary is provided about a number of people, but in our case, we are examining numbers of words). How many words (rounded to a whole number) does a person need to type before 1 word will be more negative (instead of positive)? 

3570 words

Q2) Assume we know that people are more likely to comply with a large request after an initial smaller request, than when you ask the large request directly (this is known as the foot-in-the-door effect), and that in a specific context this effect size is 0.43. Given this effect size, how likely is it that a random person is drawn from the ‘small initial request condition’ will be more likely to agree with your larger request, compared to a person in the ‘no initial small request’ condition? (use the slider to answer this question, and round to a whole number – answer by typing in only the number without a %)

62

Q3) Now set the slider to a Cohen’s d of 2. Based on this data, the difference between the height of 21-year old men and women in The Netherlands is approximately 13 centimeters (in an unstandardized effect size), or a standardized effect size of d = 2. If I pick a random man and a random woman walking down the street in my hometown of
Rotterdam, how likely is it that the man will be taller than the woman (round the percentage to a whole number – answer by typing in only the number without a %)? 

92

Q4) Let’s assume the difference between two means we observe is 1, and the pooled standard deviation is also 1. What, on average, happens to the t-value and Cohen’s d, as we would simulate studies, as a function of the sample size in these simulations?
A) Given the mean difference and standard deviation, as the sample size becomes bigger, the t-value become larger, and Cohen’s d becomes larger.
B) Given the mean difference and standard deviation, as the sample size becomes bigger, the t-value gets closer to the true value, and Cohen’s d becomes larger.
C) Given the mean difference and standard deviation, as the sample size becomes bigger, the t-value become larger, and Cohen’s d gets closer to the true value.
D) Given the mean difference and standard deviation, as the sample size becomes bigger, the t-value gets closer to the true value, and Cohen’s d gets closer to the true value.

??? c ??? Cohen's d doesn't change with sample size

Cohen's d overestimates the population-level effect when based on sample.
Hedges' g corrects for this bias. (aka d_unbiased)
Common language effect size = probability that someone sampled from the treatment group will have a higher value than someone sampled from the control group
   * Can also be used within-group by comparing measurement 1 to measurement 2 instead of person 1 to person 2
   

### Correlations

Q5) Given that r = 0.21 was the average effect size in psychological research, how much
variance in the data do we on average explain?
A) 2.1%
B) 21%
*C) 4.4%* (because 0.21 * 0.21 = 0.044 = r^2)
D) 44%

Q6) By default, the sample size on the website is 100. Change it to 500. What happens?
A) The proportion of explained variance is 5 times as large.
B) The proportion of explained variance is 5 times as small.
C) The proportion of explained variance is 52 times as large.
*D) The proportion of explained variance stays the same.*

Q7) What do you think of the likelihood that listening to country music is strongly associated with higher suicide rates? Is country music really that bad? Write down your thoughts in a single sentence.

It is more likely that listening to country music is associated with other variables that increase the risk of suicide than that country music itself predisposes to suicide. 

Eta squared (η²) is an extension of r^2 that can be used for more than just two sets of observations. It reflects the total amount of variation in the y-variable that is explained by all the other variables.
epislon^2 is a less biased estimate of eta^2, as is omega^2

Q8) Download the spreadsheet from https://osf.io/sjgv4/. For a result of F (1,38) = 6.3,
when all variables are manipulated, what is the partial epsilon squared effect size?
*A) 0.142*
B) 0.117
C) 0.120

Q9) Imagine you have performed an independent t-test. There are 28 participants in each
condition. In the control group, the mean is 4.1 and the standard deviation is 1.1. In the
experimental group, the mean is 4.8 and the standard deviation is 1.3. Use the
spreadsheet from https://osf.io/vbdah/ to determine what the effect size Hedges’ g is.
A) 0.57
B) 0.58
*C) 0.59*
D) 0.66

Q10) You read a paper in the literature. All the results that are provided for an
independent t-test are the t-value of 2.9, and the total sample size of 244. Use the
spreadsheet to determine the best estimate of the effect size Cohen’s d you can make
based on the available data:
A) 0.004
*B) 0.37*
C) 0.24
D) 0.60