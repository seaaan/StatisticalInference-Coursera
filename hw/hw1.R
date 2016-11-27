# Load pwr package to easily calculate the statistical power
if(!require(pwr)){install.packages('pwr')}
library(pwr)
# Disable scientific notation (1.05e10)
options(scipen = 999)
# Set number of simulations
nSims  <-  100000 # number of simulated experiments

# Mean IQ score in the sample (will be compared with 100 in a one-sample t-test)
M <- 115
# sample size of the simulated data
n <- 8 
# SD of the simulated data
SD <- 15 

# With a mean difference of 6, and SD of 15, and a sample size of 26, the test 
# has 50% power)

p <- numeric(nSims) # set up empty variable to store all simulated p-values
bars <- 100

# Run simulation
for(i in 1:nSims){ # for each simulated experiment
   # Simulate data with specified mean, standard deviation, and sample size
   x <- rnorm(n = n, mean = M, sd = SD) 
   # perform the t-test against mu (set to value you want to test against)
   z <- t.test(x, mu = 100)
   # get the p-value and store it
   p[i] <- z$p.value 
}

# Check power by summing significant p-values and dividing by number of 
# simulations
(sum(p < 0.05) / nSims) # power
# Calculate power formally by power analysis
# determines M when power > 0. When power = 0, will set  M = 100.
power <- pwr.t.test(d = (M - 100) / SD, n = n, sig.level = 0.05,
   type = "one.sample", alternative = "two.sided")$power 

# Plot figure
# png(file = "P-valueDist.png", width = 4000, height = 3000, , units = "px", 
#     res = 500)
# change white-space around graph
op <- par(mar = c(5, 7, 4, 4)) 
hist(p, breaks = bars, xlab = "P-values", ylab = "number of p-values\n", 
   axes = FALSE, main = paste("P-value Distribution with", 
      round(power * 100, digits = 1), "% Power"),
   col = "grey", xlim = c(0, 0.05),  ylim = c(0, 10000))
axis(side = 1, at = seq(0, 1, 0.1), labels = seq(0, 1, 0.1))
axis(side = 2, at = seq(0, nSims, nSims/4), labels = seq(0, nSims, nSims / 4), 
   las = 2)
abline(h = nSims / bars, col = "red", lty = 3)
# dev.off()

# ? Daniel Lakens, 2016. 
# This work is licensed under a Creative Commons 
# Attribution-NonCommercial-ShareAlike 4.0 International License. 
# https://creativecommons.org/licenses/by-nc-sa/4.0/


# Q1: Since the statistical power is the probability of observing a 
# statistically significant result, if there is a true effect, we can also see 
# the power in the figure itself. Where?
#     A) We can calculate the number of p-values larger than 0.5, and divide 
#        them by the number of simulations.
#     *B)* We can calculate the number of p-values in the first bar (which 
#        contains all ‘significant’ p-values from 0.00 to 0.05) and divide the 
#        p-values in this bar by the total number of simulations.
#     C) We can calculate the difference between p-values above 0.5 minus the 
#        p-values below 0.5, and divide this number by the total number of 
#        simulations.
#     D) We can calculate the difference between p-values above 0.5 minus the 
#        p-values below 0.05, and divide this number by the number of 
#        simulations. 

# Q2: Change the sample size in line 10 from n <- 26 to n <- 51. Run the 
# simulation by selecting all lines and pressing CTRL+Enter. What is the power 
# in the simulation now that we have increased the sample size from 26 people 
# to 51 people?
#     A) 55% 
#     B) 60% 
#     *C)* 80%
#     D) 95%

# Q3) If you look at the distribution of p-values, what do you notice?
#     A) The p-value distribution is exactly the same as with 50% power
#     *B)* The p-value distribution is much steeper than with 50% power
#     C) The p-value distribution is much flatter than with 50% power
#     D) The p-value distribution is much more normally distributed than with 
#        50% power

# Q4) What would happen when there is no true difference between our simulated 
# samples and the average IQ score? In this situation, we have no probability 
# to observe an effect, so you might say we have ‘0 power’. Some people prefer 
# to say power is not defined when there is no true effect. I tend to agree, but
# we can casually refer to this as 0 power. Change the mean IQ score in the 
# sample to 100 (set M<-106 to M<-100 in line 9) There is now no difference 
# between the average IQ score, and the mean IQ in our simulated sample. Run the
# script again. What do you notice?
#     A) The p-value distribution is exactly the same as with 50% power
#     B) The p-value distribution is much steeper than with 50% power
#     *C)* The p-value distribution is basically completely flat (ignoring some 
#        minor variation due to random noise in the simulation)
#     D) The p-value distribution is normally distributed

# Q5) Look at the leftmost bar in the plot, and look at the frequency of 
# p-values in this bar. What is the formal name for this bar?
#     A) The power (or true positives)
#     B) The true negatives
#     *C)* The Type 1 error (or false positives)
#     D) The Type 2 error (or false negatives)

# Q6) The plot from the last simulation tells you we have 90.5% power. This 
# is the power if we use an alpha of 5%. But we can also use an alpha of 1%. 
# What is the statistical power we have in the simulated studies when we 
# would use an alpha of 1%, looking at the graph? Pick the answer closest to 
# the answer from your simulations.
#     A) ±90%
#     *B)* ±75%
#     C) ±50%
#     D) ±5%

# Q7) When you know you have very high (e.g., 98%) power for the smallest 
# effect size you care about, and you observe a p-value of 0.045, what is 
# the correct conclusion?
#     A) The effect is significant, and provides strong support for the 
#        alternative hypothesis.
#     B) The effect is significant, but it is without any doubt a Type 1 error.
#     C) With high power, you should use an alpha level that is smaller than 
#        0.05, and therefore, this effect can not be considered significant.
#     *D)* The effect is significant, but it is more likely that the null-
#        hypothesis is true, than that the alternative hypothesis is true.

# Q8) Play around with the sample size and the mean IQ in the group (lines 9 and
# 10, and thus, with the statistical power in the simulated studies). Look at 
# the simulation result for the bar that contains p-values between 0.04 and 
# 0.05. [...] At the very best, how much more likely is a p-value between 0.04 
# and 0.05 to come from a p-value distribution representing a true effect, than 
# it is to come from a p-value distribution when there is no effect? [...]
#     A) At best, p-values between 0.04 and 0.05 are equally likely under the 
#        alternative hypothesis, and under the null hypothesis.
#     *B)* At best, p-values between 0.04 and 0.05 are approximately 4 times  
#        more likely under the alternative hypothesis, than under the null 
#        hypothesis.
#     C) At best, p-values between 0.04 and 0.05 are ±10 times more likely under
#        the alternative hypothesis, than under the null hypothesis.
#     D) At best, p-values between 0.04 and 0.05 are ±30 times more likely under
#        the alternative hypothesis, than under the null hypothesis




