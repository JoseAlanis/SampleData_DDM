##### ##### #####               Help script 
##### ##### #####   save / load .RData to and from .csv



# ------ read in / write data to .RData / .csv and vice versa -------

## load .RData image
load('./Documents/GitHub/SampleData_DDM/RData/sample_data.RData')
## save as .csv
write.csv(sample_data, './Desktop/sample_data.csv', row.names = F)

#rm(list = ls()) # clean Gloval Environment

## load .csv
sample_data <- read.csv('./Desktop/sample_data.csv', 
                        header = T, 
                        colClasses = c('factor', 'factor', 'numeric', 
                                       'factor', 'factor', 'numeric', 'factor'))
## save .RData image
save.image("~/Desktop/sample_data.RData")

#rm(list = ls()) # clean Gloval Environment