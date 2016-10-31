n<-2000 #total number of datapoints (per condition) you are willing to collect after initial 10

D<-0.3 #True effect size (Keep SD below to 1, otherwise, this is just mean dif, not d)
SD<-1 #Set True standard deviation.

p<-numeric(n) #store p-values
x<-numeric(n) #store x-values
y<-numeric(n) #store y-values

n<-n+10 #script calculates p-values after 10 people in each condition, so add 10 to number of datapoints

for(i in 10:n){ #for each simulated participants after the first 10
   x[i]<-rnorm(n = 1, mean = 0, sd = SD)
   y[i]<-rnorm(n = 1, mean = D, sd = SD)
   z<-t.test(x[1:i],y[1:i], var.equal=TRUE) #perform the t-test
   p[i]<-z$p.value 
}

p<-p[10:n] #Remove forst 10 empty p-values

#Create the plot
#png(file="p-value_over_time.png",width=4000,height=2000, , units = "px", res = 500)
plot(0, col="red", lty=1, lwd=3, ylim=c(0,1), xlim=c(10,n), type="l", xlab='sample size', ylab='p-value', cex.lab=1, cex.axis=1)
lines(p, lwd=2)
abline(h=0.05, col="darkgrey", lty=2, lwd=2) #draw ine at p = 0.05
#dev.off()

min(p) #Return lowest p-value from all looks
cat("The lowest p-value was observed at sample size",which.min(p)+10) #Return the sample size at which the p-value was smallest
cat("The p-value dropped below 0.05 for the first time as sample size",which(p<0.05)[1]+10) #Return the sample size at which the p-value dropped below 0.05 for the first

# Q1: Run the script 20 times, and count how often the lowest p-value ends up below 0.05
# (we will calculate the long run probability of this happening through more extensive
# simulations later).
# > 8 

# Q2: Run the script 20 times. Take a good look at the variation in the p-value trajectory.
# Remember that at N = 200, 85% of the times the p-value should have ended up below
# 0.05. The script returns the sample size the p-value is the lowest (which is often, but not
#    always, at the maximum sample size, when there is a true effect) and the sample size at
# which the p-value drops below 0.05 for the first time. Which statement is true?
# A) If the p-value drops below 0.05, it stays below 0.05.
# B) The p-value randomly moves between 0 and 1, and will every now and then end up
# below 0.05.
# *C)* The p-value often drops below 0.05 well before 200 participants in each condition. In
# around 50% of the simulations, this already happens at N = 100.
# D) The p-value will typically move below 0.05 and stay there for some time, but given a
# large enough sample, it will always move back up to p > 0.05. 

# Q3: Change the effect size in line 3 to D <- 0.8, which can be regarded as a large effect.
# Run the script 20 times. Take a good look at the variation in the p-value trajectory. Which
# statement is true?
# A) The p-value randomly moves between 0 and 1, and will every now and then end up
# below 0.05.
# *B)* The p-values drop below and stay below 0.05 much earlier than when the true effect
# size is 0.3.
# C) p-values are meaningful when effect sizes are large (e.g., d = 0.8), but meaningless
# when effect sizes are small (e.g., d = 0.3).
# D) When you examine a large effect, whenever a p-value drops below 0.05, it will always
# stay below 0.05 as the sample size increases.


N<-200 #total number of datapoints (per condition) you are willing to collect
Looks<-5 #set number of looks at the data
nSim<-50000 #number of simulated studies
alpha<-0.0158 #set alpha

D<-0 #True effect size (must be 0 when simulating Type 1 errors)

#Take care of some settings
options(scipen=100, digits=4) #disable scientific notation for numbers
LookN<-ceiling(seq(0,N,N/Looks)) #Determine at which N's to look
LookN<-LookN[-1] #remove look at 0
LookN<-LookN[LookN > 2] #Remove looks at N of 1 or 2 (not possible with t-test)
Looks<-length(LookN) #if looks are removed, change number of looks
matp<-matrix(NA, nrow=nSim, ncol=Looks) #Matrix for p-values at sequential tests
SigSeq<-numeric(Looks) #Variable to store final p-values
OptStop<-numeric(nSim) #variable to store positions of optional stopping
p<-numeric(nSim) #Variable to save optional stopping p-values

#Loop data generation for each study, then loop to perform a test for each N 
for (i in 1:nSim){
   x<-rnorm(n = N, mean = 0, sd = 1)
   y<-rnorm(n = N, mean = D, sd = 1)
   for (j in 1:Looks){
      matp[i,j]<-t.test(x[1:LookN[j]],y[1:LookN[j]], var.equal=TRUE)$p.value #perform the t-test, store
   }
   if (i %% 100 == 0) cat('Loop', i, 'of', nSim,'\n')
}

#Save Type 1 error rate for each look
for (i in 1:Looks){
   SigSeq[i] <- sum(matp[,i]<alpha)
}

#Get the positions at which are stopped, and then these p-values
for (i in 1:nSim){
   OptStop[i] <- min(which(matp[i,]<alpha))
}
OptStop[is.infinite(OptStop)] <- Looks #If nothing significant, take last p-value (fixes error warning)
for (i in 1:nSim){
   p[i] <- matp[i,OptStop[i]]
}

breaks<-100
hist(p, breaks=breaks,col="grey")
abline(h=nSim/breaks, col = "red", lty=3)

#Return Type 1 error rates for each look, and the the Type 1 error rate when only reporting the lowest p-value over all looks
cat("Type 1 error rates for look 1 to", Looks,":", SigSeq/nSim)
cat("Type 1 error rate when only the lowest p-value for all looks is reported:", sum(p<alpha)/nSim)

# Probability of making a type 1 error (reporting a false positive)
#  Single test: Type 1 error rate = probability of finding a p-value lower than 
#               your alpha level, when there is no effect. 
#  Multiple tests (looking at data twice with optional stopping): 
#               Type 1 error rate = probability of finding a p-value lower than 
#               your alpha level at the first look, and the probability of not
#               finding a p-value lower than your alpha level at the first look, 
#               but finding a p-value lower than your alpha level at the second 
#               look. 

# Q4: Looking at the graph, which statement is true?
# A) Optional stopping does not impact the Type 1 error rate.
# *B)* Optional stopping inflates the Type 1 error rate. We can see this in the first five bars
# (p-values between 0.00 and 0.05), which are substantially higher than the horizontal
# line.
# C) Optional stopping inflates the Type 1 error rate. We can see this in the bars just
# above 0.05, which dip substantially below the uniform distribution that should be
# present if there is no true effect. 

# Q5: Which statement is true?
# A) At each look, the Type 1 error rate is higher than the alpha level (0.05). When using
# optional stopping (and reporting only the lowest p-value), the Type 1 error rate is higher
# than 0.05.
# B) At each look, the Type 1 error rate is approximately equal to the alpha level (0.05).
# When using optional stopping (and reporting only the lowest p-value), the alpha level
# also approximately equals the alpha level (0.05).
# *C)* At each look, the Type 1 error rate is approximately equal to the alpha level (0.05).
# When using optional stopping, the Type 1 error rate is also higher than the alpha level
# (0.05).

# Q6: Change the number of looks to 2 (in line 2), and leave all other settings the same.
# Run the simulation again. What is the Type 1 error rate using optional stopping,
# rounded to 2 digits? (Note that due to small number of simulations, the exact alpha
#    level you get might differ a little bit from the answer options below).
# A) 0.05
# *B)* 0.08
# C) 0.12
# D) 0.18

# What is maximum Type 1 error rate when collecting 200 participants in each 
# condition of an independent t-test, using optional stopping, rounded to 2 
# digits? (Note that the simulation will take a while, but still, due to the 
# relatively small number of simulations, the exact alpha level you get might 
# differ a little bit from the answer options below – choose the answer option 
# closest to your result).
# > 0.41

# Pocock boundary = p-value threshold to use when you want to perform multiple
# looks and have an overall p-value of 0.05. So if you do four looks, the threshold
# would be 0.0182 and if you get a lower p-value than that at any look, you can
# stop. The p-value for the experiment would still be p < 0.05 not p < 0.0182

# Q8: Set the number of participants to 100, the number of looks to 5, and the number of
# simulations to 50000. In the Wikipedia article on the Pocock boundary, find the
# corrected alpha level for 5 looks at the data. Change the alpha level in the simulation to
# this value. Run the simulation. Which of the following statements is true?
# A) The Type 1 error rate at each look is approximately 0.03, and the overall alpha level is
# approximately 0.05.
# B) The Type 1 error rate at each look is approximately 0.03, and the overall alpha level is
# approximately 0.15.
# *C)* The Type 1 error rate at each look is approximately 0.016, and the overall alpha level
# is approximately 0.05.
# D) The Type 1 error rate at each look is approximately 0.016, and the overall alpha level
# is approximately 0.08.

# Q9: Look at the graph of the p-value distribution when using the Pocock boundary, and
# compare it to the graph you got when not using the Pocock boundary. You can flip back
# and forth between plots you have generated in RStudio using the blue arrows on the
# plots tab:
#    Which statement is true?
# A) Without Pocock’s boundary, small p-values (e.g., p = 0.01) are more likely than
# slightly higher p-values (p = 0.04). With Pocock’s boundary, small p-values (e.g., p =
#       0.01) are also more likely than slightly higher p-values (p = 0.04).
# B) Without Pocock’s boundary, small p-values (e.g., p = 0.01) are more likely than
# slightly higher p-values (p = 0.04). With Pocock’s boundary, small p-values (e.g., p =
#       0.01) are less likely than slightly higher p-values (p = 0.04).
# *C)* Without Pocock’s boundary, small p-values (e.g., p = 0.01) are less likely than slightly
# higher p-values (p = 0.04). With Pocock’s boundary, small p-values (e.g., p = 0.01) are
# more likely than slightly higher p-values (p = 0.04).
# D) Without Pocock’s boundary, small p-values (e.g., p = 0.01) are less likely than slightly
# higher p-values (p = 0.04). With Pocock’s boundary, small p-values (e.g., p = 0.01) are
# also less likely than slightly higher p-values (p = 0.04).