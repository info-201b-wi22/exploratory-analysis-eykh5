chart1 <-source("https://raw.githubusercontent.com/info-201b-wi22/exploratory-analysis-eykh5/main/Exploratory%20Analysis%20Chart%201.R?token=GHSAT0AAAAAABRCCMDVDJWUQ2J4AG7EUER4YQ3W7UA")
chart2 <-source("https://raw.githubusercontent.com/info-201b-wi22/exploratory-analysis-eykh5/main/Exploratory%20Analysis%20Chart%202.R?token=GHSAT0AAAAAABRCCMDUVCIPDAYZNISGLBQ6YQ3XAGA")
chart3 <-source("https://raw.githubusercontent.com/info-201b-wi22/exploratory-analysis-eykh5/main/Exploratory%20Analysis%20Chart%203.R?token=GHSAT0AAAAAABRCCMDU7RFY45IUQ5S3KWUOYQ3XAQA")

library(dplyr)

rm(list=ls())

AAPL_chart1 <- chart1$value$data

AAPL_chart2 <- chart2$value$data

AAPL_chart3 <- chart3$value$data

profit_chart_1 <- AAPL_chart1 %>% filter(Date==max(Date)) %>% pull(cumulative_profit)

profit_chart_2<- AAPL_chart2 %>% filter(Date==max(Date)) %>% pull(cumulative_profit)

profit_buy_day_one <- AAPL_chart3 %>% filter(Date==max(Date)) %>% pull(all_one_day_cumulative_profit)/nrow(AAPL_chart3)

profit_buy_everyday <- AAPL_chart3 %>% filter(Date==max(Date)) %>% pull(cumulative_profit)/nrow(AAPL_chart3)

col_1_2 <- c(0, profit_chart_1-profit_chart_2, profit_chart_1 - profit_buy_day_one, profit_chart_1 - profit_buy_everyday, profit_chart_2- profit_chart_1, 0, profit_chart_2 - profit_buy_day_one, profit_chart_2 - profit_buy_everyday)

col_3_4 <- c(profit_buy_day_one - profit_chart_1, profit_buy_day_one - profit_chart_2, 0, profit_buy_day_one - profit_buy_everyday, profit_buy_everyday - profit_chart_1, profit_buy_everyday - profit_chart_2, profit_buy_everyday- profit_buy_day_one, 0)

combined_vector <- append(col_1_2, col_3_4)

profit_matrix <- matrix(combined_vector, ncol = 4)

profit_table <- as.table(profit_matrix)

profit_table
