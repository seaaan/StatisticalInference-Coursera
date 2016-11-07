# parameter = characteristic of population
# statistic = characteristic of sample

# Q1: You might want more confidence intervals to contain the true population parameter.
# Drag the ‘Slide me’ button to the far right, and you will see the simulation for 99%
# confidence intervals. Which statement is true?
# A) The confidence intervals are larger, and the sample means fall closer to the true mean.
# B) The confidence intervals are smaller, and the sample means fall closer to the true
# mean.
# *C)* The confidence intervals are larger, and the sample means fall as close to the true
# mean as for a 95% confidence interval.
# D) The confidence intervals are smaller, and the sample means fall as close to the true
# mean as for a 95% confidence interval.

# Q2: As we will see when we turn to the formulas for confidence intervals, sample means
# and their confidence intervals depend on the sample size. We can change the sample size
# in the simulation. By default, the sample size is set to 5. Change the sample size to 50
# (you can type it in). Which statement is true?
# A) The larger the sample size, the larger the confidence intervals. Sample size does not
# influence how the sample means vary around the true population mean.
# B) The larger the sample size, the smaller the confidence intervals. Sample size does not
# influence how the sample means vary around the true population mean.
# C) The larger the sample size, the larger the confidence intervals, and the closer the
# sample means are to the true population mean.
# *D)* The larger the sample size, the smaller the confidence intervals, and the closer the
# sample means are to the true population mean.

# Q3: Which of the studies 1 to 4 were statistically significant?
# A) Studies 1, 2, 3, and 4
# B) Only study 3
# C) None of the four studies
# *D)* Studies 1, 2 and 4

# Q4: The light blue diamond is the meta-analytic effect size. Instead of using a black
# horizontal line, the upper limit and lower limit of the confidence interval are indicated by
# the left and right points of the diamond. The center of the diamond is the meta-analytic
# effect size estimate. A meta-analysis calculates the effect size by combining and weighing
# all studies. Which statement is true?
# A) The confidence interval for a meta-analytic effect size estimate is always wider than
# that for a single study, because of the additional variation between studies.
# B) The confidence interval for a meta-analytic effect size estimate is always narrower than
# that for a single study, because of the combined sample size of all studies included in the
# meta-analysis.
# *C)* The confidence interval for a meta-analytic effect size estimate does not become wider
# or narrower compared to the confidence interval of a single study, it just becomes closer
# to the true population parameter.

# Standard deviation = parameter of the distribution, gets closer to the true population value as your sample size increases but doesn't necessarily get smaller
# Standard error     = bounds on a random sampling process, gets narrower as the sample increases because it measures the error from sampling

# Q5: Let’s assume a researcher calculates a mean of 7.5, and a standard deviation of 6.3,
# in a sample of 20 people. We know the value for a t-distribution with df = 19 is 2.093.
# Calculate the upper limit of the confidence interval around the mean. Is it:
# A) 1.40
# B) 2.95
# C) 8.91
# D) 10.45

sterr <- 6.3 / sqrt(20)
2.093 * sterr + 7.5
#> 10.45

#CI mean dif based on code from: http://stackoverflow.com/questions/16913849/how-to-plot-absolute-values-and-differences-including-confidence-intervals
m1 <- 3 #mean group 1
m2 <- 4 #mean group 2
sd1 <- 4.5 #sd group 1
sd2 <- 3.0 #sd group 2
n1 <- 50 #sample size group 1
n2 <- 50 #sample size group 2
x<-rnorm(n = n1, mean = m1, sd = sd1) #get sample group 1
y<-rnorm(n = n2, mean = m2, sd = sd2) #get sample group 2
error1 <- qnorm(0.975)*sd(x)/sqrt(n1) #get error group 1
error2 <- qnorm(0.975)*sd(y)/sqrt(n2) #get error group 2
CI_l_1 <- mean(x)-error1 #calculate confidence interval lower limit group 1
CI_u_1 <- mean(x)+error1 #calculate confidence interval upper limit group 1
CI_l_2 <- mean(y)-error2 #calculate confidence interval lower limit group 2
CI_u_2 <- mean(y)+error2 #calculate confidence interval upper limit group 2

se <- sqrt(sd(x)*sd(x)/n1+sd(y)*sd(y)/n2) #calc pooled standard error
error <- qt(0.975,df=n1+n2-2)*se #error mean dif
mdif<-mean(y)-mean(x) #mean dif
CI_l_d <- mdif-error #CI lower limit difference
CI_u_d <- mdif+error #CI upper limit difference

d = data.frame(labels=c("X","Y","Difference"), 
   mean=c(mean(x),mean(y),mdif),
   lower=c(CI_l_1,CI_l_2,CI_l_d),
   upper = c(CI_u_1,CI_u_2,CI_u_d))

#png(file=paste('CI_means_meandiff.png'),width=4000,height=6000, res = 1000)
plot(NA, xlim=c(.5,3.5), ylim=c(0, max(d$upper[1:2]+1)), bty="l", xaxt="n", xlab="",ylab="Mean")
points(d$mean[1:2], pch=19)
segments(1,d$mean[1],5,d$mean[1],lty=2)
segments(2,d$mean[2],5,d$mean[2],lty=2)
axis(1, 1:3, d$labels)
segments(1:2,d$lower[1:2],1:2,d$upper[1:2])
axis(4, seq((d$mean[1]-3),(d$mean[1]+5),by=1), seq(-3,5,by=1), las=1)
points(3,d$mean[1]+d$mean[3],pch=19, cex=1.5)
segments(3,d$mean[1]+d$lower[3],3,d$mean[1]+d$upper[3], lwd=2)
mtext("Difference", side=4, at=d$mean[1], line=3)
segments(1:1,d$upper[1:1],1:2,d$upper[1:1],lty=3)
segments(1:1,d$lower[1:2],1:2,d$lower[1:2],lty=3)
text(3, 1, paste("P-value",round(t.test(x,y,var.equal=TRUE)$p.value, digits=3)), cex = .8)

# Q6: How much do two 95% confidence intervals around individual means from
# independent groups overlap when the effect is only just statistically significant (p ≈ 0.05)
# at an alpha of 0.05?
# A) When the 95% confidence interval around one mean does not contain the mean of the
# other group, the groups differ significantly from each other.
# B) When the 95% confidence interval around one mean does not overlap with the 95%
#    confidence interval of the mean of the other group, the groups differ significantly from
# each other.
# *C)* When the overlap between two confidence intervals is approximately half of one side
# of the confidence interval, the groups differ significantly from each other.
# D) There is no relationship between the overlap of the 95% confidence intervals around
# two independent means, and the p-value for the difference between these groups.

# Prediction interval = interval in which a given value will fall, much larger than CI

#This scripts will simulate a single sample, and calculate the mean
#The gold background illustrates the 95% prediction interval (PI), The orange background illustrates the 95% confidence interval
#The black dotted line illustrates the true mean. 95% of the CI should contain the true mean
#Then, a simulation is run. The simulations generates a large number of additional samples
#The simulation returns the number of CI that contain the mean, and returns the % of means from future studies that fall within the 95% of the original study
#This is known as the capture percentage. It differs from (and is lower than) the confidence interval 

if(!require(ggplot2)){install.packages('ggplot2')}
library(ggplot2)
if(!require(Rcpp)){install.packages('Rcpp')}
library(Rcpp)

n=20 #set sample size
nSims<-100000 #set number of simulations

x<-rnorm(n = n, mean = 100, sd = 15) #create sample from normal distribution

#95% Confidence Interval
CIU<-mean(x)+qt(0.975, df = n-1)*sd(x)*sqrt(1/n)
CIL<-mean(x)-qt(0.975, df = n-1)*sd(x)*sqrt(1/n)

#95% Prediction Interval
PIU<-mean(x)+qt(0.975, df = n-1)*sd(x)*sqrt(1+1/n)
PIL<-mean(x)-qt(0.975, df = n-1)*sd(x)*sqrt(1+1/n)

#plot data
#png(file="CI_mean.png",width=2000,height=2000, res = 300)
ggplot(as.data.frame(x), aes(x))  + 
   geom_rect(aes(xmin=PIL, xmax=PIU, ymin=0, ymax=Inf), fill="gold") + #draw orange CI area
   geom_rect(aes(xmin=CIL, xmax=CIU, ymin=0, ymax=Inf), fill="#E69F00") + #draw orange CI area
   geom_histogram(colour="black", fill="grey", aes(y=..density..), binwidth=2) +
   xlab("IQ") + ylab("number of people")  + ggtitle("Data") + theme_bw(base_size=20) + 
   theme(panel.grid.major.x = element_blank(), axis.text.y = element_blank(), panel.grid.minor.x = element_blank()) + 
   geom_vline(xintercept=mean(x), colour="black", linetype="dashed", size=1) + 
   coord_cartesian(xlim=c(50,150)) + scale_x_continuous(breaks=c(50,60,70,80,90,100,110,120,130,140,150)) +
   annotate("text", x = mean(x), y = 0.02, label = paste("Mean = ",round(mean(x)),"\n","SD = ",round(sd(x)),sep=""), size=6.5)
#dev.off()

#Simulate Confidence Intervals
CIU_sim<-numeric(nSims)
CIL_sim<-numeric(nSims)
mean_sim<-numeric(nSims)

for(i in 1:nSims){ #for each simulated experiment
   x<-rnorm(n = n, mean = 100, sd = 15) #create sample from normal distribution
   CIU_sim[i]<-mean(x)+qt(0.975, df = n-1)*sd(x)*sqrt(1/n)
   CIL_sim[i]<-mean(x)-qt(0.975, df = n-1)*sd(x)*sqrt(1/n)
   mean_sim[i]<-mean(x) #store means of each sample
}

#Save only those simulations where the true value was inside the 95% CI
CIU_sim<-CIU_sim[CIU_sim<100]
CIL_sim<-CIL_sim[CIL_sim>100]

cat((100*(1-(length(CIU_sim)/nSims+length(CIL_sim)/nSims))),"% of the 95% confidence intervals contained the true mean")

#Calculate how many times the observed mean fell within the 95% CI of the original study
mean_sim<-mean_sim[mean_sim>CIL&mean_sim<CIU]
cat("The capture percentage for the plotted study, or the % of values within the observed confidence interval from",CIL,"to",CIU,"is:",100*length(mean_sim)/nSims,"%")

# Q7: 95% confidence intervals and 95% prediction intervals differ. Which statement is true?
# *A)* Prediction intervals are wider, because they are constructed so that they will contain
# a future single value 95% of the time.
# B) Prediction intervals are narrower, because they are constructed so that they will
# contain a future single value 95% of the time.
# C) Prediction intervals are wider, because they are constructed so that they will contain
# the mean of a future sample 95% of the time.
# C) Prediction intervals are narrower, because they are constructed so that they will
# contain the mean of a future sample 95% of the time.

# Q8: Run the simulations multiple times. Look at the output you will get in the R console.
# For example: “95.077 % of the 95% confidence intervals contained the true mean” and
# “The capture percentage for the plotted study, or the % of values within the observed
# confidence interval from 88.17208 to 103.1506 is: 82.377 %”. While running the
# simulations multiple times, look at the confidence interval around the sample mean, and
# relate this to the capture percentage. Which statement is true?
# *A)* The farther the sample mean is from the true population mean, the lower the capture
# percentage.
# B) The farther the sample mean is from the true population mean, the higher the capture
# percentage.

# Q9: Simulations in R are randomly generated, but you can make a specific simulation
# reproducible by setting the seed of the random generation process. Copy-paste
# “set.seed(1000)” to the first line of the R script, and run the simulation. The sample mean
# should be 94. What is the capture percentage? (Don’t forget to remove the set.seed
#    command if you want to generate more random simulations!).
# A) 95%
# *B)* 42.1%
# C) 84.3%
# D) 89.2%