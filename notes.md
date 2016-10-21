# Improving your statistical inferences

## Introduction

Goal: become a better, more efficient researcher by better understanding statistical inference. 

When you collect data, the goal is to inform scientific theories. First you have to draw valid statistical inferences and then you can draw theoretical inferences. 

Topics: 
* Statistical tools for inference
* Experimental design
* Evaluating the evidence
* Cumulative science (replication, preregistration)

## Week 1: Overview

Statistical inference = use data from a *sample* to describe properties of the *population*
E.g. test a hypothesis, calculate a CI, estimate an effect size

Approaches to statistical inference: 
* Frequentist (Fisher vs Neyman-Pearson)
* Likelihood
* Bayesian

Recommended reading: 
Dienes, Z. (2008). Understanding psychology as a science: An introduction to scientific and statistical inference. Palgrave Macmillan.
Cumming, G. (2013). Understanding the new statistics: Effect sizes, confidence intervals, and meta-analysis. Routledge.
Nickerson, R. S. (2000). Null hypothesis significance testing: a review of an old and continuing controversy. Psychological methods, 5(2), 241-301.
An accessible introduction to hypothesis testing, Type 1 and Type 2 errors, power, and p-values can be found in most textbooks, but a clear open access summary is available in:
Banerjee, A., Chitnis, U. B., Jadhav, S. L., Bhawalkar, J. S., & Chaudhury, S. (2009). Hypothesis testing, type I and type II errors. Industrial Psychiatry Journal, 18(2), 127.

### Lecture 1.1

Approach to statistical inference (path of action; Neyman-Pearson frequentist): 
* Use rules to make sure that, over the long run, we won't be wrong too often
* Tells nothing about the current test, only the long run

Path of knowledge (likelihood): 
* Compare the likelihood of different hypothesis given the evidence at hand
* E.g. given 10 flips of a coin, what are the odds that it's a fair coin
* Calculate likelihood ratio
* Richard Royall, underlie Bayesian statistics without relying on pirors

Path of belief (Bayesion): 
* Incorporate prior beliefs about a phenomenon into your interpretation
* Express evidence in terms of degrees of belief

Fisher = use p-values as a measure of evidence (rather than as a rule for the long run)
* Neyman-Pearson is the better way to do it
* Most people understand p-values in Fisher's way

### Lecture: What is a p-value?

Goal of p-value: line of defense against being fooled by randomness
* p-values: measure of how surprising the data is, assuming there's no effect

Calculating p-value: calculate a test statistic from mean, SD and n, then compare it to some kind of distribution
* Assuming no effect means that you center the compared distribution at 0, with 1.96 and -1.96 representing 95% of the data
* Seeing data that fails in one of the tails (> 1.96 or < -1.96 means the data is surprising, assuming there is no true effect)

Definition: probability of getting the observed or more extreme data, assuming the null hypothesis is true
* no relation to whether the THEORY is true, only the probability of getting data that extreme
* i.e. p = 0.04 means there is a 4% probability that you would get the observed or more extreme data, assuming the null hypothesis is actually true
* Doesn't give you the probability that the null hypothesis is true.
** not the probability of the null hypothesis being true, given the data
** instead, it's the probability of the data being as or more extreme, given the null hypothesis 

p > 0.05 doesn't mean that there is no effect, just that the data aren't surprising

Using p-values correctly: a rule to guide behavior in the long run
* decision rule: act as if the data are not noise when p < alpha; remain uncertain/act if data is noise when p > alpha
* this will ensure that you won't be wrong more than alpha % of the time

Correct interpretation/statement: we found a p-value < 0.05, so our data... not "so our theory" 

P-values to expect when there is a true effect vs. when there is no effect: 
* true effect: p-value distribution depends on the statistical power
** with 50% power, half of the p values are below 0.05, >75% below 0.15
** with 80% power, 80% of the  p values are below 0.05, >95% below 0.15

* no effect: p-values are uniformly distributed (not tailed to the high end or normally distributed)
** every p-value is equally likely (INCLUDING less than 0.05), with 5% < 0.05

When there is no true effect, p-values are uniformly distributed. 
When there is a true effect, the p-value distribution depends on the power, and the higher the power, the more p-values fall below 0.05, and the steeper the p-value distribution becomes.

When you have very high power (>95%) and observe a p-value of 0.04 to 0.05, it means the data are surprising under the null hypothesis. However, it also means that the data are EVEN MORE surprising under the alternative hypothesis, because with such high power, p-values between 0.04 and 0.05 are even less likely under the alternative hypothesis than under the null hypothesis. = Lindley's paradox

### Lecture: Type 1 and Type 2 errors

Error control: prevent making a fool out of yourself too often in the long run
Type 1: false positive
Type 2: false negative

H0: null hypothesis
H1: alternative hypothesis

alpha = probability of a significant result when the null hypothesis is true
* type 1 error rate
beta  = probability of a non-significant result when the alternative hypothesis is true
* type 2 error rate

1 - beta = probability of a significant result when the alternative hypothesis is true 
* statistical power
* i.e. probability that you'll find the significant result when it's true
* true positive

1 - alpha = probability of a non-significant result when the null hypothesis is true
* true negative 

Error rates = frequentist concepts, about the long run, not the particular expt

            H0 true           |           H1 true
signif      false pos alpha      true positive 1-beta
nonsignif   true neg 1-alpha     false neg beta

Example: 
   Assume H0 and H1 have 50% probability, set alpha = 5%, 1-beta = 80%
   
      5  80 *  50% probability of each =  2.5   40
      95 20                               47.5  10
   So most likely result is to find a true negative. 
   
   How to improve? 
   * Increase statistical power to 99% and then true positive rate becomes 49.5% but still similarly likely to true negative
   * Find a better hypothesis (one that is more likely to be true, so H0:H1 is not 50:50)
   
Another way to think about type 1 and type 2 errors: 
   Imagine a normal curve centered at 0 representing H0. Then imagine another normal curve centered at 0.35 representing H1 (effect size 0.35). Each curve represents the results you would get from experiments given that the corresponding hypothesis is true. There will be a critical value, about 0.24, where for p = 0.05, experimental results above the value are deemed positive and below are deemed negative. You can then divide the two curves into 4 segments:
   * H0 curve, values below 0.24 = true negative
   * H0 curve, values above 0.24 = false positive
   * H1 curve, values below 0.24 = false negative
   * H1 curve, values above 0.24 = true positive
   
   The critical value is determined by how you set alpha and beta.

## Week 2: Overview

Likelihood approaches and Bayesian statistics quantify relative levels of evidence, with the Bayesian approach also incorporating prior information. 
Readings: 
The go-to book about likelihoods is by Royall (but regrettably, it is quite expensive).

Royall, R. (1997). Statistical Evidence: A Likelihood Paradigm. London?; New York: Chapman and Hall/CRC.

He provides a summary here:

Royall, R. (2004). The likelihood paradigm for statistical evidence. The nature of scientific evidence. Statistical, philosophical, and empirical considerations. University of Chicago Press, Chicago, Illinois, 119-152.

A nice tutorial introduction is given by Blume:

Blume, J. D. (2002). Likelihood methods for measuring statistical evidence. Statistics in Medicine, 21(17), 2563-2599.

And an applied book-length treatment can be found in:

Pawitan, Y. (2001). In all likelihood: statistical modelling and inference using likelihood. Oxford?: New York: Clarendon Press?; Oxford University Press.

Lecture 2.2 and Lecture 2.3

A good introduction to Bayesian statistics for the social science is provides by Jackman (Chapter 2 is closely related to Assignment 2.2).

Jackman, S. (2009). Bayesian analysis for the social sciences. Chichester, U.K: Wiley.

An article highlighting some of the strengths of Bayesian statistics is provided by Wagenmakers and colleagues. It specifically discusses the studies by Daryl Bem on pre-cognition we have described, and also touches on the need to distinguish confirmatory and exploratory research (see Lecture 3.3):

Wagenmakers, E.-J., Wetzels, R., Borsboom, D., & van der Maas, H. l. (2011). Why Psychologists Must Change the Way They Analyze Their Data: The Case of Psi: Comment on Bem (2011). Journal of Personality and Social Psychology, 100(3), 426-432.

Zoltan Dienes has an accessible introduction to how Bayes factors change the way you would make scientific inferences:

Dienes, Z. (2016). How Bayes factors change scientific practice. Journal of Mathematical Psychology. http://www.sciencedirect.com/science/article/pii/S0022249615000607

And a great tutorial handbook on Bayesian data analysis that focusses on Bayesian estimation instead of Bayesian hypothesis testing is written by Kruschke:

Kruschke, J. (2010). Doing Bayesian data analysis: A tutorial introduction with R. Academic Press.

### Lecture 2.1: Likelihoods

Likelihood = function of parameter given the data, so you can plot how likely something is given the data. 

E.g. flip a coin 10 times and get 8. So for a theta of 0.8, meaning that if you flipped it a million times, you'd get 800K heads, you can calculate the likelihood given the data (the ten coin flips). You get a likelihood of 0.30. You can also calculate it for other values of theta, such as 0.7 which has a likelihood of 0.23 given the data. The likelihood decreases as you move away from the data you observed. 

Typically plot likelihood against theta and see the likelihood distribution. 

Likelihood ratio = likelihood under H1 over likelihood under H0.
E.g. divide likelihood of theta of 0.8 by likelihood of theta of 0.5; gives ratio of 6.87. (Compare hypothesis that it's biased to 0.8 to hypothesis that it's a fair coin.) Compares likelihood of two hypotheses. 

Likelihood ratio of 8 = moderately strong evidence; 32 = strong evidence

Likelihood ratio gives relative evidence between two hypotheses -- both may still be extremely unlikely and then even if one is 100000X more likely than the other, they may both be irrelevant if both have a tiny likelihood compared to another hypothesis that is actually true. 

Calculating likelihood of observing the statistical results you observed from a series of experiments: 
H0 = no significant effect = alpha = theta = 0.05 (bc you'll get significance 5% of time)
H1 = significant effect = power = theta = 0.8

Likelihood of observing two significant studies out of three performed: 
   Under the assumption that H0 is true:
      0.05 * 0.05 * 0.95 = 0.0024
   
   Under the assumption that H1 is true: 
      0.8 * 0.8 * 0.2 = 0.128

   Likelihood ratio = 0.128 / 0.0024 = 54 times more probable that H1 is true

   Observation: multiple studies should give mixed results when H1 is true and you have 80% power -> 0.8 * 0.8 * 0.8 = 0.51 means you'll find three significant results from three studies done with 80% power only 50% of the time.  















