# 1.0 Load Packages

library(janitor)
library(lubridate)
library(tidyverse)
library(readxl)
library(tidyquant)


# Import the file
clients_df <- read.csv("00_data/csv/clients.csv")
clients_df

?read_excel()


install.packages("readxl")
library(readxl)
clients_tbl <- read_excel(path = "00_data/excel/ds_1.xlsx",
                          sheet = "Clients")
clients_tbl

reports <- read_excel(path = "00_data/excel/ds_1.xlsx",
                      sheet= "Reports")
reports
# Show the diff in all three format and reasons to use it

## Example of use case of Pipe:
# The %>% symbol is called the "pipe" operator.
# It takes the result of one step and passes it into the next step.
# This makes code easier to read instead of nesting many functions.
#
# Example:
# sqrt(log(100))   # normal nested functions
#
# 100 %>% log() %>% sqrt()   # same thing using pipes
#
# Think of it like saying: "Take 100, then log it, then take the square root."

10 %>% `*`(2) %>% `+`(5)
# Equivalent to (10 * 2) + 5

c(4, 9, 16) %>% mean() %>% sqrt()
# Equivalent to sqrt(mean(c(4, 9, 16)))

# Eploratory data Analysis (EDA)
clients_df %>%
  glimpse()

clients_df %>%  glimpse
head(clients_df)
summary(clients_df)



# Explane the mutate function and the below code
clients_df <- clients_df %>%
  mutate(dob = mdy(dob),
         admission_date = mdy(admission_date),
         client_id  = as.character(client_id),
         gender = as.factor(gender),
         race_ethnicity = as.factor(race_ethnicity),
         program_admitted = as.factor(program_admitted)) 

summary(clients_df)
# How to read this pipe step by step:
#
# Start with clients_df (your original data frame), then pass it into mutate()
# to transform columns as follows:

# dob = mdy(dob)
# - Convert the dob column from character (e.g., "9/1/2014") to a proper Date.
# - mdy() parses strings in month-day-year order.

# admission_date = mdy(admission_date)
# - Convert admission_date from character to Date using month-day-year parsing.

# client_id = as.character(client_id)
# - Change client_id from integer to character (e.g., 101 -> "101").
# - Useful when IDs should not be treated as numbers.

# gender = as.factor(gender)
# - Convert gender to a factor (categorical variable).
# - Helps with grouping, modeling, and consistent categories.

# race_ethnicity = as.factor(race_ethnicity)
# - Convert race_ethnicity to a factor for categorical analysis.

# program_admitted = as.factor(program_admitted)
# - Convert program_admitted to a factor (e.g., "foster", "residential").

# In plain words:
# "Take clients_df, then: parse dates, turn the ID into text,
# and convert categorical columns into factors."


clients_df <- clients_df %>% 
  select(client_id, county_state, admission_date) %>%
  #set_names(c("id", "location", "adm_date")) %>% 
  rename("id" = "client_id", "location" = "county_state") %>%
  separate("location",
           into = c("county", "state"),
           sep = ",",
           remove = TRUE) 


# Rows: 350
# Columns: 9
# $ client_id        <chr> "101", "102", "103", "104", "105", "106", "107…
# $ dob              <chr> "9/1/2014", "7/25/2014", "10/2/2016", "2/27/20…
# $ gender           <fct> male, female, female, male, male, female, male…
# $ race_ethnicity   <fct> white, white, white, white, white, latino, bla…
# $ county_state     <chr> "Buncome, North Carolina", "Buncome, North Car…
# $ admission_date   <date> 2019-01-03, 2019-02-12, 2019-02-18, 2019-03-0…
# $ program_admitted <fct> foster, foster, residential, foster, foster, f…
# $ ace_score        <int> 2, 3, 1, 3, 9, 9, 9, 7, 5, 1, 7, 6, 5, 4, 8, 7…
# $ dob_date         <date> 2014-09-01, 2014-07-25, 2016-10-02, 2008-02-2…

# Data Wrangling (select, set_names, rename  and seperate)

## explane in short how it works in R -  (select, set_names, rename  and seperate)

# control + shift + M, you will get %>% & shift + 3 for comment the line 
clients_df  <- clients_df %>%
  mutate(adm_year = year(admission_date),
         adm_quarter = quarter(admission_date),
         adm_month = month(admission_date, label= T))

clients_df %>% 
  filter(adm_year == "2020") %>%
  group_by(county, adm_quarter) %>% 
  count(sort = T) %>% 
  ungroup() %>% 
  View()



clients_2020_by_quarter <- clients_df %>% 
  filter(adm_year == 2020) %>%
  group_by(county, adm_quarter) %>% 
  count(sort = TRUE) %>% 
  ungroup()






# Session

clients_df <- read.csv("00_data/csv/clients.csv")
clients_df

clients_tbl <- read_excel(path = "00_data/excel/ds_1.xlsx",
                          sheet = "Clients")
reports <- read_excel(path = "00_data/excel/ds_1.xlsx",
                      sheet= "Reports")

#3.0 Exploratory data analysis (EDA)----

clients_df %>%  glimpse

head(clients_df)

summary(clients_df)


clients_df <- clients_df %>%
  mutate(dob = mdy(dob),
         admission_date = mdy(admission_date),
         client_id  = as.character(client_id),
         gender = as.factor(gender),
         race_ethnicity = as.factor(race_ethnicity),
         program_admitted = as.factor(program_admitted))


summary(clients_df)

clients_df %>% 
  glimpse()

head(clients_df)



clients_df %>% 
  select(client_id, county_state, admission_date) %>% 
  glimpse()


# select(), rename(), separate()

clients_df <- clients_df %>% 
  select(client_id, county_state, admission_date) %>%
  #set_names(c("id", "location", "adm_date")) %>% 
  rename("id" = "client_id", "location" = "county_state") %>%
  separate("location",
           into = c("county", "state"),
           sep = ",",
           remove = TRUE) 

clients_df %>% 
  glimpse()

head(clients_df)

# Create date features (year / quarter / month)

clients_df  <- clients_df %>%
  mutate(adm_year = year(admission_date),
         adm_quarter = quarter(admission_date),
         adm_month = month(admission_date, label= T))


head(clients_df)

# Aggregate: counts by county & quarter

clients_df %>% 
  filter(adm_year == "2020") %>%
  group_by(county, adm_quarter) %>% 
  count(sort = T) %>% 
  ungroup() %>% 
  View()


clients_df %>% 
  distinct(county)

clients_df %>% 
  group_by(county) %>% 
  count()


clients_df %>% 
  group_by(county) %>% 
  count() %>% 
  ungroup() %>% 
  slice_head(n = 5)
  

clients_df %>% 
  group_by(county) %>% 
  count() %>% 
  ungroup() %>% 
  slice_head(prop = .75)

# Top categories & vector extraction

top_5_counties <- clients_df %>% 
  group_by(county) %>% 
  count() %>% 
  ungroup() %>% 
  slice_head(n= 5) %>% 
  pull(county)



class(top_5_counties)
head(top_5_counties)

# Plot — bar chart by quarter & county

clients_adm_viz <- clients_df %>% 
  filter(adm_year == "2020" & county %in% top_5_counties) %>% 
  group_by(county, adm_quarter) %>% 
  count(sort = T) %>% 
  ungroup()  

clients_adm_viz %>% 
  glimpse()

head(clients_adm_viz)



clients_adm_viz %>% 
  ggplot(aes(x = adm_quarter , y = n))


clients_adm_viz %>% 
  ggplot(aes(x = adm_quarter , y = n)) + 
  geom_col() +
  facet_wrap(~ county)

clients_adm_viz %>% 
  ggplot(aes(x = adm_quarter , y = n)) + 
  geom_col() +
  facet_wrap(~ county) +
  geom_text(aes(label = n)) #, vjust = -0.5)


clients_adm_viz %>% 
  ggplot(aes(x = adm_quarter , y = n)) + 
  geom_col() +
  facet_wrap(~ county) +
  geom_text(aes(label = n), vjust = -0.5)


clients_adm_viz %>% 
  ggplot(aes(x = adm_quarter , y = n)) + 
  geom_col() +
  facet_wrap(~ county) +
  geom_text(aes(label = n), vjust = -0.5) + 
  #scale_y_continuous(limits = c(0 , 30))
  scale_y_continuous(limits = c(0 , max(clients_adm_viz$n)*1.2)) +
  labs(
    title = "Clients Admitted by county and Quarter"
  )


clients_adm_viz %>% 
  ggplot(aes(x = adm_quarter , y = n)) + 
  geom_col() +
  facet_wrap(~ county) +
  geom_text(aes(label = n), vjust = -0.5) + 
  #scale_y_continuous(limits = c(0 , 30))
  scale_y_continuous(limits = c(0 , max(clients_adm_viz$n)*1.2)) +
  labs(
    title = "Clients Admitted by county and Quarter" ,
    subtitle = "Top 5 counties for 2020",
    x = "Admission Quarter",
    y = "count"
  )


clients_adm_viz %>% 
  ggplot(aes(x = adm_quarter , y = n)) + 
  geom_col() +
  facet_wrap(~ county) +
  geom_text(aes(label = n), vjust = -0.5) + 
  #scale_y_continuous(limits = c(0 , 30))
  scale_y_continuous(limits = c(0 , max(clients_adm_viz$n)*1.2)) +
  theme_tq() + # Show other thems too which we can use
  labs(
    title = "Clients Admitted by county and Quarter" ,
    subtitle = "Top 5 counties for 2020",
    x = "Admission Quarter",
    y = "count"
  )










clients_adm_viz %>% 
  ggplot(aes(x= adm_quarter, y= n)) +
  geom_col() +
  facet_wrap(~ county) +
  geom_text(aes(label= n), vjust= -0.5) +
  scale_y_continuous(limits = c(0, max(clients_adm_viz$n)*1.2)) +
  theme_tq() +
  labs(
    title = "Clients Admitted by County and Quarter",
    subtitle = "Top 5 Counties for 2020",
    x = "Admission Quarter",
    y= "Count"
  ) 



head(clients_df)

clients_df <- clients_df %>%
  mutate(age_at_admission = as.numeric(admission_date - dob) / 365.25)

clients_df %>%
  ggplot(aes(x = age_at_admission, y = ace_score)) +
  geom_point(alpha = 0.6) +
  geom_smooth(method = "lm", se = FALSE) +
  labs(title = "ACE Score vs Age at Admission",
       x = "Age at Admission (years)",
       y = "ACE Score")



