pollutantmean <- function(directory, pollutant, id = 1:332){
  file_list <- list.files(directory, full.names = TRUE)
  dat <- data.frame()
  for(i in id){
    temp <- read.csv(file_list[i], header = TRUE)
    dat <- rbind(dat, temp)
  }
  mean(dat[,pollutant], na.rm = TRUE)
}

complete <- function(directory, id = 1:332) {
  file_list <- list.files(directory, full.names = TRUE)
  dat <- data.frame(matrix(ncol = 2, nrow = 0))
  name <- c("id", "nobs")
  colnames(dat) <- name
  for (i in id) {
    temp <- read.csv(file_list[i], header = TRUE)
    good <- complete.cases(temp)
    temp <- temp[good,]
    nobs<- nrow(temp)
    dat <- rbind(dat, data.frame(i, nobs))
  }
  return (dat)
}

corr <- function(directory, treshold = 0) {
  file_list <- list.files(directory, full.names = TRUE)
  l = length(file_list)
  a=c()
  for (i in 1:l) {
    temp <- read.csv(file_list[i], header = TRUE)
    good <- complete.cases(temp)
    temp <- temp[good,]
    if (nrow(temp)>treshold){
      a<- append(a, cor(temp$sulfate, temp$nitrate))
    }
  }
  return(a)
}