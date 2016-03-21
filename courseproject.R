# Checking if data directory exist, and if not creating the directory and downloading the data.
if(!dir.exists("./data")){
    dir.create("./data")
    
    if(!file.exists("./data/training.csv")){
        train.url <- "https://d396qusza40orc.cloudfront.net/predmachlearn/pml-training.csv"
        download.file(train.url, "./data/training.csv")
        rm(train.url)
    }
    if(!file.exists("./data/testing.csv")){
        test.url <- "https://d396qusza40orc.cloudfront.net/predmachlearn/pml-testing.csv"
        download.file(test.url, "./data/testing.csv")
        rm(test.url)
    }
}

# Reading in the data.
training <- read.csv("./data/training.csv", na.strings = c("", "NA"))
testing <- read.csv("./data/testing.csv")

#Removing variables with large amounts, >0.9, of missing values.

names <- colnames(training)