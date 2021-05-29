# Title     : IE MBD Elective - Advanced R Forum 1
# Objective : Solve forum 1
# Created by: steff
# Created on: 5/26/2021

# THREAD 1

df <- data.frame(name = c("Arsenal", "Chelsea", "Man.City", "Liverpool"),
                            position = c(5, 4, 2, 1),
                            london_based = c(TRUE, TRUE, FALSE, FALSE));

# 1) Use any indexation method to get if Liverpool is london_based or not.
df[df["name"] == "Liverpool", "london_based"]

# 2) Use indexation by variable ($ operator) in combination with logical indexation to get the name of all the teams in
# a top 4 position (i.e positions 1, 2, 3 or 4) that are london_based.
df$name[df$position < 5 & df$london_based]


# THREAD 2
#  https://cran.r-project.org/web/packages/data.table/vignettes/datatable-intro.html

# Convert the iris dataset into a data.table variable  named 'dat'. Then compute the median value of all the columns
# except from Petal.Length by Species. Take into account only flowers with Petal.Length greater than 1.5. Use only one
# command with the format dt[i, j, by].
library(datasets)
library(data.table)
data(iris)
dat <- data.table(iris)
dat[Petal.Length > 1.5, lapply(.SD, median), by = "Species", .SDcols = -"Petal.Length"]
