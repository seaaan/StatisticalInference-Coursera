library(ggplot2)

#Simulate one group
n = 100000 #set sample size
x <- rnorm(n = n, mean = 100, sd = 15) #create sample from normal distribution

#plot data
ggplot(as.data.frame(x), aes(x))  + 
   geom_histogram(colour="black", fill="grey", aes(y=..density..), binwidth=2) +
   stat_function(fun=dnorm, args=c(mean=100,sd=15), size=1, color="red", lty=2) +
   #  geom_density(fill=NA, colour="black", size = 1) +
   xlab("IQ") + ylab("number of people")  + ggtitle("Data") + 
   theme_bw(base_size=20) + 
   theme(panel.grid.major.x = element_blank(), axis.text.y = element_blank(), panel.grid.minor.x = element_blank()) + 
   geom_vline(xintercept=mean(x), colour="gray20", linetype="dashed") + 
   coord_cartesian(xlim=c(50,150)) + 
   scale_x_continuous(breaks=c(50,60,70,80,90,100,110,120,130,140,150)) +
   annotate("text", x = mean(x), y = 0.02, label = paste("Mean = ",round(mean(x)),"\n","SD = ",round(sd(x)),sep=""), size=8)

# Q1) What is the difference in IQ points between the highest and the lowest 
# mean from your 10 simulations? 
samples <- lapply(1:10, function(x) rnorm(n = n, mean = 100, sd = 15))
means <- sapply(samples, mean)

max(means) - min(means)
#> 15.35

# Q2) The variability in the means is determined by the standard deviation of the measurement. In real life, the standard deviation can be reduced by for example using multiple and reliable measurements (which is why an IQ test has not just one question, but many different questions). It’s not always possible to reduce the standard deviation in the real world, but it is possible in our simulation. Change the sd = 15 in line 7 to sd = 2. And simulate 10 new samples. What happens?
# A) There is no difference between the means when sd = 15 compared to when sd = 2.
# B) There is no difference between the standard deviations when sd = 15 compared to when sd = 2.
# C) With sd = 2, the variation in means has increased substantially compared to sd = 15.
# *D)* With sd = 2, the variation in means has decreased substantially compared to sd = 15.
samples <- lapply(1:10, function(x) rnorm(n = n, mean = 100, sd = 2))
means <- sapply(samples, mean)
sds <- sapply(samples, sd)

max(means) - min(means)
#> 2.41

# Q3) Simulate at least 10 samples with n = 10, and 10 samples with n = 100. Look at the distribution of the data you have simulated. Which statement below is true?
# A) With small samples, it is very clear the data does not come from a population where IQ scores are normally distributed.
# B) With small samples, it is very clear the data comes from a population where IQ scores are normally distributed.
# *C)* The data always come from a population where IQ scores are normally distributed, but this is very difficult to see, especially when n = 10, but sometimes also when n = 100.
# D) The data always come from a population where IQ scores are normally distributed. This can easily be seen when we compare the true population normal distribution (the red dotted line) against the data.

# Calculating n: 
# If you know 
#     % of means to fall in desired range (e.g. 95% in +/- 2)
#     sd of data
# Convert % CI to z-score (eg 95% -> 1.96) and use
#     n = Z * (sd / range)^2
#     eg. n = 1.96 * (15 / 2)^2 for IQ range 98-102. 

#to get emoticons for each test, set wait to 1 and showfaces to 1. 
#When running large number of simulations, se wait to 0 and showfaces to 0.
options(scipen=20) #disable scientific notation for numbers
waitx<-0.5 #To see a small wait between individual trials, set a wait time to e.g., 0.5 
showfaces<-1 #Set to 0 if you do not want the faces, set to 1 if you want to see the faces

nSims <- 100 #number of simulated experiments (for large numbers, set wait to 0 and showfaces to 0)
n<-164 #sample size in each group

#set up some variables
p<-numeric(nSims) 

for(i in 1:nSims){ #for each simulated experiment
   x<-rnorm(n = n, mean = 100, sd = 15) #produce N simulated participants
   y<-rnorm(n = n, mean = 106, sd = 15) #produce N simulated participants
   z<-t.test(x,y) #perform the t-test
   p[i]<-z$p.value #get the p-value and store it
   if(z$p.value < 0.001  & showfaces==1){cat(":D     p =",z$p.value,"\n\n")}  
   if(0.001 <= z$p.value & z$p.value < 0.01  & showfaces==1){cat(":)     p =",z$p.value,"\n\n")}
   if(0.01 <= z$p.value & z$p.value < 0.05  & showfaces==1){cat("(^.^)  p =",z$p.value,"\n\n")}
   if(0.05 <= z$p.value & z$p.value < 0.10  & showfaces==1){cat("(._.)  p =",z$p.value,"\n\n")}
   if(z$p.value>0.10  & showfaces==1){cat(":(     p =",z$p.value,"\n\n")}
   Sys.sleep(waitx)
}

#now plot histograms of p-values, t-values, d, observed power
hist(p, main="Histogram of p-values", xlab=("Observed p-value"), breaks = 20)

# Statistical power is a function of effect size, alpha, and n

# Q4) We never know the true effect size in real studies. One approach people often use in
# a-priori power analyses is to set the smallest effect size of interest. For example, using
# the benchmarks by Cohen, we know d = 0.2 is a small effect. We might decide that if we
# do not observe an effect size of 0.2 or larger, we are not interested in the effect. Use
# G*power to calculate how many participants we need in each group, in an independent
# t-test, with an alpha level of 0.05, to get 0.95 power to observe an effect size of d = 0.2.
# A) 51 C) 290
# B) 242 *D)* 651

power.t.test(delta = 0.2, sd = 1, power = 0.95)

# Q5) Fill in the statistics for the main effect of caller location as a function of the loudness
# of the voice over the telephone, t(40) = 2.27. Check the effect size calculation using the
# From_R2D2 spreadsheet if we calculated the reported effect size correctly. You can fill in 
# N = 42 (for a t-test, N is the degrees of freedom + 2) and t = 2.27. Note that we reported
# Cohen’s d for the sample (in the spreadsheet, indicated by Cohen’s ds). If you want to
# repeat this study with 90% power, use G*power to calculate how many participants you
# would you need in each group, assuming the Cohen’s d of 0.7 is the true effect size.
# A) 24 C) 44
# B) 36 D) 55

power.t.test(delta = 0.7, sd = 1, power = 0.9)
#> 44

# Q6: For power analyses, it is best to use unbiased effect size estimates. Redo the power
# analysis, now using Hedges’ g, which you can also get from the From_R2D2 spreadsheet.
# If you want to repeat this study with 90% power, how many participants would you need
# in each group?
# A) 26 C) 66
# B) 46 D) 86

power.t.test(delta = 0.68372, sd = 1, power = 0.9)
#> 46

# Q7: It is very risky to base the power analysis on a single study. Due to publication bias,
# single studies often overestimate the true effect size, sometimes substantially. A third
# approach is to use the effect size from a meta-analytic effect size estimate. As it turns out
# (and as is often the case), the effect size for the loudness = closer effect observed by
# Zhang, Lakens, & IJsselsteijn in Study 1 was overestimated. After three studies, the
# authors perform a meta-analysis. Below, we see three lines with the effect sizes and
# confidence intervals for each study. On the bottom line, we see the overall meta-analytic
# effect size of 0.37. 
# Based on an a-priori power analysis, how many participants would you need in each
# group if you wanted to achieve 90% power? (Note that formally, Hedges’ g would be better
#    again, but with very large samples or meta-analytic estimates, the difference is often too
#    small to matter).

power.t.test(delta = 0.37, sd = 1, power = 0.9)
#> 155

# Q8) The ηp^2 =0.27. What is the ωp²?
# A) 0.24 C) 0.26
# *B)* 0.25 D) 0.27

# Q9) Which sample size is required to achieve 90% power?
# A) 14 *C)* 42
# B) 22 D) 58

# Guess, G*Power doesn't work on linux