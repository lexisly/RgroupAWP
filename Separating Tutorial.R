#Separating Tutorial 

library(readr)
library(tidyverse)

#1) Loading data 

rat<-read.csv("rat_sample.csv")


#2) View data 

View(rat)


#3) Looking at source column 

#CASE 1: Individual options do not contain commas 


source<-rat %>% 
  select(source) %>% 
  separate(source, into=c("source_1", "source_2"), sep=",") 
  #in column titled "source," in each row the maximum number of options is always 2 so I put "source_1" and "source_2".
  #if someone selected three options for example I would put -> into = c("source_1", "source_2", "source_3")
  
  View(source) 
  # you will see here that in each row there is only one option but now you want everything in one column so you will need the pivot() function
  #I separated source_pivot from source so that you can visually see the in-between steps but you could connect the two using %>% 

  source_pivot<-rat %>% 
    pivot_longer(1:2, values_to = "source",
                #1:2 indicates column "1" to column "2" that you want to pivot into one column named "source" as indicated by the "values_to"               names_to = c("list"),
               values_drop_na = TRUE)
  #values_drop_na: is useful to drop any NA values if you have large datasets where some rows have fewer options and some have more options 
  #In this sample dataset you will not see the effect 


#4) Looking at food column 

#CASE 2: Individual options contains commas -> Example: Homemade food (i.e., pasta, oatmeal, etc.)



food_regular<-rat %>% 
  select(food) %>% 
  separate(food, into=c("food_1", "food_2", "food_3", "food_4", "food_5", "food_6"), sep=",") %>%  
  #when using "," as a separator, how many new columns are needed for each to be in a separate column to determine my into = c(""). 
  pivot_longer(1:6, values_to = "food",
               names_to = c("list"),
               values_drop_na = TRUE) 


View(food_regular)

#know filter out unwanted data points that were part of the extra info from () from one category 


  filtered_food<-food_regular %>% 
    filter(food %in% c("Other food. Please specify:",
                     "Commercial pellets",
                     "Commerical mix",
                     "Homemade food (i.e.")) 
  
  
  View(filtered_food)
  
  
  #%in% allows you to say filter so that it keeps everything that I specify in c("")
  
  #now if you wanted to rename some of the cateogry names to be nicer do the following: 
  
  rename_food<-filtered_food %>% 
    mutate(food = recode(food, "Other food. Please specify:" = "Other", 
                       "Homemade food (i.e." = "Homemade food"))

  View(rename_food)
  
  
  #Again you can combine all the codes technically with "%"
  