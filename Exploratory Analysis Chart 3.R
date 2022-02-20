library(ggplot2)
library(dplyr)

AAPL <-read.csv("https://raw.githubusercontent.com/info-201b-wi22/exploratory-analysis-eykh5/main/data_files/AAPL.csv?token=GHSAT0AAAAAABRCCMDV75U72KWW2PYCKDHIYQ23NNQ")



day_one_open <- AAPL[1,]$Open

open_price <- AAPL$Open

cumulative_sum <- c(0)

for (i in 1:length(open_price)){
  sum <- sum(open_price[1:i])
  cumulative_sum <- append(cumulative_sum, sum)
}

cumulative_sum <- cumulative_sum[-1]

AAPL <- mutate(AAPL, all_in_day_one_cost = 1826*day_one_open)

AAPL <- mutate(AAPL, buy_one_a_day_cost = cumulative_sum)

strat_all_buy<- ggplot(data = AAPL, aes(x=as.Date(Date))) + geom_point(mapping = aes(y = all_in_day_one_cost)) + geom_point(mapping = aes(y=buy_one_a_day_cost))
strat_all_buy