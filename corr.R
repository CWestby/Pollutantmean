corr <- function(directory, threshold = 0) {
  directory <- file.path("~/GitHub/Pollutantmean/specdata.zip")
  directory <- unzip(directory)
  machines <- lapply(directory, read.csv)
  none_missing <- lapply(machines, complete.cases)
  sum_complete <- sapply(none_missing, sum)
  if(threshold >= sum_complete) {
    cor()
  }
}


cr <- corr("specdata", 150)
head(cr)
summary(cr)


cr <- corr("specdata", 400)
head(cr)
summary(cr)

cr <- corr("specdata", 5000)
summary(cr)
length(cr)

cr <- corr("specdata")
summary(cr)
length(cr)