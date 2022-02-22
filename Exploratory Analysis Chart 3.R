library(dplyr)
library(ggplot2)
library(tidyr)

AAPL <-read.csv("https://raw.githubusercontent.com/info-201b-wi22/exploratory-analysis-eykh5/main/data_files/AAPL.csv?token=GHSAT0AAAAAABRCCMDV75U72KWW2PYCKDHIYQ23NNQ")

AAPL <- AAPL %>% mutate(day_number = c(1:nrow(AAPL)))

AAPL$cumulative_price = cumsum(AAPL$Open)

AAPL <- AAPL %>% mutate(cumulative_profit = Close*day_number - cumulative_price)

AAPL <- AAPL %>% mutate(total_price = AAPL[1,]$Open * nrow(AAPL)) %>% mutate(all_one_day_cumulative_profit = Close*nrow(AAPL) - total_price)

plot <- ggplot(data = AAPL) + geom_line(mapping = aes(x = as.Date(Date), y = cumulative_profit, color = cumulative_profit)) + geom_text(aes(x = as.Date("2021-1-4"), y = 200000,label = "All in Day One")) +
  geom_line(mapping = aes(x = as.Date(Date), y = all_one_day_cumulative_profit, color = all_one_day_cumulative_profit)) + 
  labs(x = "Date", y = "Cumulative Profit of buying at Closing, selling at Opening", color = "Profit($)", title = "Profit made from $40,000 Investment in Apple") + geom_text(aes(x = as.Date("2021-5-4"), y = 25000,label = "Buy Everyday"))

plot
