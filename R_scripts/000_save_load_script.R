##### ##### #####               Help script 
##### ##### #####   save / load .RData to and from .csv

## LOAD required packages
require(dplyr)

# ------ 1) READ in / write data to .RData / .csv and vice versa -------

## load .RData image
load('./Documents/GitHub/SampleData_DDM/Data/sample_data.RData')
## save as .csv
write.csv(sample_data, './Documents/GitHub/SampleData_DDM/Data/sample_data.csv', 
          row.names = F)

#rm(list = ls()) # clean Gloval Environment

## load .csv
sample_data <- read.csv('./Documents/GitHub/SampleData_DDM/Data/sample_data.csv', 
                        header = T, 
                        colClasses = c('factor', 'factor', 'numeric', 
                                       'factor', 'factor', 'numeric', 
                                       'factor', 'numeric'))
## save .RData image
save.image("./Documents/GitHub/SampleData_DDM/Data/sample_data.RData")

#rm(list = ls()) # clean Gloval Environment


# ------ 2) ADD response column -------------------------------------

## There's gotta be an easier way to do this
for (i in 1:nrow(sample_data)) {
  if ( sample_data[i, 4] == 1 & sample_data[i, 5] == 1 & sample_data[i, 7] == 'Correct' ) { 
    sample_data[i, 8] <- 1
  } else if ( sample_data[i, 4] == 1 & sample_data[i, 5] == 1 & sample_data[i, 7] ==  'Incorrect' ) {
    sample_data[i, 8] <- 0
  } else if ( sample_data[i, 4] == 1 & sample_data[i, 5] == 2 & sample_data[i, 7] ==  'Correct' ) {
    sample_data[i, 8] <- 0
  } else if ( sample_data[i, 4] == 1 & sample_data[i, 5] == 2 & sample_data[i, 7] ==  'Incorrect' ) {
    sample_data[i, 8] <- 1
  } else if ( sample_data[i, 4] == 2 & sample_data[i, 5] == 1 & sample_data[i, 7] ==  'Correct' ) {
    sample_data[i, 8] <- 0
  } else if ( sample_data[i, 4] == 2 & sample_data[i, 5] == 1 & sample_data[i, 7] ==  'Incorrect' ) {
    sample_data[i, 8] <- 1
  } else if ( sample_data[i, 4] == 2 & sample_data[i, 5] == 2 & sample_data[i, 7] ==  'Correct' ) {
    sample_data[i, 8] <- 0
  } else if ( sample_data[i, 4] == 2 & sample_data[i, 5] == 2 & sample_data[i, 7] ==  'Incorrect' ) {
    sample_data[i, 8] <- 1
  }
}
rm(i)

# ------ 3) Clean and tidy ------------------------------------------

## Column names to lower case
names(sample_data) <- c('subject', 'block', 'trial', 'stim_1', 'stim_2', 'rt', 'reaction', 'response')

## Reaction to lower case
sample_data$reaction <- gsub(sample_data$reaction, 
                             pattern = '([[:upper:]])',
                             perl = TRUE, 
                             replacement = '\\L\\1')

## Strings to factor
sample_data$reaction <- as.factor(sample_data$reaction)

# ------ 4) Save image and .csv -------------------------------------

## save .RData image
save.image("./Documents/GitHub/SampleData_DDM/Data/sample_data.RData")
## save as .csv
write.csv(sample_data, './Documents/GitHub/SampleData_DDM/Data/sample_data.csv', 
          row.names = F)
