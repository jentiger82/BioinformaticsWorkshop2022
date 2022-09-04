
## Hands-on activity One ##

View(mtcars)

# Filter mtcars for cars where "cyl" is 6 or more
mtcars %>%
  filter(cyl >= 6)

# Select the "disp" and "wt" and "mpg" columns from mtcars
mtcars %>%
  select(disp, wt, mpg)

# Group mtcars by number of cylinders, "cyl"
mtcars %>%
  group_by(cyl)

# Add up the number of cars in each cylinder group
mtcars %>%
  group_by(cyl) %>%
  tally()

# Calculate the median weight, "wt", in each cylinder group
mtcars %>%
  group_by(cyl) %>%
  summarize(median_wt = median(wt))

# Create a new column which contains the ratio of horse power, "hp", to "mpg"
# AND only keep the cars with "wt" greater than 3
mtcars %>%
  filter(wt > 3) %>%
  mutate(hp_mpg_ratio = hp/mpg)

# Group mtcars by "gear" and then find the average "hp" to "wt" ratio
mtcars %>%
  group_by(gear) %>%
  summarize(avg_hp_mpg_ratio = mean(hp/wt))


## Hands-on activity Two ##

View(iris)

# Group iris by "Species" 

iris %>%
  group_by(Species)

# Find the average "Sepal.length" to "Petal.length" ratio per species

iris %>%
  group_by(Species) %>%
  summarize(avg_sep_pet_ratio = mean(Sepal.Length/Petal.Length))
  

# Pipe this into ggplot2. Set x axis to "Species", y to the ratio column

iris %>%
  group_by(Species) %>%
  summarize(avg_sep_pet_ratio = mean(Sepal.Length/Petal.Length)) %>%
  ggplot(aes(x = Species, y = avg_sep_pet_ratio))

# Add the barplot geometry

iris %>%
  group_by(Species) %>%
  summarize(avg_sep_pet_ratio = mean(Sepal.Length/Petal.Length)) %>%
  ggplot(aes(x = Species, y = avg_sep_pet_ratio)) +
  geom_bar(stat = "identity")

# Set y axis label to "Average of Sepal to Petal length (cm)"

iris %>%
  group_by(Species) %>%
  summarize(avg_sep_pet_ratio = mean(Sepal.Length/Petal.Length)) %>%
  ggplot(aes(x = Species, y = avg_sep_pet_ratio)) +
  geom_bar(stat = "identity") + 
  ylab("Average of Sepal to Petal length(cm)")

# Color the plot by species


iris %>%
  group_by(Species) %>%
  summarize(avg_sep_pet_ratio = mean(Sepal.Length/Petal.Length)) %>%
  ggplot(aes(x = Species, y = avg_sep_pet_ratio, fill = Species)) +
  geom_bar(stat = "identity") + 
  ylab("Average of Sepal to Petal length(cm)")


# Set the title to "Iris flower analysis"

iris %>%
  group_by(Species) %>%
  summarize(avg_sep_pet_ratio = mean(Sepal.Length/Petal.Length)) %>%
  ggplot(aes(x = Species, y = avg_sep_pet_ratio, fill = Species)) +
  geom_bar(stat = "identity") + 
  ylab("Average of Sepal to Petal length(cm)") + 
  labs(title = "Iris flower analysis")


