# ---- Installing package ----
install.packages("dplyr")
install.packages("tinytex")
install.packages("tidyverse")
installed.packages("ggplot2")
install.packages("randomForest")
install.packages("googlesheets4")

# ---- Loading packages ----
library(dplyr)
library(tinytex)
library(tidyverse)
library(ggplot2)
library(randomForest)
library(googlesheets4)


# ---- Loading dataset -----

data_train = read.csv("https://raw.githubusercontent.com/guru99-edu/R-Programming/master/train.csv")
glimpse(data_train)
data_test = read.csv("https://raw.githubusercontent.com/guru99-edu/R-Programming/master/test.csv") 
glimpse(data_test)
 
# -----