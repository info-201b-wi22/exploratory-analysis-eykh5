library(dplyr)
library(ggplot2)
AAP <- read.csv("https://raw.githubusercontent.com/info-201b-wi22/exploratory-analysis-eykh5/main/AAPL.csv")
View(AAP)
rm(list = ls())
AAPL <- AAP%>% 
  group_by(Open, Close) %>% 
  mutate(buy_opening_sell_closing = c(Open - Close))
View(AAPL)
