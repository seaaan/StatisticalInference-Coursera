library(dplyr)
library(omdbapi)

# return a data frame containing the title, director, and IMDB rating given an 
# IMDB ID
get_title_and_rating <- function(id) {
   movie <- find_by_id(id)
   data.frame(Title = movie$Title, Rating = movie$imdbRating, 
      Director = movie$Director, stringsAsFactors = FALSE)
}

# return a data frame containing titles, directors, and IMDB ratings of ten 
# movies at a time
# this is useful because the search function is limited to batches of 10
get_ten <- function(ten) {
   bind_rows(lapply(ten$imdbID, function(id) {
      # wait half a second between calls to avoid hammering the server too much
      Sys.sleep(0.5)
      get_title_and_rating(id)
   }))
}

# return a data frame containing titles, directors, and IMDB ratings of 20*n 
# movies, with 10*n each containing "and" and "or" (as way of searching for
# general movies)
get_n_pages <- function(n) {
   bind_rows(lapply(1:n, function(page) {
      bind_rows(
         get_ten(search_by_title("and", page = n)),
         get_ten(search_by_title("or", page = n))
      )
   }))
}

# get the data for 500 movies each containing "and" and "or" in the title
ratings <- get_n_pages(50)

# save the data
write.csv(ratings, file = "ratings.csv", row.names = FALSE)