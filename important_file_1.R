# An exploration of 2-letter names
library(babynames)
library(tidyverse)
library(ggthemes)

# I want to look at the frequency of 2-letter names in the babynames dataset. 
# Were they more common in the past or in the present? Wasthere a period where
# they were more popular?
# are they more popular with boys or with girls? 

# After finding this report on Kaggle:
# https://www.kaggle.com/residentmario/pet-names-versus-baby-names
# I decided to .... 

# Process

# Let's start by adding a column to our dataset that shows the name length
babynames %>% 
  mutate(length = (str_length(name))) -> babynames_length

View(babynames_length)
# Now let's limit the dataset to ONLY 2-letter names
babynames_length %>% 
  filter(length == 2) -> b2

View(b2)

# In what years were 2-letter names popular?

# Let's arrange the names by popularity
b2 %>% 
  arrange(desc(prop))

# 'Jo' is the mostpopular 2-letter name, by far

# How many 2-letter names in total?
b2 %>% 
  count()
# 4,660

#What about by year?

b2 %>% 
  group_by(year) %>% 
  count() %>% 
  ggplot(aes(year, n)) + geom_line() 

# It seems 2-letter names peaked around 1920, before dipping off for a while,
# and then became much more popular.

# Let's look at 'Jo'
b2 %>% 
  filter(name %in% "Jo") %>% 
  ggplot(aes(year, prop)) + geom_line()
# That's a zigzag - let's split by gender
b2 %>% 
  filter(name %in% "Jo" & sex=="F") %>% 
  ggplot(aes(year, prop)) + geom_line()
# What about 'not jo?'
b2 %>% 
  filter(!name %in% "Jo") -> notJo

View(notJo)
# ed, ty, al, wm

# Let's looik at the 5 most popular 2-letter names

b2 %>% 
  filter(name %in% c("Jo", "Ed", "Ty", "Al", "Wm")) %>% 
  ggplot(aes(year, prop, color = name)) + geom_line() + facet_wrap(~sex)



b2 %>% 
  filter(name %in% c("Jo", "Ed", "Ty", "Al", "Wm")) %>% 
  ggplot(aes(year, prop, color = name)) + geom_line() + facet_wrap(~name)
# facet-wrap

b2 %>% 
  group_by(sex) %>% 
  count()

# Conclusion
# Jo, boys ~ 2-letter names

