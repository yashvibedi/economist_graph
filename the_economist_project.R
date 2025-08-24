library(ggplot2)
library(ggthemes)
library(plotly)
df <- read.csv("Economist_Graph_Data.csv")
head(df)
pl <- ggplot(df, aes(x = CPI, y = HDI))+
  geom_point(shape = 1, aes(color = factor(Region)), size = 5)+
  geom_smooth(aes(group = 1), se = FALSE, color = "red", method = "lm",
              formula = y ~ log(x))
pl
 country <- c("Russia", "Venezuela", "Iraq", "Myanmar", "Sudan",
                   "Afghanistan", "Congo", "Greece", "Argentina", "Brazil",
                   "India", "Italy", "China", "South Africa", "Spane",
                   "Botswana", "Cape Verde", "Bhutan", "Rwanda", "France",
                   "United States", "Germany", "Britain", "Barbados", "Norway",
                   "Japan", "New Zealand", "Singapore")
pl2 <- pl + geom_text(aes(label = Country), 
                      data = subset(df, Country %in% country),
                      check_overlap = TRUE, color = "gray20") +
  theme_economist_white() +
  labs(color = NULL, caption = "Source: Economist_Graph_Data.csv")

pl3 <- pl2 + scale_x_continuous(name = "Corruption Perceptions Index, 2011 (10 = least corrupt)",
                                limits = c(1,10), breaks = 1:10) +
  scale_y_continuous(name = "Human Development Index, 2011 (1 = best)",
                     limits = c(0.2,1))+
  ggtitle("Corruption and Human Development")
pl3
