library(dplyr)
library(ggplot2)
library(tidyr)

AAPL <- read.csv("https://raw.githubusercontent.com/info-201b-wi22/exploratory-analysis-eykh5/main/data_files/AAPL.csv?token=GHSAT0AAAAAABRCCMDV75U72KWW2PYCKDHIYQ23NNQ")

AAPL <- AAPL %>% 
  mutate(buy_at_closing_sell_at_opneing = c(Open - lag(Close)))

AAPL[is.na(AAPL)] = 0

AAPL$cumulative_profit = cumsum(AAPL$buy_at_closing_sell_at_opneing)

plot <- ggplot(data = AAPL) + geom_point(mapping = aes(as.Date(Date), y = cumulative_profit)) +
  labs(x = "Date", y = "Cumulative Profit of buying at Closing, selling at Opening", title = "Buying at Closing and Selling at Opening")
plot
                                                                      