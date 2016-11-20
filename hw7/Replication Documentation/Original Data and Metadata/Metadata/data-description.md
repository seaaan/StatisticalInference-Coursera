## Data source
The data was downloaded using the OMDb API, via the omdbapi package in R on November 19, 2016. The exact script used to download the data is available in the "get-the-data.R" file. 

## Data structure
The data file consists of three columns and 1000 rows. Each row is a single movie and is described with its title, IMDB rating, and director. The ratings are on a scale of 1 to 5 and title and director contain free text, with commas in the director column demarcating multiple directors. 

## Citations
OMDB API: https://www.omdbapi.com/

OMDb API R package: Bob Rudis (NA). omdbapi: Tools to Access Movie, Television and Game Data from the 'Open Movie Database'. R package version 0.2.0.9000.

R Core Team (2016). R: A language and environment for statistical computing. R Foundation for Statistical Computing, Vienna, Austria. URL https://www.R-project.org/.