# plot likelihood curve----
n <- 10 # set total trials
x <- 0 # set successes
theta <- seq(0, 1, len = 100) # create theta variable, from 0 to 1
like <- dbinom(x, n, theta) # create likelihood function
plot(theta, like, type = 'l', xlab = expression(theta), ylab = 'Likelihood', 
   main = "Likelihood Curve")

# theta = probability of landing on heads
# like = likelihood of the given probability being the true one

# Q1: Let’s assume you expect this is a fair coin. What is the binomial probability of
# observing 8 heads out of 10 coin flips, when θ = 0.5?
dbinom(8, 10, 0.5)
#> [1] 0.04394531

# maximum likelihood estimation = plot likelihood against all possible values of theta
# likelihood has little meaning in isolation, only relative to other likelihoods

# Probability: start with parameter and estimate probability of specific sample
#     param = probability coin is fair
#     sample = n heads out of y flips
# Likelihood: start with specific sample and estimate likelihood of different parameters
#     param = probability coin is fair
#     sample = n heads out of y flips

# Likelihood = observe some data and use it to infer likelihood of different parameters
# Likelihood functions don't have to be binomial, can be from many distributions

# Q2: likelihood curve with observed data of 0 heads out of 10 flips
# C) The curve starts at its highest point at θ = 0, and then the likelihood decreases as θ increases.

# Likelihood ratio: likelihood at given value of theta divided by likelihood at other value of theta


# Calculate the likelihood ratio----
n <- 10 # set total trials
x <- 5 # set successes
H0 <- .5 #specify one hypothesis you want to compare with the likihood ratio
H1 <- 4/10 #specify another hypothesis you want to compare with the likihood ratio (you can use 1/20, or 0.05)
dbinom(x,n,H0)/dbinom(x,n,H1) #Returns the likelihood ratio of H0 over H1
dbinom(x,n,H1)/dbinom(x,n,H0) #Returns the likelihood ratio of H1 over H0

theta<- seq(0,1,len=100) #create theta variable, from 0 to 1
like <- dbinom(x,n,theta)
#png(file="LikRatio.png",width=4000,height=3000, , units = "px", res = 900)
plot(theta,like,type='l',xlab=expression(theta), ylab='Likelihood', lwd=2)
points(H0,dbinom(x,n,H0))
points(H1,dbinom(x,n,H1))
segments(H0, dbinom(x,n,H0), x/n, dbinom(x,n,H0), lty=2, lwd=2)
segments(H1, dbinom(x,n,H1), x/n, dbinom(x,n,H1), lty=2, lwd=2)
segments(x/n, dbinom(x,n,H0), x/n, dbinom(x,n,H1), lwd=2)
title(paste('Likelihood Ratio H0/H1:',round(dbinom(x,n,H0)/dbinom(x,n,H1),digits=2)," Likelihood Ratio H1/H0:",round(dbinom(x,n,H1)/dbinom(x,n,H0),digits=2)))
#dev.off()

# Q3: What is the likelihood ratio of a fair compared to a non-fair coin that 
# flips heads as often as you have observed, based on the observed data?
# Observed 6/13 heads. H0 = fair, H1 = 6/13. H0/H1 = 0.96

# Q4: What is the likelihood ratio for 5 out of 10 heads?
# H0/H1 = 1.22

# Q5: What is the likelihood ratio for 50 out of 100 heads?
# H0/H1 = 7.699

# Q6: What is the likelihood ratio for 500 out of 1000 heads?
# H0/H1 = 731784961

# Q7: When comparing two hypotheses (θ = X vs θ = Y), a likelihood ratio of:
# A) 0.02 means that neither of the two hypotheses is very likely.
# B) 5493 means that hypothesis θ = X is very likely to be true.
# *C)* 5493 means that hypothesis θ = X is much more likely than θ = Y.
# D) 0.02 means that the hypothesis that θ = X is 2% more likely to be true than θ = Y. 

# When performing n studies, when power drops below n/(n+1) percent, or 
# increases above 1-(n/(n+1)), it's more likely that you'll observe mixed 
# results (i.e. some false negatives, some true positives) when you have a 
# true effect, than that you'll observe only true positives. E.g. if you do
# three studies, mixed results are more likely than uniform results with power
# between 0.25 and 0.75.