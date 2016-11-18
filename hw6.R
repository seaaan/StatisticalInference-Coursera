# Equivalence testing

# When you fail to reject the null hypothesis, the conclusion is that the data
# aren't surprising, assuming the null hypothesis is true. But that doesn't mean
# that the null hypothesis IS true

# Equivalence testing is statistical testing designed to determine whether there
# is evidence for a lack of a meaningful effect (as compared to a lack of 
# evidence for a meaningful effect, which could be a consequence of low power)

# Two one-sided t-tests
# Define upper and lower equivalence bounds (i.e. range in which effect is not
# meaningful) and do two one-sided tests to see whether the effect is larger
# than the lower bound and smaller than the upper bound

# In this system, the null hypothesis is that there IS an effect larger than the
# smallest effect size of interest and smaller than the largest effect size of 
# interest. The alternative hypothesis is that the effect is in the equivalence
# range. 

# Possible outcomes: 
#  - Significant effect (CI exceeds upper or lower bound)
#  - Equivalence (CI overlaps 0 and not upper or lower bound)
#  - Significant and equivalent (CI doesn't overlap 0 or upper or lower bound)
#  - Undetermined (CI overlaps 0 and upper or lower bound)
# Note: 90% CIs are used bc of two tests

# Q1) When the 90% CI around an effect size falls within the equivalence range, the
# observed effect is statistically smaller than the smallest effect size of interest. Based on
# your knowledge about confidence intervals, and looking at the picture above, when you
# lower the equivalence range from -0.5 – 0.5 to -0.3 – 0.3, what is needed for the
# equivalence test to be significant (assuming the effect size estimate remains the same)?
# A) A larger effect size
# B) A lower alpha level
# *C)* A larger sample size
# D) Lower statistical power

# The answer is a larger sample size bc the CIs need to shrink to fit within the
# smaller equivalence range.


# Q2) Researchers often manipulate something they are interested in. To ensure their
# manipulation does not inadvertently alter participants’ moods, they assess positive and
# negative emotions using the PANAS. Let’s assume in one specific experiment, positive
# mood in one condition (M1 = 4.55, SD1 = 1.05, n1 = 15) did not differ from the mood in the
# other condition (M2 = 4.87, SD2 = 1.11, n2 = 15). The researchers conclude: “Mood did not
# differ between conditions, t = 0.81, p =.42”. Let’s assume we consider any effect larger
# than d=-0.5 and smaller than d = 0.5 equivalent (even though d = 0.5 is actually a medium
#    effect size!). Use the spreadsheet for the independent t-test, and fill in the 8 numbers
# (note: you need to fill in -0.5, not 0.5, as the lower equivalence bound). Were the authors
# correct in concluding mood did not differ between conditions, given the equivalence
# range of -0.5 to 0.5?
# A) Yes
# *B)* No

# The lower band of the CI exceeds beyond the equivalence range to -0.99.

# Q3) If we increase the sample size in the above example to 150 participants in each
# condition, and assuming the means and standard deviations remain the same, which
# conclusion would we draw?
# A) Equivalent: The difference in mood is not statistically significant, and it is statistically
# equivalent.
# B) Undetermined: The difference in mood is not statistically significant, and it is not
# statistically equivalent.
# *C)* Not zero, and not meaningful: The difference in mood is statistically significant, and it
# is statistically equivalent.
# D) Not zero, and meaningful: The difference in mood is statistically significant, and it is
# not statistically equivalent.

# Q4) We used an equivalence range of d=-0.5 to d = 0.5 in the previous question, even with
# a sample size of 15 participants in each condition. One might wonder if that gave us
# sufficient statistical power to detect equivalence. In the TOST power analysis section of
# the independent t-test, use an alpha of 0.05, a desired power of 0.8, an equivalence range
# from -0.5 to 0.5, and assume the true effect size is d = 0. How many participants in each
# independent group would you need to have 80% power to detect equivalence with this
# equivalence range?

#> 69

# Q5) Change the equivalence range to -0.1 and 0.1. To be able to reject effect outside such
# a very narrow equivalence range, you’ll need a large sample size. With an alpha of 0.05,
# and a desired power of 0.9 (or 90%), and assuming a true effect size of 0, how many
# participants would you need in each group? 
#> 2165

# Bayesian approach
# Point prior = a prior of a single point estimate, rather than the usual distribution

#This code is for a one-sided t-test, testing a difference against 0.

N <- 100 #Enter sample size
dz <- -0.015 #Enter Cohen's dz effect size observed in the dependent t-test or one-sided t-test

dz_prior <- 0.09 #Enter effect size dz for the prior 
sd_prior <- 0.2 #Enter sd of the effect sizes of the prior - the higher, the wider the prior is

lo <- -Inf #lower bound of support (e.g., set to 0 if effects < 0 is not possible)
hi <- Inf #upper bound of support

#specify prior
altDens=function(delta) 
   dnorm(delta,dz_prior,sd_prior)*as.integer(delta>lo)*as.integer(delta<hi)
#Normalize alternative density in case user does not, 
K=1/integrate(altDens,lower=lo,upper=hi)$value
f=function(delta) K*altDens(delta)

delta=seq(-3,3,.01)
#Plot Alternative as a density and Null as a point arrow
#png(file=paste('prior.png'),width=6000,height=4000, res = 1000)
maxAlt=max(f(delta))
plot(delta,f(delta),typ='n',xlab="Effect Size Parameter Delta",ylab="Density",ylim=c(0,1.4*maxAlt),main="Models")
arrows(0,0,0,1.3*maxAlt,col='darkblue',lwd=2)
lines(delta,f(delta),col='darkgreen',lwd=2)
legend("topright",legend=c("Null","Alternative"),col=c('darkblue','darkgreen'),lwd=2)
#dev.off()

#Prediction Function Under Null
nullPredF=function(obs,N) dt(sqrt(N)*obs,N-1)

#Prediction Function Under the Alternative
altPredIntegrand=function(delta,obs,N) 
   dt(sqrt(N)*obs,N-1,sqrt(N)*delta)*f(delta)
altPredF=function(obs,N) 
   integrate(altPredIntegrand,lower=lo,upper=hi,obs=obs,N=N)$value

obs=delta
I=length(obs)
nullPred=nullPredF(obs,N)
altPred=1:I
for (i in 1:I) altPred[i]=altPredF(obs[i],N)

#Evaluate Predicted Density at Observed Value dz
valNull=nullPredF(dz,N)
valAlt=altPredF(dz,N)

#Plot The Predictions
#png(file=paste('posterior.png'),width=6000,height=4000, res = 1000)
top=max(altPred,nullPred)
plot(type='l',obs,nullPred,ylim=c(0,top),xlab="Observed Effect Size",ylab="Density",main=paste("Bayes factor (alt/null) is ",round(valAlt/valNull,digits =3)),col='darkblue',lwd=2)
lines(obs,altPred,col='darkgreen',lwd=2)
legend("topright",legend=c("Null","Alternative"),col=c('darkblue','darkgreen'),lwd=2)
abline(v=dz,lty=2,lwd=2,col='red')
points(pch=19,c(dz,dz),c(valNull,valAlt))
#dev.off()

cat("Bayes factor (alt/null) is ",valAlt/valNull,", the t-value is ",sqrt(N)*dz," and the p-value is",2*(1-pt(abs(sqrt(N)*dz),N-1)))

# Q6) In line 5, change the observed effect size to -0.015. Run the code, using the same
# prior. What can we conclude? The title of the figure provides the Bayes Factor for the
# alternative over the null (BF10). Remember that a Bayes Factor of 1 means both models
# are equally likely – values smaller than BF10 = 1 mean the null hypothesis is more likely.
# You can reverse the BF10 to reflect how much more likely the null is compared to the
# alternative (BF01) by computing 1/BF. When the Bayes factor is smaller than 0.333 or larger
# than 3, the Bayes Factor can be interpreted as modest support. When the Bayes factor is
# smaller than 0.1 or larger than 10 the Bayes Factor can be interpreted as strong support.
# When the Bayes factor falls within the 0.333 to 3 range, it is considered too weak support
# for either hypothesis to draw a conclusion on the data.

# The Bayes factor is 0.147; convert it to Bayes factor in favor of the null and
# get 1/0.147 = null is 6.8 times more likely than alternative

# A) The alternative model is more likely than the null model, with a BF10 of 0.147
# B) The alternative model is more likely than the null model, with a BF10 of 14.70
# *C)* The null model is more likely than the alternative model, with a BF10 of 0.147
# D) The null model is more likely than the alternative model, with a BF10 of 14.70

# Q7) In line 7, change the prior to an effect size of dz_prior = 0.09. Given this prior, can we
# still conclude that the Bayes Factor provides support for the null model for the remaining
# conditions, where the statistical test was t(99) = -0.15, dz = -0.015?
# A) With a BF10 = 7.365, the data now actually provide support for the alternative model,
# compared to the null model. 
# B) With a BF10 = 0.405, we can no longer conclude the data provide support for the null
# model, compared to the alternative model.
# *C)* With a BF10 = 0.405, the data provide support for the null model, compared to the
# alternative model. 

# Now the support for the null model is 1/0.405 = 2.47 times more likely