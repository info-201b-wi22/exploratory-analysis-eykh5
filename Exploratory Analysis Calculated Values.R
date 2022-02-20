chart1 <-source("https://raw.githubusercontent.com/info-201b-wi22/exploratory-analysis-eykh5/main/Exploratory%20Analysis%20Chart%201.R?token=GHSAT0AAAAAABRCCMDVDJWUQ2J4AG7EUER4YQ3W7UA")
chart2 <-source("https://raw.githubusercontent.com/info-201b-wi22/exploratory-analysis-eykh5/main/Exploratory%20Analysis%20Chart%202.R?token=GHSAT0AAAAAABRCCMDUVCIPDAYZNISGLBQ6YQ3XAGA")
chart3 <-source("https://raw.githubusercontent.com/info-201b-wi22/exploratory-analysis-eykh5/main/Exploratory%20Analysis%20Chart%203.R?token=GHSAT0AAAAAABRCCMDU7RFY45IUQ5S3KWUOYQ3XAQA")

library(dplyr)

AAPL_chart1 <- chart1$value$data

AAPL_chart2 <- chart2$value$data

AAPL_chart3 <- chart3$value$data

profit_chart_1 <- AAPL_chart1 %>% filter(Date==max(Date)) %>% pull(cumulative_profit)

profit_chart_2<- AAPL_chart2 %>% filter(Date==max(Date)) %>% pull(cumulative_profit)

profit_buy_day_one <- AAPL_chart3 %>% filter(Date==max(Date)) %>% pull(all_one_day_cumulative_profit)/nrow(AAPL_chart3)

profit_buy_everyday <- AAPL_chart3 %>% filter(Date==max(Date)) %>% pull(cumulative_profit)/nrow(AAPL_chart3)

