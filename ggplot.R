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



