chart1 <-source("https://raw.githubusercontent.com/info-201b-wi22/exploratory-analysis-eykh5/main/Exploratory%20Analysis%20Chart%201.R?token=GHSAT0AAAAAABQKLL3C5S6J7MESSWOJAMFKYQ34YJQ")
chart2 <-source("https://raw.githubusercontent.com/info-201b-wi22/exploratory-analysis-eykh5/main/Exploratory%20Analysis%20Chart%202.R?token=GHSAT0AAAAAABQKLL3DQJ5AFHSL65S6EZNSYQ34YXQ")
chart3 <-source("https://raw.githubusercontent.com/info-201b-wi22/exploratory-analysis-eykh5/main/Exploratory%20Analysis%20Chart%203.R?token=GHSAT0AAAAAABQKLL3C4OXKRGT5ACILJWDWYQ34ZBA")

library(dplyr)

AAPL_chart1 <- chart1$value$data

AAPL_chart2 <- chart2$value$data

AAPL_chart3 <- chart3$value$data

profit_chart_1 <- AAPL_chart1 %>% filter(Date==max(Date)) %>% pull(cumulative_profit)

profit_chart_2<- AAPL_chart2 %>% filter(Date==max(Date)) %>% pull(cumulative_profit)

profit_buy_day_one <- AAPL_chart3 %>% filter(Date==max(Date)) %>% pull(all_one_day_cumulative_profit)/nrow(AAPL_chart3)

profit_buy_everyday <- AAPL_chart3 %>% filter(Date==max(Date)) %>% pull(cumulative_profit)/nrow(AAPL_chart3)

AVG_Trade_Volume <- AAPL_chart1 %>% summarize(avg = mean(Volume))

value <- c(profit_chart_1, profit_chart_2, profit_buy_day_one, profit_buy_everyday, AVG_Trade_Volume)
