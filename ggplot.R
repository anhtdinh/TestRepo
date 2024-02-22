data = mtcars


data %>% 
  ggplot(aes(wt,mpg,color = as.factor(gear), shape = as.factor(cyl), size = hp))+
  geom_point(alpha =0.6)+
  scale_color_manual(values = c("#3a0cc3", "#c9184a", "#3a5a20"))



