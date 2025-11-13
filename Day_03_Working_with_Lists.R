###############################################################
# R PROGRAMMING COOKBOOK : DAY 3
# Topic: Understanding and Working with Lists in R
###############################################################

# ------------------------------------------------------------
# What you will learn today
# ------------------------------------------------------------
# • What lists are and why they are important in R
# • How to create, access, and modify list elements
# • Difference between using [] , [[]] , and $ when accessing data
# • How to add, update, and remove elements from a list
# • Best practices (do's and don’ts) while working with lists


# ------------------------------------------------------------
# 1. Introduction to Lists
# ------------------------------------------------------------
# A list in R is a flexible data structure that can store elements
# of different data types and lengths. Unlike vectors or matrices,
# lists can hold numbers, text, logical values, and even other lists.

# Example: Creating a simple list that contains different data types
student_name <- "Rahul"
scores <- c(85, 90, 88)
passed <- TRUE

student_info <- list(student_name, scores, passed)
student_info

# ------------------------------------------------------------
# 2. Named Lists
# ------------------------------------------------------------
# Assigning names to list components makes them easier to understand.

student_record <- list(
  name = "Sneha",
  marks = c(78, 82, 91),
  grade = "A",
  passed = TRUE
)
student_record

# Accessing list elements:
student_record["marks"]   # Returns a sublist
student_record[["marks"]] # Returns the vector directly
student_record$marks      # Access by name shortcut

# ------------------------------------------------------------
# 3. Accessing Elements in Lists
# ------------------------------------------------------------
# [] returns a sublist (still a list)
# [[]] extracts the actual value from that position
# $ extracts element using its name

employee <- list(
  id = 102,
  name = "Ravi",
  department = "Finance",
  salary = 65000
)

employee["name"]     # returns a list
employee[["name"]]   # returns the value "Ravi"
employee$name        # shortcut to access element by name

# ------------------------------------------------------------
# 4. List with Mixed Data Types
# ------------------------------------------------------------
# Lists can hold values of different types.

mixed_data <- list(
  product = "Laptop",
  quantity = 3,
  in_stock = TRUE,
  prices = c(55000, 60000, 58000)
)
mixed_data

# Accessing data
mixed_data$prices
mixed_data[[4]][2]   # Accessing 2nd price

# ------------------------------------------------------------
# 5. Creating an Empty List and Filling It
# ------------------------------------------------------------
# You can create an empty list first and then add data later.

store_details <- list()

store_details[[1]] <- "Tech World"
store_details[[2]] <- c("Laptops", "Phones", "Tablets")
store_details[[3]] <- TRUE
store_details[[4]] <- c(100, 230, 85)  # stock count
store_details

# Access the second element (categories)
store_details[[2]]
store_details[2]
store_details

# ------------------------------------------------------------
# 6. Converting Vectors to Lists
# ------------------------------------------------------------

numbers_vector <- c(10, 20, 30, 40)
numbers_list <- as.list(numbers_vector)
numbers_list

# Explanation:
# Each element of the vector becomes a separate component in the list.
# This is useful when we want to manipulate each value independently.

# Accessing
numbers_list[[1]]   # first value
numbers_list[[4]]   # fourth value

# ------------------------------------------------------------
# 7. Creating and Modifying Lists
# ------------------------------------------------------------

customer <- list(
  name = "Arjun",
  city = "Delhi",
  purchased_items = c("Shoes", "Bag", "Watch")
)
customer

# Adding a new element
customer$total_bill <- 4850
customer

# Modifying an existing element
customer$city <- "Mumbai"
customer

# Removing an element
customer$purchased_items <- NULL
customer

# Renaming an element
names(customer)[1] <- "customer_name"
customer

# ------------------------------------------------------------
# 8. Working Example: A Small Business Record
# ------------------------------------------------------------

business <- list(
  shop_name = "Book Haven",
  owner = "Nisha",
  categories = c("Fiction", "Comics", "Stationery"),
  open_status = TRUE,
  daily_sales = c(2300, 1800, 2450, 2100)
)
business

# Accessing elements in multiple ways
business["shop_name"]       # as list
business[["shop_name"]]     # as value
business$owner              # shortcut

# Add a new field
business$rating <- 4.7

# Update sales data
business$daily_sales <- c(2500, 2200, 2700, 2600)

# Remove one element
business$open_status <- NULL

# View final list
business

# ------------------------------------------------------------
# 9. Nested Lists
# ------------------------------------------------------------
# Lists can contain other lists inside them.

university <- list(
  name = "City University",
  departments = list(
    science = c("Physics", "Chemistry", "Biology"),
    arts = c("History", "Literature"),
    commerce = c("Accounting", "Finance")
  ),
  established = 1992
)
university

# Access nested list element
university$departments$science[2]   # Chemistry

# ------------------------------------------------------------
# 10. Do’s and Don’ts with Lists in R
# ------------------------------------------------------------

# DO:
# - Use named lists for clarity.
# - Use $ or [[]] to access elements directly.
# - Use lists to store mixed data (text, numeric, logical, etc.).
# - Combine related information (like data for one student, customer, or product).

# DON’T:
# - Expect arithmetic operations to work directly on lists.
# - Mix list and matrix operations.
# - Use lists when all data is of the same type (use vectors or data frames instead).

# ------------------------------------------------------------
# 11. Summary
# ------------------------------------------------------------
# • Lists are containers for multiple data types.
# • [] returns a list, [[]] extracts a single element.
# • Use named lists for organized data.
# • You can add, modify, or remove list elements dynamically.
# • Lists are widely used in R for modeling results, configurations, or combined data.

###############################################################
# END OF DAY 3 SESSION
###############################################################
