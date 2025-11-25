# Nonprofit Data Analysis in R----
# Install packages----

#CRAN packages----
# IF WINDOWS: DOWNLOAD Rtools- 
# https://cran.r-project.org/bin/windows/Rtools/


#Install a single package----
install.packages("fs")

#Install multiple packages at once----
# In the code below, we're saving the individual packages within a single variable called 'pcks_crans.' We will then run the same command as above, but rather than call a single package ('fs'), we call the variable 'pcks_cran.' 

# Save the package names within a variable:
pcks_cran <- c(
  "fs",         # working with the file system
  
  # Import
  "readxl",     # reading excel files
  "writexl",    # saving data as excel files
  "odbc",       # connecting to databases
  "RODBC",      # connecting to databases
  
  # Tidy, Transform, & Visualize
  "janitor",    # Clean data and basic transformations
  "tidyverse",  # dplyr, ggplot2, tibble, tidyr, readr, purrr, stringr, forcats
  "lubridate",  # working with dates and times
  "tidyquant",  # used mainly for the ggplot plotting theme
  
  # Model
  "tidymodels", # installs broom, infer, recipes, rsample, & yardstick
  "umap",       # used for visualizing clusters
  
  # Other
  "devtools"    # used to install non-CRAN packages
)

#Load the packages at once:
install.packages(pcks_cran) #Notice the quotation marks when loading a single package but the lack of quotation marks when loading a variable. 





