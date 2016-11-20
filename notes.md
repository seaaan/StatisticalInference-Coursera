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
Nickerson, R. S. (2000). Null hypothesis significance testing: a review of an old and continuing controversy. Psychological methods, 5(2), 241301.
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

When performing n studies, when power drops below n/(n+1) percent, or  increases above 1-(n/(n+1)), it's more likely that you'll observe mixed  results (i.e. some false negatives, some true positives) when you have a  true effect, than that you'll observe only true positives. E.g. if you do three studies, mixed results are more likely than uniform results with power between 0.25 and 0.75.

## Lecture: Binomial Bayesian Inference
Incorporating prior information into your probability estimation. E.g. a coin flipped to heads 3 times is still probably fair given prior knowledge that most are fair

P-value: probability of your data or more extreme data given assumption that null hypothesis is true = P(D | H0)
Posterior probability: probability of the null hypothesis being true given your data (and maybe prior beliefs) = P(H0 | D)
   Prior belief + data = posterior odds

   Posterior = Likelihood ratio * Prior
   P(H1|D)     P(D|H1)     P(H1)
   -------  =  -------  *  -----
   P(H0|D)     P(D|H0)     P(H0)

   So the ratio of the probabilities of the hypotheses given the data you observe is determined by the likelihood ratio (i.e. the probability of the data given the different hypotheses) multiplied by the ratio of the probabilities of the hypotheses independent of any data

Prior distribution = beta distribution for binomial distribution
   This is determined by parameters called alpha and beta
   alpha = 1, beta = 1, every value of theta is equally likely = no prior beliefs      -> uniform distribution
   alpha = 1, beta = 0.5, expect it almost always comes up heads                       -> peak at values of theta closest to theta = 1
   alpha = 50, beta = 50, expect it to be fair                                         -> normal-esque curve centered at theta = 0.5

Posterior is also a beta distribution, determined by new alpha and beta, which are determined by adding 
            alpha-posterior = alpha-prior + alpha-likelihood - 1
            beta-posterior = beta-prior + beta-likelihood - 1
   
   Given no prior beliefs (aka uniform prior), it will have no effect on the posterior beliefs, so they'll be entirely determined by the likelihood ratio. (since a uniform prior has alpha and beta of 1 and the calculation of the posterior parameters subtracts 1, you end up left with just the likelihood parameters)

Bayes factor = relative evidence for one model compared to another (always relative, never probability of truth of a hypothesis)
   (compared to likelihood ratio which has only one distribution and compares probability of different values within that one model)

   Compare prior to posterior distribution at whatever value of theta you choose = quantify how much your belief changed by collecting data

Bayesian estimation 
   Estimate which values are most likely, not Bayesian hypothesis testing
   Instead of testing two hypotheses (prior vs. posterior), estimate range of values that are most likely

   Plot prior and posterior distributions, then find which values of theta include 95% of the distribution -> 95% credible interval
   - With uniform prior, this will exactly match 95% confidence interval, because it will only be determined by the data
   - With non-uniform prior, the credible interval will be determined by both your prior and your data
   - 95% credible interval = values you find most plausible based on prior belief and the data 
   - 95% credible interval = area of the posterior distribution between the 0.025 and 0.975 quantiles
   - Frequentist CI = one true unknown value of the parameter. For a single confidence interval, the probability that it contains the true population parameter is either 0 or 1. Only in the long run will 95% of
confidence intervals contain the true population parameter
   - Bayesian credible interval = the parameter can vary: ‘I believe it is 95% probable (given my prior and the data) that the true parameter falls within this credible interval’
   - If the prior isn't representative of the truth, the credible interval won't be, but it will always be representative of your beliefs

Highest density interval: identical to 95% credible interval when posterior distribution is symmetrical; mathematically better when posterior distribution is skewed

Bayes vs. Likelihood
   Likelihood inference: compare different values of θ for the same likelihood 
                         curve (e.g., θ = 0.5 vs θ = 0.8) and calculate the 
                         likelihood ratio (how likely theta of 0.5 is compared
                         to how likely theta of 0.8 is)
   Bayesian inference:   compare the difference between the prior and the
                         posterior for the same value of θ, and calculate the 
                         Bayes Factor (how much your belief was changed by 
                         collecting the data)
                         
Bayes factor guidelines:
   * 1-3 = minimal
   * 3-10 = substantial
   * > 10 = strong
   * These reflect the size of the change in your belief, not the overall likelihood of the thing, so if something is extremely implausible and you see one study with a Bayes factor >10, it may still be very implausible overall because the Bayes factor is about the change in your belief, not the truth overall

## Lecture: Bayesian thinking (using Bayesian thought without formal quantification)
Taking prior probabilities into account is smart thinking
Medical test example: 
   3% of population is sick
   80% of sick people are identified by test
   13% false positive rate for test

   Prior probability: 
      P(sick) / P(not sick) = 0.03 / 0.97

   Data: 
      P(positive test given sick) / P(positive test given not sick) = 0.8 / 0.13
   
   Posterior probability:
      P(sick given positive test) / P(not sick given positive test) = 

      prior * data = 0.03     0.8     
                     ----  *  ----  =  0.19
                     0.97     0.13 

   i.e. when disease is not very prevalent, a positive test can still mean it's very unlikely the person is positive

Nomogram
   Left   axis = prior     probability that null hypothesis is true
   Middle axis = p value
   Right  axis = posterior probability that null hypothesis is true 

   Use: mark how likely you think it is that the null hypothesis is true on left axis
        mark p-value from the data you collected on the middle axis
        draw a line connecting the marks to the right axis

   Interpretation: intersection of line and right axis = likelihood of truth of null hypothesis given the data
      - This allows you to convert a p-value into a likelihood of the truth of a hypothesis by incorporating a prior probability

   If you have a very unlikely hypothesis or claim (e.g. ESP) and observe a study with a significant p-value, it can still be more likely than not that the null hypothesis is true when you combine the unlikely prior probability with the p-value

# Week 3: Error control
The quite recent, but already classic paper illustrating the problems of inflated Type 1 error rates is:

Simmons, J. P., Nelson, L. D., & Simonsohn, U. (2011). False-Positive Psychology: Undisclosed Flexibility in Data Collection and Analysis Allows Presenting Anything as Significant. Psychological Science, 22(11), 1359–1366. http://doi.org/10.1177/0956797611417632

A good discussion of Type 1 error control is provided by:

Rutherford, A. (2011). ANOVA and ANCOVA: a GLM approach (2nd ed). Hoboken, N.J: Wiley. Sections 3.6-3.10

If you want to use sequential analyses and benefit from their efficiency, without inflating type 1 error rates, I’ve written an accessible introduction:

Lakens, D. (2014). Performing high-powered studies efficiently with sequential analyses: Sequential analyses. European Journal of Social Psychology, 44(7), 701–710. http://doi.org/10.1002/ejsp.2023

A discussion of a way to directly control the false discovery rate can be found in:

Benjamini, Y., & Hochberg, Y. (1995). Controlling the false discovery rate: a practical and powerful approach to multiple testing. Journal of the Royal Statistical Society. Series B (Methodological), 289–300.

Lecture 3.2

Cohen gives an accessible introduction to power, and why it is important, here:

Cohen, J. (1992). Statistical power analysis. Current Directions in Psychological Science, 1(3), 98–101.

A good article on weighing how bad a Type 1 error or a Type 2 error is is provided by Fiedler and colleagues:

Fiedler, K., Kutzner, F., & Krueger, J. I. (2012). The Long Way From -Error Control to Validity Proper: Problems With a Short-Sighted False-Positive Debate. Perspectives on Psychological Science, 7(6), 661–669. http://doi.org/10.1177/1745691612462587

We discuss the importance of increasing the informational value of studies (either by improving the accuracy of estimates, or power analyses, and why large enough sample sizes are important) here:

Lakens, D., & Evers, E. R. K. (2014). Sailing From the Seas of Chaos Into the Corridor of Stability: Practical Recommendations to Increase the Informational Value of Studies. Perspectives on Psychological Science, 9(3), 278–292. http://doi.org/10.1177/1745691614528520

Assignment 3.2 is based on the two articles below:

Ioannidis, J. P. A. (2005). Why Most Published Research Findings Are False. PLoS Medicine, 2(8), e124. http://doi.org/10.1371/journal.pmed.0020124

Wacholder, S., Chanock, S., Garcia-Closas, M., El ghormli, L., & Rothman, N. (2004). Assessing the Probability That a Positive Report is False: An Approach for Molecular Epidemiology Studies. JNCI Journal of the National Cancer Institute, 96(6), 434–442. http://doi.org/10.1093/jnci/djh075

Lecture 3.3

As solutions to the file-drawer problem, registered reports have been proposed. The three articles below introduce this novel format, and discuss how it can improve science.

Nosek, B. A., & Lakens, D. (2014). Registered reports: A method to increase the credibility of published results. Social Psychology, 45(3), 137–141. http://doi.org/10.1027/1864-9335/a000192

Chambers, C. D., Feredoes, E., Muthukumaraswamy, S. D., & Etchells, P. (2014). Instead of“ playing the game” it is time to change the rules: Registered Reports at AIMS Neuroscience and beyond. AIMS Neuroscience, 1(1), 4–17.

Simons, D. J., Holcombe, A. O., & Spellman, B. A. (2014). An introduction to registered replication reports at perspectives on psychological science. Perspectives on Psychological Science, 9(5), 552–555.

## Lecture 3.1: Type 1 error control

Type 1 error: false positives

Multiple testing inflates type 1 error rate

Bonferroni/Dunn correction: divide alpha level by number of tests
   * Adjusting by multiplication of p values by number of tests leads to a distribution where most p-values are in the bin == 1

Familywise error rate: control only for the tests you care about (e.g. if you're doing a fancy anova that includes a bunch of tests but you only care about one of them)

Holm correction: slightly more efficient than Bonferroni correction (rank order p-values and multiple by inverse rank order)
   * Similar p value distribution to Bonferroni, but a gradual increase towards p = 1 before sharp increase at p = 1

Optional stopping: collect data until p < 0.05, inflates type 1 error
   * You could always get a significant result by doing this long enough
   * If the null hypothesis is true, but you look 5 times during data collection, stopping if p < 0.05, you get a weird p-value distribution with peaks below 0.05 with underrepresentation just above 0.05 

Correction for optional stopping
   * Can use a Bonferroni correction
   * Can use sequential analysis (e.g. Pocock correction) which is more efficient
   * If you control correctly, optional stopping can actually be a very efficient way to collect data
   * Pocock correction leads to a p-value distribution that still looks a bit strange, because it has some peaks in the lower bins below 0.05, but it also has underrepresentation in some of the higher bins below 0.05, so they sum to exactly 0.05 which keeps the alpha level at 0.05

Family-wise error rate = controls whether you ever make a mistake
False discovery rate = controls how often you make a mistake (Benjamini/Hochberg)

## Lecture: Type 2 error control

Type 2 error: false negatives
What is the chance that a follow-up study will replicate an effect? --> It depends on the power of the second study

Increase power: 
   * Decrease measurement error
   * Use within-subject design (i.e. pairing), especially effective when the within-measure correlation is high (> 0.5)
   * Increase variability in response options (i.e. measure with more detailed scale, 9 items vs 3 items [make participant rank 1-9 instead of 1-3])
   * Use one-sided tests if you have a directional prediction
   * Increase sample size

If replication studies are performed in science, type 1 errors will be identified
If we don't perform replication studies in cases where no effect is seen, then type 2 errors may go unnoticed

### Preregistration

Specify which types of tests and comparisons you're interested in ahead of time
Formalizes type 1 error control by preventing p-hacking and other issues
Distinguish confirmatory research from exploratory research
You can't test a hypothesis on the same data used to generate the hypothesis

Components of a preregistration
   * Justify your sample size (possibly including creating a stopping rule)
   * Specify independent and dependent variables for each test
   * Describe the analysis plan (alpha, data cleaning, types of statistical tests)

Preregistration has the benefit of allowing you to improve your study design before doing the study, unlike with traditional peer review
Also allows less conventional but more efficient designs (e.g. one-sided tests, multiple looks for stopping, both of which are more convincing if you state the prediction in advance)

# Week 4: Effect sizes

Suggested reading: 
Grissom, R. J., & Kim, J. J. (2012). Effect sizes for research: univariate and multivariate applications (2nd ed). New York: Routledge.

The book by Cumming (2013) mentioned earlier has excellent discussions on effect sizes (primarily focusing on Cohen’s d).

Cumming, G. (2013). Understanding the new statistics: Effect sizes, confidence intervals, and meta-analysis. Routledge.

I’ve written a practical primer on effect sizes, which you can find here:

Lakens, D. (2013). Calculating and reporting effect sizes to facilitate cumulative science: a practical primer for t-tests and ANOVAs. Frontiers in Psychology, 4. http://doi.org/10.3389/fpsyg.2013.00863

Another practical introduction, focusing on contrasts, is provided by:

Rosnow, R. L., & Rosenthal, R. (2009). Effect Sizes: Why, When, and How to Use Them. Zeitschrift Für Psychologie / Journal of Psychology, 217(1), 6–14. http://doi.org/10.1027/0044-3409.217.1.6

An accessible book-level treatment of the topic can be found in:

Ellis, P. D. (2010). The essential guide to effect sizes: statistical power, meta-analysis, and the interpretation of research results. Cambridge ; New York: Cambridge University Press.

Effect sizes: 
	* Communicate practical significance of results (differentiate statistical significance from practical significance)
	* Calculate meta-analytic conclusions by combining results of multiple studies
	* Allow you to perform power analyses

Unstandardized effect sizes: just the difference between the groups
Standardized effect sizes: eg if you measure happiness on a scale of 1-7 and another group uses 1-5, then a value of 4 means different things in each case, so you can more effectively compare the two studies by calculating a standardized effect size

Families of effect sizes: 
	* d family = standardized effect sizes
	* r family = measures of association

## Lecture 4.2: Cohen's d
Standardized mean differences in terms of standard deviation
Difference in means between groups divided by the standard deviation, so a mean difference equal to the standard deviation gives d = 1
	0 = no effect
	∞ = colossal effect

One benchmark: 
	0.2 = small
	0.5 = medium
	0.8 = large
	- Even at 0.8, the groups will overlap considerably

Variations of Cohen's d: 
	within subject, correlated within, etc.
	Lakens 2013 article about slightly different version of Cohen's d for different situations

Hedges' g: unbiased version of Cohen's d, which is d multiplied by a correction factor that depends on the sample size. Otherwise Cohen's d slightly overestimates the effect size

Cohen's d can be calculated from t and n, so you can calculate it even if it's not reported

## Lecture 4.3: Correlations
Benchmarks for r
	0.1 small
	0.3 medium
	0.5 large

Range: -1 to 1

d can be converted to r and vice versa

R^2 and eta^2 represent the proportion of total variance explained by an effect from regression and anova
omega^2 and epsilon^2 are less biased versions of these factors

epsilon^2 is the least biased (Okada 2013)

Conceptually, what do they mean? How much does the relationship between x and y decrease the error between them
Cohen's f can be calculated from eta^2

Subscript p of each of the factors above is useful for experiments where you're only interested in the effect of one variable on explaining variation
	"partial eta squared" vs "eta squared"
	
## Week 5

### Suggested readings
Lecture 5.1

A very complete and accessible explanation of confidence intervals can be found in the two articles below:

Cumming, G., & Finch, S. (2001). A Primer on the Understanding, Use, and Calculation of Confidence Intervals that are Based on Central and Noncentral Distributions. Educational and Psychological Measurement, 61(4), 532–574. http://doi.org/10.1177/0013164401614002

Cumming, G., & Fidler, F. (2009). Confidence Intervals: Better Answers to Better Questions. Zeitschrift Für Psychologie / Journal of Psychology, 217(1), 15–26. http://doi.org/10.1027/0044-3409.217.1.15

Some criticisms on Frequentist confidence intervals from a Bayesian perspective can be found in:

Morey, R. D., Hoekstra, R., Rouder, J. N., Lee, M. D., & Wagenmakers, E.-J. (2016). The fallacy of placing confidence in confidence intervals. Psychonomic Bulletin & Review, 23(1), 103–123.

Lecture 5.2

An excellent introduction to sample size planning is provided by Maxwell and colleagues:

Maxwell, S. E., Kelley, K., & Rausch, J. R. (2008). Sample Size Planning for Statistical Power and Accuracy in Parameter Estimation. Annual Review of Psychology, 59(1), 537–563. http://doi.org/10.1146/annurev.psych.59.103006.093735

To learn more about power and power analysis, the go-to book is Cohen:

Cohen, J. (1988). Statistical power analysis for the behavioral sciences (2nd ed). Hillsdale, N.J: L. Erlbaum Associates.

If you start to use G*power for sample size planning based on power analysis, read:

Faul, F., Erdfelder, E., Lang, A.-G., & Buchner, A. (2007). G* Power 3: A flexible statistical power analysis program for the social, behavioral, and biomedical sciences. Behavior Research Methods, 39(2), 175–191.

Lecture 5.3

If you want to learn about using p-curve analysis in more detail, read the article introducing the technique. Definitely read it carefully before performing and interpreting your first p-curve analysis.

Simonsohn, U., Nelson, L. D., & Simmons, J. P. (2014). P-curve: A key to the file-drawer. Journal of Experimental Psychology: General, 143(2), 534.

A highly related statistical technique, p-uniform, is described here:

van Assen, M. A. L. M., van Aert, R. C. M., & Wicherts, J. M. (2015). Meta-analysis using effect size distributions of only statistically significant studies. Psychological Methods, 20(3), 293–309. http://doi.org/10.1037/met0000025

### Lecture 5.1: Confidence intervals

When you generalize from a sample to the population, there is always uncertainty, which needs to be reported to allow interpretation of the point estimate of the effect. 

95% confidence intervals = percentage of future confidence intervals that would contain the true parameter value 
   i.e. 95% of the confidence intervals calculated in this way will capture the true parameter value
   A single confidence interval either contains the population parameter or it doesn't
   - It's the mean +/- (a critical value multiplied by the standard error)
      The critical value is determined by the percentage you want (1.96 for 95%)
   - It doesn't mean that 95% of future estimates will fall within the confidence interval you calculated. A confidence interval is a statement about future confidence intervals, not about future estimates.
   - Capture percentage: percentage of subsequent estimates that will fall within a given CI. I.e. you have calculated your estimate and CI, if you did a bunch more studies, what percentage of the future estimates would fall in your CI? (it averages 84.3% of the time for a 95% CI based on simulation) 95% of future CIs will contain the true population parameter, capture percentage is about what percentage of future estimates will be inside your current CI. Capture percentage is 95% only when your estimate happens to be exactly the population value.
   If a confidence interval doesn't contain zero, -> p < 0.05

Bayesian statistics: credible intervals or highest density intervals
   - 95% credible interval = all values you find most plausible (quantifying your belief)

### Lecture 5.2: Sample size justification

Small samples have large variation, more type 2 errors (false negatives) and inaccurate estimates of the population value

Cool graph from Schonbrodt and Perugini where they calculated an effect size after each participant of a 150 person study and compared it to simulated versions of the same study and show how the effect size becomes more reliable as the study size increases

Approaches to sample size estimation: 
   * Plan for accuracy (design the study based on the width of the CIs you want for the estimate)
   * Plan for statistical power (design the study to have a certain probability of finding p < 0.05)
      * for a d = 0.5 you need to do 50 people per group for 80% power
      * Estimating expected effect sizes based on the literature requires caution due to publication biase
      * When you don't have good estimates of expected effect sizes, use sequential analysis
   * Plan for feasibility (design the study based on resources available)

Bayesian statistics doesn't require declaring sample size in advance
   * Much more flexible, but lacks an easy way to control type 1 errors

### Lecture 5.3: P-curve analysis

Meta-analytic tool to judge the evidential value of sets of studies in the literature
No true effect -> uniform p-value distribution
True effect ----> depends on statistical power of the test, but expect a right skew, with small p-values being more likely than higher ones

P curve analysis: test whether a set of p-values contains strong evidence. Test only performed on studies with p < 0.05, which helps account for publication bias. Compares whether the p-value distribution looks more uniform or whether small p-values are more likely than higher ones

p-curve.com allows you to perform the tests online

Question: does the p-value distribution look like one with or without an effect? 
   Typically compare it to a null-distribution of no effect (uniform) or a distribution of real effect with low power, say 33%

P-curve analysis cannot prove whether an effect is real or not, but gives you an indication of how strong the current evidence is
   * "A theory might still be true, the data just don't provide evidence for the theory"
   
## Week 6

### Suggested readings
A great paper by Paul Meehl on philosophy of science, applied to psychology, is:

Meehl, P. E. (1990). Appraising and amending theories: The strategy of Lakatosian defense and two principles that warrant it. Psychological Inquiry, 1(2), 108–141.

Philosophy of science is a large topic, that often requires a book-length treatment. Some popular books are listed below:

Hull, D. L. (2010). Science as a process: an evolutionary account of the social and conceptual development of science. University of Chicago Press.

Ladyman, J. (2002). Understanding philosophy of science. London; New York: Routledge.

Godfrey-Smith, P. (2003). Theory and reality: an introduction to the philosophy of science. Chicago: University of Chicago Press.

Lecture 6.2

Abelson nicely explains why critics who say the null is always false are overstating their case:

Abelson, R. P. (1997). On the Surprising Longevity of Flogged Horses: Why There Is a Case for the Significance Test. Psychological Science, 8(1), 12–15. http://doi.org/10.1111/j.1467-9280.1997.tb00536.x

Similarly, Hagen has written an article ‘In Praise of Null-Hypothesis Significance Testing’ where he explains some strengths of the procedure:

Hagen, R. (1997). In praise of the null hypothesis statistical test. The American Psychologist, 52(1), 15–24.

Finally, the article recommended previously by Nickerson discusses this topic in detail:

Nickerson, R. S. (2000). Null hypothesis significance testing: a review of an old and continuing controversy. Psychological methods, 5(2), 241-301.

A good review on equivalence testing (related to Assignment 6.1) can be found here:

Meyners, M. (2012). Equivalence tests – A review. Food Quality and Preference, 26(2), 231–245. http://doi.org/10.1016/j.foodqual.2012.05.003


Lecture 6.3

The book on Theory Construction I recommend in the lecture is:

Jaccard, J., & Jacoby, J. (2010). Theory Construction and Model-building Skills: A Practical Guide for Social Scientists. Guilford Press.

The article by McGuire I discuss is:

McGuire, W. J. (2004). A Perspectivist Approach to Theory Construction. Personality and Social Psychology Review, 8(2), 173–182. http://doi.org/10.1207/s15327957pspr0802_11

An excellent, must-read article on theory construction by Klaus Fiedler is:

Fiedler, K. (2004). Tools, toys, truisms, and theories: Some thoughts on the creative cycle of theory formation. Personality and Social Psychology Review, 8(2), 123–131.

## Philosophy of science

"If a theory is falsifiable, then it is scientific." -Popper
"A given fact is explained scientifically only if a new fact is predicted with it." -Lakatos

Modus tollens ("denying the consequent"): 
   if p then q
   not p
   therefore not q
   
   if theory then data
   not data
   therefore not theory

Affirming the consequent -> illogical, but tempting!
   if p then q
   q 
   therefore p

A theory can be refuted or corroborated, but never proven. 
When inferences are based on statistics, falsifications are not black and white. 
   
Rejecting a theory based on falsifying evidence   
   * We also often don't reject a theory based on a single falsification
   * Often need a better, alternative theory to replace a current theory which is somewhat useful
   * To some extent, you may be falsifying _other_ theories rather than your main theory (such as assumptions about data collection, experimental method, etc.)
   ** I.e. you have a core theory, surrounded by associated theories that may be falsified without actually falsifying your core theory
   ** However, attaching new conditions to your core theory every time you do an experiment is the sign of a degenerative research line, where you're just trying to keep your theory alive, since your theory isn't making new and valid predictions
   
Kuhn believes that you can't have objective science, where all observations are theory-laden and practicitioners of different theories work in different worlds
   * Science progresses with periodic revolutions that upend everything that came before
   
More modern view:
   Public avenues for criticism, shared standards, open to reevaluation, equality 
   
## The null is always false

With large enough samples, the null is always false. 

Random assignment = reasonable place to use the null hypothesis
   * Assuming you randomly assign subjects to two groups and the only difference is your intervention, then the null hypothesis is a very reasonable assumption to test against
   
Measured variables
   * Instead of randomizing people to groups, your groups are natural, such as gender
   * Since you can't randomly assign people to gender, the null hypothesis is a less reasonable assumption because there are likely some true effects of natural groups or other things that vary in association with , they may just be very small
   * Systematic noise ("crud factor") is present in most data and not necessarily related to the dependent variable = true effects you're not interested in
   
After randomization, the null is a useful model, but without randomization, it is not a very useful model because there very often is an effect and rejecting the null hypothesis has little bearing on your theory
   * The null hypothesis is a weak hypothesis without randomization and rejecting it is not impressive
   * It is more impressive to match a specific prediction than reject the null hypothesis by showing ANY effect
   * Confirming strong hypotheses is more useful for supporting a theory
   * Rather than rejecting the null hypothesis, better to compare two hypotheses

Confirmation bias = systematic bias in inductive reasoning 

But what experiment could disprove your hypothesis?
   
### Lecture 6.3: Theory construction   

Theory   <--->    Statistical hypothesis  <--->    Data
      corroboration                      inference
      (theoretician)                     (statistician)

Scientific theory = set of testable statements about the relation between observations

Theory generation: 
   * Thought experiments
   * Personal experiences
   * Put yourself in someone else's shoes and ask what drives their behavior
   * Observation
   * Use metaphors
   * Ask why and how
   * Have broad interests and be inspired by other disciplines and culture

Theory formalization: 
   * Use words, figures, numbers
   * Define the boundary conditions of the effect (when would the opposite of your prediction be true)

Scientific cycle:
   * Loosening stage  = hypothesis generation
      What would a theory really imply?
      Play around with methods/assays and data
      Simulate data or explore datasets
   * Tightening state = hypothesis testing
      Determine whether the hypothesis is correct or not

## Week 7: Open science, replication, and publication bias
Lecture 7.1

An excellent overview of what replication is, why we should do it, is provided by:

Schmidt, S. (2009). Shall we really do it again? The powerful concept of replication is neglected in the social sciences. Review of General Psychology, 13(2), 90–100. http://doi.org/10.1037/a0015108

A practical approach to designing replication studies is provided by:

Brandt, M. J., Ijzerman, H., Dijksterhuis, A., Farach, F. J., Geller, J., Giner-Sorolla, R., … Van’t Veer, A. (2014). The replication recipe: What makes for a convincing replication? Journal of Experimental Social Psychology, 50, 217–224.

An explanation of why replication studies are important, but not rewarded enough in science, is provided in:

Koole, S. L., & Lakens, D. (2012). Rewarding Replications A Sure and Simple Way to Improve Psychological Science. Perspectives on Psychological Science, 7(6), 608–614. http://doi.org/10.1177/1745691612462586


Lecture 7.2

The classic paper on the file-drawer problem by Rosenthal is:

Rosenthal, R. (1979). The file drawer problem and tolerance for null results. Psychological Bulletin, 86(3), 638.

Another classic excellent paper, which also contains some empirical data, is published by Greenwald:

Greenwald, A. G. (1975). Consequences of prejudice against the null hypothesis. Psychological Bulletin, 82(1), 1.

A good introduction to publication bias can be found in:

Ferguson, C. J., & Heene, M. (2012). A vast graveyard of undead theories publication bias and psychological science’s aversion to the null. Perspectives on Psychological Science, 7(6), 555–561.

An empirical examination of publication bias can be found in:

Fanelli, D. (2012). Negative results are disappearing from most disciplines and countries. Scientometrics, 90(3), 891–904. http://doi.org/10.1007/s11192-011-0494-7

A funny satirical piece, responding both the the article by Daryl Bem, and the article by Wagenmakers et al recommended for Lecture 2.2, is:

Bones, A. K. (2012). We Knew the Future All Along Scientific Hypothesizing is Much More Accurate Than Other Forms of Precognition—A Satire in One Part. Perspectives on Psychological Science, 7(3), 307–309. http://doi.org/10.1177/1745691612441216


Lecture 7.3

An article discussing how open science can lead to a scientific utopia is:

Nosek, B. A., & Bar-Anan, Y. (2012). Scientific Utopia: I. Opening Scientific Communication. Psychological Inquiry, 23(3), 217–243. http://doi.org/10.1080/1047840X.2012.692215

An article discussing how peer reviewers can promote open science is here:

Morey, R. D., Chambers, C. D., Etchells, P. J., Harris, C. R., Hoekstra, R., Lakens, D., … others. (2016). The Peer Reviewers’ Openness Initiative: incentivizing open research practices through peer review. Royal Society Open Science, 3(1), 150547.

### Lecture 7.1 replications

There is no such thing as an exact replication. 

Direct replication = try to keep everything as similar as possible (replicate finding)
Conceptual/theoretical replication = trying to test same underlying hypothesis in a new way (replicate theory)

Goal 1: Identify type 1 errors
Goal 2: Control artifacts (lack of internal validity, e.g. depends on that one bottle of buffer in your lab)
Goal 3: Generalize to new populations
Goal 4: Verify underlying hypothesis

Failed replication != untrue theory

Troubling trio = low power, high p-value, surprising result; study to be skeptical of

Metascience/collaborative multi-lab replications are especially valuable

In addition to replication, it's a good idea to add an extension (something else)