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