# -----------

data = mtcars


data %>% 
  ggplot(aes(wt,mpg,color = as.factor(gear), shape = as.factor(cyl), size = hp))+
  geom_point(alpha =0.6)+
  scale_color_manual(values = c("#3a0cc3", "#c9184a", "#3a5a20")) + 
  geom_smooth(wt,mpg)



# -------
install.packages("MASS")
library(MASS)
data("Boston")

boston_data_long <- Boston %>%
  pivot_longer(cols = everything(),
               names_to = "variable",
               values_to = "value")

boston_histograms <- ggplot(boston_data_long, aes(x = value)) +
  geom_histogram(bins = 30, color = "black", fill = "lightblue") +
  facet_wrap(~variable,scale = "free", ncol = 4) +
  labs(title = "Histograms of Numeric Variables in the Boston Housing Dataset",
       x = "Value",
       y = "Frequency") +
  theme_minimal()

# Plot the histograms
print(boston_histograms)


# Spliting data ------

set.seed(123)
set1 = initial_split(Boston, prop = 0.75)
train_data <- training(data_split)
test_data <- testing(data_split)

# Fit model tree ----
# Create a decision tree model specification
tree_spec <- decision_tree() %>%
  set_engine("rpart") %>%
  set_mode("regression")

# Fit the model to the training data
tree_spec <- decision_tree() %>%
  set_engine("rpart") %>%
  set_mode("regression")
tree_fit = tree_spec %>%
  fit(medv ~ ., data = train_data)

# Testing ------
# Make predictions on the testing data
predictions <- tree_fit %>%
  predict(test_data) %>%
  pull(.pred)

# Calculate RMSE and R-squared
metrics <- metric_set(rmse, rsq)
model_performance <- test_data %>%
  mutate(predictions = predictions) %>%
  metrics(truth = medv, estimate = predictions)

print(model_performance)

## ------
library(rpart)
library(rpart.plot)
# loading data -----
#set.seed(123)
train_index = sample(1:nrow(s), size = 0.7 * nrow(s))
train = s[train_index, ]
test = s[-train_index, ]

# Train decision tree -----
tree = rpart(mpg ~ cyl + hp + drat + gear, data = train, method = "anova")
rpart.plot(tree, main = "Decision Tree")

# -----
s = mtcars

# Titanic -----

titanic %>% 
  explore(Age, target = Survived, n = n)

train_index = sample(1:nrow(titanic), size = 0.7 * nrow(titanic))
train = titanic[train_index, ]
test = titanic[-train_index, ]

# Tree -----
tree_titan = rpart(Survived ~ Class + Sex + Age, data = train, method = "anova")
rpart.plot(tree_titan, main = "Titanic survivaltree")


