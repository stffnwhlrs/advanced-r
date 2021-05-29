# Title     : IE MBD Elective - Advanced R Forum 1
# Objective : Solve forum 1
# Created by: steff
# Created on: 5/26/2021

# EXERCISE 1

df <- data.frame(name = c("Arsenal", "Chelsea", "Man.City", "Liverpool"),
                            position = c(5, 4, 2, 1),
                            london_based = c(TRUE, TRUE, FALSE, FALSE));

# 1) Use any indexation method to get if Liverpool is london_based or not.
df[df["name"] == "Liverpool", "london_based"]

# 2) Use indexation by variable ($ operator) in combination with logical indexation to get the name of all the teams in
# a top 4 position (i.e positions 1, 2, 3 or 4) that are london_based.
df$name[df$position < 5 & df$london_based]


# EXERCISE 2
#  https://cran.r-project.org/web/packages/data.table/vignettes/datatable-intro.html

# Convert the iris dataset into a data.table variable  named 'dat'. Then compute the median value of all the columns
# except from Petal.Length by Species. Take into account only flowers with Petal.Length greater than 1.5. Use only one
# command with the format dt[i, j, by].
library(datasets)
library(data.table)
data(iris)
dat <- data.table(iris)
dat[Petal.Length > 1.5, lapply(.SD, median), by = "Species", .SDcols = -"Petal.Length"]


# EXERCISE 3
# https://www.tutorialspoint.com/r/r_lists.htm
l <- list(v1 = c("a", "b", "c"),
             v2 = c("p", "r", "o", "g", "r", "a", "m", "m", "i", "n", "g", "R"),
             v3 = c("d", "e", "f"),
             v4 = letters[1:3],
             v5 = letters[3:7]);

# Count how many objects of this list have length 3. Do not use a loop.
sum(lengths(l) == 3)
length(l[lapply(l,length)==3])


# EXERCISE 4
# Perform the same operation as in Exercise 2 but this time using directly iris as a data.frame and one single
# dplyr command. Use piping.
# Compute the median value of all the columns except from Petal.Length by Species. Take into account only flowers
# with Petal.Length greater than 1.5.
library(dplyr)

iris %>%
  filter( "Petal.Length" > 1.5) %>%
  select(-"Petal.Length") %>%
  group_by(Species) %>%
  summarise_all(median)


# EXERCISE 5
# Read the attached R object "userbase.RData" . It represents a database of clients of an airline, where each row
# corresponds to a flight purchase. Get the top 3 destinations in terms of average price for tickets sold online.
# Take into account only tickets with price greater than 50. Get these results using dt[i, j, by] chained operations.

# TIP
# DT[i, j, by]
# Way to read it: Take DT, subset/reorder rows using i, then calculate j, grouped by by.

dat <- readRDS("C:/Users/steff/Google Drive/Studium/IE/mbd/s3/ar/data/userbase.RData")

dat[sale_channel == "online" & price > 50, .(avg_price = mean(price)), by="destination"][order(-avg_price)][1:3]




