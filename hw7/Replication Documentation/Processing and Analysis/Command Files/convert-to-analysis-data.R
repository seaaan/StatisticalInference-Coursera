library(readr)
library(dplyr)
library(stringr)
library(gender)

d <- read_csv("hw7/Replication Documentation/Processing and Analysis/Importable Data/ratings.csv", 
   col_types = "cdc")

paste("starting number of movies =", nrow(d))

# remove non-first directors
# get first name for determining gender
# filter out films without N/A directors
d <- d %>% 
   mutate(Director = str_replace(Director, ",.*", "")) %>% 
   mutate(FirstName = str_replace(Director, " .*", "")) %>% 
   filter(FirstName != "N/A")

paste("number of movies with known directors =", nrow(d))

# predict genders for names, assuming most directors born between 1900 and 1980 
genders <- gender(d$FirstName, years = c(1900, 1980), method = "ssa")

result <- as_data_frame(
   merge(d, unique(genders), by.x = "FirstName", by.y = "name", all.x = TRUE)
)

# assign genders given threshold of 0.85
result <- result %>% 
   mutate(Gender = case_when(
      result$proportion_male >= 0.85 ~ "male", 
      result$proportion_male <= 0.15 ~ "female", 
      TRUE ~ "unknown" )) %>% 
   mutate(Gender = ifelse(is.na(Gender), "unknown", Gender))

paste("number of movies with known directors of programmatically determined gender =", nrow(result[result$Gender != "unknown",]))

# generate directors for whom genders are unknown for manual entry
unknowns <- filter(result, Gender == "unknown") %>% 
   select(Title, Director, Gender, FirstName) %>% 
   group_by(Director, FirstName) %>% 
   summarise(ExampleMovie = Title[1])

write.csv(unknowns,
   file = "hw7/Replication Documentation/Processing and Analysis/Importable Data/unknowns-out.csv", 
   row.names = FALSE)

known_unknowns <- read_csv("hw7/Replication Documentation/Processing and Analysis/Importable Data/unknowns-filled-in.csv",
   col_types = "cccc")

result <- known_unknowns %>% 
   mutate(ManualGender = Gender) %>% 
   select(Director, ManualGender) %>% 
   left_join(result, .)

result <- result %>% 
   mutate(Gender = ifelse(!is.na(ManualGender), ManualGender, Gender)) %>% 
   filter(Gender != "unknown")

paste("number of movies with known directors and programmatically or manually known genders =", nrow(result))

# format for output
result <- result %>% 
   select(Gender, Director, Title, Rating)

write.csv(result, file = "hw7/Replication Documentation/Processing and Analysis/Analysis Data/per-movie.csv", row.names = FALSE)

per_director <- result %>% 
   group_by(Gender, Director) %>% 
   summarise(Rating = mean(Rating))

paste("number of unique directors of known gender =", nrow(per_director))
write.csv(per_director, file = "hw7/Replication Documentation/Processing and Analysis/Analysis Data/per-director.csv", row.names = FALSE)
