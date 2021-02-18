library(tidyverse)
library(babynames)
View(babynames)
# 1880 - 2017
View(births)

ggplot(births, aes(year, births)) + 
  geom_line() +
  geom_smooth()

babynames %>% 
  filter(year %in% "1973" & name %in% "Brian") 
  count()
# Brian x thousands....
# count()

# counting the number of rows
View(births)
# sum()
# n_distinct()
# number of distinct entries - 
#instead of counting every 'brian,' just count each name once
births %>% 
  sum(births)

# this is wrong: sum(births)

# not working:sum(babynames$name)
babynames %>% 
 group_by(year) %>% 
  count() %>% 
  head(20)

# tail() 
# head()
babynames %>% 
  group_by(sex) %>% 
  count()

# distinct
1138293 / 786372
# 1.45 more F than M names
# n_distinct()
# mutate()
# arrange()

# what are the top 10 names in a given year?
 
   n_distinct(babynames$name)

  # mutate : create a new column
   # based on existing data
   
   # prop ~ 'percent'?
   
 babynames %>% 
   filter(name %in% "Mary" & sex %in% "F") %>% 
   ggplot(aes(year, prop)) + geom_line()

babynames %>% 
  mutate(percent = (prop * 100)) -> babynames_percent

View(babynames)
#mutate(new_column_name =  (formula))

babynames %>% 
  mutate(decade = group_by())

# using mutate to show 'rankings' 

# row_number()

babynames %>% 
  arrange(desc(prop)) %>% 
  mutate(rank = row_number()) -> ranks

View(ranks)

# john was a more popular name than mary in 1880
# arrange()

# 20 most popular names in 2017 ~ ncolored by sex
babynames %>% 
  filter(year %in% "2017") %>% 
  arrange(desc(n)) %>% 
  mutate(rank = row_number()) %>% 
  head(20) -> most_popular_2017
# prop is good for year-by-year comparisons;
# n is good for looking at one year 

ggplot(most_popular_2017, aes(name, n)) + geom_col()

### THIS IS WHERE CLASS ENDED ###
### HERE'S WHAT WE'LL DO NEXT ###

# let's improve it with 'arrange' inside our ggplot()
ggplot(most_popular_2017, aes(reorder(name, -n), n)) + geom_col()

#to cover: reorder (ggplot), coord_flip(), facet_wrap, 'scales', themes
# so we can get:
ggplot(most_popular_2017, aes(reorder(name, n), n, fill = sex)) + 
  geom_col() + 
  coord_flip() +
  facet_wrap(~sex, scales = 'free_y')




