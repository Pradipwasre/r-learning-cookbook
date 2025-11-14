###############################################################
# DAY 4 SESSION: IF, ELSE, ELSE IF STATEMENTS IN R
###############################################################

###########################
# What is an IF statement?
###########################
# An IF statement allows R to run a block of code only if a condition is TRUE.

value <- 5

# Check if value is not equal to 3
if (value != 3) {
  print("The value is not equal to 3")
}

###############################################################
# Logical Operators
# ==  Equal to
# !=  Not equal to
# >   Greater than
# <   Less than
# >=  Greater than or equal to
# <=  Less than or equal to
###############################################################

num <- 7   # Change this number to test different outcomes

# Check if equal
if (num == 7) {
  print("The number is equal to 7")
}

# Check if not equal
if (num != 7) {
  print("The number is not equal to 7")
}

# Greater than
if (num > 5) {
  print("The number is greater than 5")
}

# Less than
if (num < 10) {
  print("The number is less than 10")
}

# Greater than or equal to
if (num >= 7) {
  print("The number is greater than or equal to 7")
}

# Less than or equal to
if (num <= 7) {
  print("The number is less than or equal to 7")
}


###############################################
# What happens when IF condition is FALSE?
###############################################
# Use ELSE to run code when IF is FALSE.

amount <- 20

if (amount > 50) {
  print("The amount is greater than 50")
} else {
  print("The amount is not greater than 50")
}

# Another example
score <- 60

if (score == 100) {
  print("Perfect score")
} else {
  print("Not a perfect score")
}


###############################################
# Using ELSE IF to test multiple conditions
###############################################

rating <- 3   # Try values 1 to 5

if (rating == 1) {
  print("Very Poor")
} else if (rating == 2) {
  print("Poor")
} else if (rating == 3) {
  print("Average")
} else if (rating == 4) {
  print("Good")
} else if (rating == 5) {
  print("Excellent")
} else {
  print("Please enter a rating between 1 and 5")
}


############################################################
# Practical Example: Print Day Name from Day Number
############################################################

day_number <- 4   # Change from 1 to 7

if (day_number == 1) {
  print("Monday")
} else if (day_number == 2) {
  print("Tuesday")
} else if (day_number == 3) {
  print("Wednesday")
} else if (day_number == 4) {
  print("Thursday")
} else if (day_number == 5) {
  print("Friday")
} else if (day_number == 6) {
  print("Saturday")
} else if (day_number == 7) {
  print("Sunday")
} else {
  print("Invalid input. Enter a number between 1 and 7.")
}


############################################################
# Checking Data Type using IF Conditions
############################################################

item <- TRUE   # Try numeric, character, or logical values

# Check if value is numeric
if (is.numeric(item)) {
  print("The item is numeric")
} else {
  print("The item is not numeric")
}

# Another example
data_value <- "Hello"

if (is.numeric(data_value)) {
  print("Numeric value detected")
} else {
  print("This is not numeric data")
}

# Boolean result (TRUE or FALSE)
result <- is.numeric(42)
result   # This will print TRUE
