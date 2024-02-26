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
tree_titan = rpart(Survived ~ Class + Sex + Age, data = train,
                   cp= 0.001,
                   maxdepth = 5,
                   minbucket = 5,
                   method = "class")
rpart.plot(tree_titan, main = "Titanic survivaltree")


# ------
library(caret)    

titanic_train <- read.csv("../input/train.csv")

titanic_train$Pclass <- ordered(titanic_train$Pclass,     # Convert to ordered factor
                                levels=c("3","2","1"))  

impute <- preProcess(titanic_train[,c(6:8,10)],  # Impute missing ages
                     method=c("knnImpute"))

titanic_train_imp <- predict(impute, titanic_train[,c(6:8,10)])     

titanic_train <- cbind(titanic_train[,-c(6:8,10)], titanic_train_imp)

# ----
car =mtcars %>% 
  pivot_longer(cols = everything(),
               names_to = "variable",
               values_to = "value")
              

car_histograms <- ggplot(car, aes(x = value)) +
  geom_histogram(bins = 30, color = "black", fill = "lightblue") +
  facet_wrap(~variable,scale = "free", ncol = 4) +
  labs(title = "Histograms of Numeric cars",
       x = "Value",
       y = "Frequency") +
  theme_minimal()

# Plot the histograms
print(car_histograms)


plot_data_his = function(car){
  car %>% 
    pivot_longer(cols = everything(),
                 names_to = "variable",
                 values_to = "value") %>% 
    ggplot(aes(x = value)) +
      geom_histogram(bins = 30, color = "black", fill = "lightblue") +
      facet_wrap(~variable,scale = "free", ncol = 4) +
      labs(title = "Histograms of Numeric cars",
           x = "Value",
           y = "Frequency") +
      theme_minimal() %>% 
    print()
  
}


# Alcohol ----
bac = read.csv("data.csv")
colnames(bac) = c("Country","Year", "General", "Young_driver", "Prof_driver")
bac = bac[-c(1),]


# World maps ------
