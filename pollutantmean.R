#Writing a function pollutantmean to return the mean of nitrate or sulfate across the selected monitors
pollutantmean <- function(directory, pollutant, id = 1:332) {
    library(dplyr)
    if(directory != "specdata") {
      stop("invalid directory")
    }
    directory <- file.path("~/GitHub/Pollutantmean/specdata.zip")
    directory <- unzip(directory)
    directory <-  directory[id]
    machines <- lapply(directory, read.csv)
    suppressWarnings(machines <- bind_rows(machines))
    if(pollutant == "sulfate") {
      final_mean <- mean(machines$sulfate, na.rm = TRUE)
      final_mean
    } else if(pollutant == "nitrate") {
        final_mean <- mean(machines$nitrate, na.rm = TRUE)
        final_mean
    } else {
        stop("invalid pollutant")
      }
  }

pollutantmean("specdata", "sulfate", 1:10)
pollutantmean("specdata", "nitrate", 70:72)
pollutantmean("specdata", "nitrate", 23)
    
  
