library(knitr)
library(kableExtra)

dt <- mtcars[1:5, 1:6]
dt
kable(dt, format = "html")

dt %>% 
  kable(format = "html") %>% 
  kable_styling()
kable(dt) %>% 
  kable_styling(bootstrap_options = c("striped", "hover"))

kable(dt) %>% 
  kable_styling(bootstrap_options = c("striped", "hover", "condensed"))

kable(dt) %>%
  kable_styling(bootstrap_options = c("striped", "hover", "condensed", "responsive"))

kable(dt) %>%
  kable_styling(bootstrap_options = "striped", full_width = F)



debug(ggplot2:::collide)
ggplot(data = iris, aes(Species, Sepal.Length)) +
  geom_boxplot(aes(colour = Sepal.Width < 3.2), varwidth = TRUE)

