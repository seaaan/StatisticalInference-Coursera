plot_beta <- function(alpha, beta) {
   theta<-seq(0,1,0.001) #create theta range from 0 to 1
   prior <- dbeta(theta, alpha, beta)
   plot(theta, prior, ylim=c(0, 15), type = "l", lwd = 3, xlab = bquote(theta), ylab = "Density", las = 1)
   title(paste('Bayes Factor:',round(BF10,digits=2)))
   
}