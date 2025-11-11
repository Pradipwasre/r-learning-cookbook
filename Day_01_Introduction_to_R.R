###############################################################
# R PROGRAMMING COOKBOOK : DAY 1
# Topic: Using R like a Calculator and Understanding Variables
###############################################################

# ------------------------------------------------------------
# What you will learn today
# ------------------------------------------------------------
# • How to create and work with variables in R
# • How R performs calculations (addition, subtraction, etc.)
# • How to understand and check data types
# • What NA and NaN mean and how to handle them
# • How to combine text and numbers using paste()
# • Where these concepts are used in real-world analysis

# ------------------------------------------------------------
# 1. Setting up the environment
# ------------------------------------------------------------

# Install tidyverse (only once if not installed)
# install.packages("tidyverse")

library(tidyverse)

# ------------------------------------------------------------
# 2. Creating variables
# ------------------------------------------------------------

age <- 25
height_cm = 172
country <- "India"
is_coder <- TRUE

age
height_cm
country
is_coder

mode(age)
mode(country)
mode(is_coder)

# ------------------------------------------------------------
# 3. Understanding the paste() function
# ------------------------------------------------------------

paste(country, "has an average height of", height_cm, "cm.")
name <- "R"
paste("Welcome to", name, "Programming!")
paste("The result of 2 + 3 is", 2 + 3)

# ------------------------------------------------------------
# 4. R as a Calculator
# ------------------------------------------------------------

1 + 1
4 - 3
12 / 3
3 * 5
2 ^ 3
13 %% 5

items <- 17
box_capacity <- 5
remainder <- items %% box_capacity
paste("Boxes completely filled:", items %/% box_capacity)
paste("Remaining items:", remainder)

# ------------------------------------------------------------
# 5. Working with vectors
# ------------------------------------------------------------

marks <- c(78, 85, 92, 88, 76)
marks
marks + 5
marks * 2
marks ^ 2
extra_marks <- c(2, 0, 1, 0, 3)
marks + extra_marks

# ------------------------------------------------------------
# 6. Understanding data types
# ------------------------------------------------------------

w <- c(3, 2, 1, 6, 9)
x <- "Hello R"
y <- c(TRUE, FALSE, TRUE)
z <- c(3 + 2i, 6 + 9i, 1 - 4i)

mode(w)
mode(x)
mode(y)
mode(z)

# ------------------------------------------------------------
# 7. NA vs NaN (Detailed Explanation)
# ------------------------------------------------------------

a <- NA
b <- 0 / 0
a
b

is.na(a)
is.na(b)
is.nan(a)
is.nan(b)

data <- c(10, NA, 15, NaN, 20)
is.na(data)
is.nan(data)

mean(data)
mean(data, na.rm = TRUE)
data_clean <- ifelse(is.na(data), 0, data)
data_clean

df <- tibble(
  name = c("Ravi", "Meena", "Kiran", "Sunil"),
  score = c(80, NA, 92, NaN)
)
df
drop_na(df)

# ------------------------------------------------------------
# 8. Type Conversion (Coercion)
# ------------------------------------------------------------

x <- "5"
as.numeric(x)
as.logical(x)
as.complex(x)

bad <- as.numeric("R")
bad
is.na(bad)

x_vals <- c("10", "20", "R")
num_vals <- suppressWarnings(as.numeric(x_vals))
num_vals

# ------------------------------------------------------------
# 9. Recap
# ------------------------------------------------------------

# • Variables store data — use <- or = to assign values.
# • paste() joins text and variables.
# • R performs arithmetic like a calculator.
# • Vectors let you handle multiple values.
# • NA = missing data; NaN = invalid numeric result.
# • Always clean or handle NA/NaN before analysis.
