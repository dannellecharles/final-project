#Setting up 
library (gtsummary)
library (broom)
library (here)
library (renv)
library(tidyverse)
library(here)

data <- read.csv(here::here("congress-age", "congress-terms.csv"))

#Creating a new data set for Members in Congress in Office from 2000 and Later

congress2000 <- subset(data, termstart > as.Date("1999-01-06"))
incumbentcongress <- congress2000[congress2000$incumbent=="Yes",]

summary(incumbentcongress$age)
table(incumbentcongress$congress)

#Part I: Table of Descriptive Statistics Using gtsummary
tbl_summary(
  incumbentcongress,
  by = party,
  percent = "row",
  include= c(age,chamber,congress),
  label=list(
    age ~ "Age at Start of Term",
    chamber ~ "Chamber",
    congress ~ "Congress Meeting"
),
  missing_text = "Missing") |>
  bold_labels() |>
  modify_header(label='**Variables**',
                stat_1 = '**Democrat**',
                stat_2 = '**Independent**',
                stat_3 = '**Independent Democrat**',
                stat_4 = '**Republican**'
                )

#Part II: Part II: Regression using age (IV), chamber, meeting, and party (DV)

linear_model <- lm(age ~ chamber + party + congress,
                   data=incumbentcongress)

tbl_regression(
  linear_model, 
  intercept = TRUE,
  label = list(
    chamber ~ "Chamber",
    party ~ "Political Party",
    congress ~ "Congress Meeting"
  ))


#Part III: Make Histogram of the Ages of Congress by Political party

hist(incumbentcongress$age)

#Part IV: Using a Function to Calculate the Mean & Standard Deviation of Congress Members Age by Meeting

stats <- list(n=nrow(incumbentcongress),
              mean_age=mean(incumbentcongress$age))

stats2 <- list(n=nrow(incumbentcongress),
               std_age=sd(incumbentcongress$age))

