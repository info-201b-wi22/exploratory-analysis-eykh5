library(ggplot2)
library(dplyr)

AAPL <-read.csv("https://raw.githubusercontent.com/info-201b-wi22/exploratory-analysis-eykh5/main/data_files/AAPL.csv?token=GHSAT0AAAAAABRCCMDV75U72KWW2PYCKDHIYQ23NNQ")

AAPL <- AAPL %>% mutate(day_number = c(1:nrow(AAPL)))

AAPL$cumulative_price = cumsum(AAPL$Open)

AAPL <- AAPL %>% mutate(cumulative_profit = Close*day_number - cumulative_price)

AAPL <- AAPL %>% mutate(total_price = AAPL[1,]$Open * nrow(AAPL)) %>% mutate(all_one_day_cumulative_profit = Close*nrow(AAPL) - total_price)

ggplot(data = AAPL) + geom_point(mapping = aes(x = as.Date(Date), y = cumulative_profit)) + geom_point(mapping = aes(x = as.Date(Date), y = all_one_day_cumulative_profit)) + 
  labs(x = "Date", y = "Cumulative Profit of buying at Closing, selling at Opening", title = "Buying at Closing and Selling at Opening")


# day_one_open <- AAPL[1,]$Open
# 
# open_price <- AAPL$Open
# 
# cumulative_sum <- c(0)
# 
# for (i in 1:length(open_price)){
#   sum <- sum(open_price[1:i])
#   cumulative_sum <- append(cumulative_sum, sum)
# }
# 
# cumulative_sum <- cumulative_sum[-1]
# 
# AAPL <- mutate(AAPL, all_in_day_one_cost = 1826*day_one_open)
# 
# AAPL <- mutate(AAPL, buy_one_a_day_cost = cumulative_sum)
# 
# strat_all_buy<- ggplot(data = AAPL, aes(x=as.Date(Date))) + geom_point(mapping = aes(y = all_in_day_one_cost)) + geom_point(mapping = aes(y=buy_one_a_day_cost))
# strat_all_buy