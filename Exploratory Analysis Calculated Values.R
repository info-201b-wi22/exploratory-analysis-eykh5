chart1 <-source("https://raw.githubusercontent.com/info-201b-wi22/exploratory-analysis-eykh5/main/Exploratory%20Analysis%20Chart%201.R?token=GHSAT0AAAAAABR2HSNRU7ZIQ7YBLVDIVLJKYQ5TGKA")
chart2 <-source("https://raw.githubusercontent.com/info-201b-wi22/exploratory-analysis-eykh5/main/Exploratory%20Analysis%20Chart%202.R?token=GHSAT0AAAAAABR2HSNRFWEGJY3FKLH337TYYQ5TG6A")
chart3 <-source("https://raw.githubusercontent.com/info-201b-wi22/exploratory-analysis-eykh5/main/Exploratory%20Analysis%20Chart%203.R?token=GHSAT0AAAAAABR2HSNRMABEQ6NKXQOCD22QYQ5THVQ")

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
