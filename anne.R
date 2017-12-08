library(dplyr)
library(plyr)
library(data.table)

test.data <-'test_format2.csv'
train.data <-'train_format2.csv'
path <- 'E:/tianchi/Repeated buyer/data_format2/data_format2/'  
setwd(path)

data <- read.csv(test.data, header=F, stringsAsFactors = F) 

n = 1000
row.name=rownames(data)  
sam.row.name=sample(row.name,n,replace=F)
data_test=data[sam.row.name,]

