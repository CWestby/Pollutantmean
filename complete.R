complete <- function(directory, id = 1:332) {
  library(dplyr)
  if(directory != "specdata") {
    stop("invalid directory")
  }
  directory <- file.path("~/GitHub/Pollutantmean/specdata.zip")
  directory <- unzip(directory)
  directory <-  directory[id]
  machines <- lapply(directory, read.csv)
  frame <- lapply(machines, complete.cases)
  cases <- sapply(frame, sum)
  data.frame("id" = id, "nobs" = cases)
}


complete("specdata", 1)
complete("specdata", c(2, 4, 8, 10, 12))
complete("specdata", 30:25)
complete("specdata", 3)