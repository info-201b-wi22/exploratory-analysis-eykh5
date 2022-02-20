library(dplyr)
library(ggplot2)
library(tidyr)

##  Describe the purpose of including the chart
# This line plot visualization displays the difference in profit for buying stock from Apple at day's open and selling it at day's close. It's purpose is to gain insight on whether this way of day trading is profitable over time.

## Describe any notable observations and insights from the chart
# This chart reveals an overall increase in the difference in profit while day-trading Apple stocks over time. While there is a significant increase in profits some days, there is similar decrease in profits on other days. Day-trading this way with Apple stock is relatively risky due to the significant increase and decrease in profit in recent times. 
AAPL <- read.csv("https://raw.githubusercontent.com/info-201b-wi22/exploratory-analysis-eykh5/main/data_files/AAPL.csv?token=GHSAT0AAAAAABRCCMDV75U72KWW2PYCKDHIYQ23NNQ")

AAPL <- AAPL %>% 
  mutate(buy_opening_sell_closing = Close - Open)

AAPL$cumulative_profit = cumsum(AAPL$buy_opening_sell_closing)

plot <- ggplot(AAPL) + geom_point(mapping = aes(x = as.Date(Date), y = cumulative_profit)) +
  labs(x = "Date", y = "Cumulative Profit of buying at open, selling at closing", title = "Buying at Open and Selling at Closing")