###############################################################
# R PROGRAMMING COOKBOOK : DAY 2
# Topic: Vectors and Matrices in R
###############################################################

# ------------------------------------------------------------
#  What you will learn today
# ------------------------------------------------------------
#  How to create and manipulate vectors
#  Indexing and extracting specific elements
#  Logical indexing
#  Vector recycling and how it works
#  Generating sequences using seq() and rep()
#  Creating and working with matrices
#  Matrix operations and attributes
#
# By the end of today’s session, you’ll understand how R stores,
# processes, and performs operations on tabular and sequential data.
# ------------------------------------------------------------


# ============================================================
# 1. INTRODUCTION TO VECTORS
# ============================================================

# A vector is the most basic data structure in R.
# It is a sequence of data elements of the same type.

# Creating a numeric vector
w <- c(11, 12, 13, 14, 15)
w

# Accessing elements by index
w[1]      # first element
w[3:4]    # elements from index 3 to 4
w[2:5]    # elements from index 2 to 5

# Indexing using logical values
w[c(FALSE, TRUE, TRUE, FALSE, TRUE)]
# TRUE = select element, FALSE = skip element
# Think of this like applying a filter manually.

# You can check the data type of a vector
mode(w)  # numeric

# ------------------------------------------------------------
# Example: A vector of student scores
scores <- c(90, 85, 78, 92, 88)
scores
# Access students who scored above 85
scores[scores > 85]

# ------------------------------------------------------------
# 2. MODIFYING AND INSERTING INTO A VECTOR
# ------------------------------------------------------------

# Original vector
w <- c(11, 12, 13, 14, 15)

# Insert a value (TRUE) in between existing values
w <- c(w[1], TRUE, w[2:length(w)])
w

# 💡 Explanation:
# w[1]            → takes first element (11)
# TRUE            → adds logical value TRUE
# w[2:length(w)]  → takes remaining elements
# c()             → combines them into a single vector

# Insert any element in the middle of a vector
x <- c(1, 2, 3, 4)
x <- c(x[1:2], 99, x[3:4])
x  # inserted 99 between 2 and 3

# Add value to start and end
w <- c(10, w)
w

w <- c(w, 10)
w

# ------------------------------------------------------------
# 3. VECTOR RECYCLING
# ------------------------------------------------------------

x <- c(1, 2, 3)
y <- c(10, 11, 12, 13)

x + y
# ⚠️ Warning message:
# "longer object length is not a multiple of shorter object length"

# 🧠 How it works:
# R repeats elements of the shorter vector until lengths match.
# Example:
# x = (1,2,3) → becomes (1,2,3,1)
# y = (10,11,12,13)
# Operation: (10+1, 11+2, 12+3, 13+1) → 11, 13, 15, 14

# In real analysis, recycling can be useful:
prices <- c(100, 200, 300, 400)
tax_rate <- 0.18
total_price <- prices + (prices * tax_rate)
total_price

# ------------------------------------------------------------
# 4. CREATING EMPTY OR PRE-DEFINED VECTORS
# ------------------------------------------------------------

x <- vector("numeric", 10)
x  # creates 10 zeros

# Fill vector using assignment and recycling
x[1:10] <- c(1, 2)
x

# Replace specific section
x[1:5] <- c(10)
x

# ------------------------------------------------------------
# 5. USING THE COLON (:) OPERATOR
# ------------------------------------------------------------

# The colon operator creates a simple integer sequence
n <- 10
n <- n - 1
n

1:(n - 1)
# Generates numbers 1 through 8

# Real-world analogy:
# If you need to simulate 10 days of sales data, use 1:10
days <- 1:10
days

# ------------------------------------------------------------
# 6. USEFUL FUNCTIONS: seq() and rep()
# ------------------------------------------------------------

# seq() - Generate sequences with more control
seq(from = 1, to = 10, by = 2)
a <- seq(1, 10, 2)
a

# rep() - Repeat elements
rep(c(1, 12), 3)
rep(5, 4)

# Combining both
rep(seq(1, 3), each = 2)  # repeat each twice
rep(seq(1, 3), times = 2) # repeat the full pattern twice

# Hands-on task:
# Generate all odd numbers between 1 and 15 and repeat each 3 times.
rep(seq(1, 15, 2), each = 3)

# ------------------------------------------------------------
# 7. ARRAYS AND MATRICES
# ------------------------------------------------------------

# A matrix is a 2D structure: rows × columns.
# Think of it as a table or spreadsheet.

x <- matrix(c(1, 2, 3, 4), nrow = 2, ncol = 2)
x

# Access elements using [row, column]
x[1, 1]  # row 1, column 1
x[2, 1]  # row 2, column 1
x[1, 2]  # row 1, column 2

# Get dimensions
dim(x)   # 2 rows, 2 columns

# ------------------------------------------------------------
# 8. CREATING EMPTY MATRIX
y <- matrix(nrow = 2, ncol = 2)
y
y[1:4] <- c(1, 2)
y
# By default, R fills matrices column by column (column-major order)

# ------------------------------------------------------------
# 9. MATRIX FILLING: byrow parameter
z <- matrix(c(1, 2, 3, 4, 5, 7, 8, 10), nrow = 2, byrow = TRUE)
z
# byrow = TRUE → fill row-wise
# byrow = FALSE → fill column-wise (default)

# Visual comparison
m_col <- matrix(1:6, nrow = 2, byrow = FALSE)
m_row <- matrix(1:6, nrow = 2, byrow = TRUE)
m_col
m_row

# ------------------------------------------------------------
# 10. MATRIX MATH
x <- matrix(c(1, 2, 3, 4), nrow = 2, byrow = FALSE)
x

x + 4          # adds 4 to every element
x + c(1, 2)    # vector recycling (column-wise)
x * 2          # multiply each element by 2

# Matrix multiplication (Dot product)
y <- matrix(c(1, 2, 3, 4), nrow = 2)
x %*% y        # matrix multiplication (rows × columns)
x * y          # element-wise multiplication

# ------------------------------------------------------------
# 11. attributes() FUNCTION
z <- matrix(seq(1, 6), nrow = 2, byrow = TRUE)
z
attributes(z)
length(z)

# Matrices are actually vectors with a 'dim' attribute
z[4]  # access element as if vector
as.vector(z)  # see underlying vector

# Remove attributes to convert matrix back to vector
z <- c(z)
attributes(z)
z

# ------------------------------------------------------------
# 12. ADDING ROWS AND COLUMNS
x <- matrix(c(1, 2, 3, 4), nrow = 2)
x

cbind(x, c(100, 100))       # add new column
rbind(x, c(100, 100))       # add new row

# If lengths mismatch
rbind(x, c(100, 100, 100))  # runs but extra ignored
cbind(x, c("Hello", "There"))  # converts all to character

# ------------------------------------------------------------
# 13. RECYCLING IN MATRICES
x <- matrix(c(1, 2), nrow = 4, ncol = 2)
x

x <- matrix(c(1, 2), nrow = 2, byrow = TRUE)
x

###############################################################
# 🧾 SUMMARY
###############################################################
#  Vectors hold one-dimensional data
#  Matrices are two-dimensional (rows x columns)
#  Indexing works with [] and can use numbers or logicals
#  Recycling repeats shorter data to match length
#  seq() and rep() are powerful for pattern generation
#  Matrices fill column-wise unless byrow = TRUE
#  attributes() reveals internal structure
#
# Real-world connection:
# - Vectors: Used for series (sales, prices, measurements)
# - Matrices: Used in machine learning, statistics, image data
###############################################################
