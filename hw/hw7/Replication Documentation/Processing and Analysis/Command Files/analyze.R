library(dplyr)
library(readr)
library(ggplot2)

# load data 
per_movie <- read.csv("hw7/Replication Documentation/Processing and Analysis/Analysis Data/per-movie.csv")
per_director <- read.csv("hw7/Replication Documentation/Processing and Analysis/Analysis Data/per-director.csv")

per_movie %>% 
   group_by(Gender) %>% 
   summarise(MeanRating = mean(Rating), SDRating = sd(Rating), n = n())

per_director %>% 
   group_by(Gender) %>% 
   summarise(MeanRating = mean(Rating), SDRating = sd(Rating), n = n())

# run t-tests (note alternative is "less" because female is alphabetically 
# before male)
t.test(Rating ~ Gender, data = per_movie, alternative = "less")
t.test(Rating ~ Gender, data = per_director, alternative = "less")

# calculate effect sizes
effsize::cohen.d(Rating ~ Gender, data = per_movie)
effsize::cohen.d(Rating ~ Gender, data = per_director)

ggplot(per_movie, aes(x = Gender, y = Rating)) + geom_boxplot() + ylim(c(0, 10))
ggplot(per_director, aes(x = Gender, y = Rating)) + geom_boxplot() + ylim(c(0, 10))
