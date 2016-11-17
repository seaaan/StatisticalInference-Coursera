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