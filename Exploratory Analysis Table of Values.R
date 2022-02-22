calculated_val <- source("https://raw.githubusercontent.com/info-201b-wi22/exploratory-analysis-eykh5/main/Exploratory%20Analysis%20Calculated%20Values.R?token=GHSAT0AAAAAABRCCMDVLA57GJZ2QL5SUCJYYQ3Y36A")

col_1_2 <- c(0, profit_chart_2-profit_chart_1, profit_buy_day_one - profit_chart_1, profit_buy_everyday - profit_chart_1, profit_chart_1- profit_chart_2, 0, profit_buy_day_one - profit_chart_2, profit_buy_everyday - profit_chart_2)

col_3_4 <- c(profit_chart_1 - profit_buy_day_one, profit_chart_2 - profit_buy_day_one , 0, profit_buy_everyday - profit_buy_day_one, profit_chart_1 - profit_buy_everyday, profit_chart_2 - profit_buy_everyday, profit_buy_day_one - profit_buy_everyday, 0)

combined_vector <- append(col_1_2, col_3_4)

combined_vector <- round(combined_vector, 2)

profit_matrix <- matrix(combined_vector, ncol = 4)

profit_table <- as.table(profit_matrix)

colnames(profit_table) <- c("Buy At Closing|", "Buy At Opening|", "Buy & Hold|", "Buy One Everyday")

rownames(profit_table) <-c("Buy At Closing", "Buy At Opening", "Buy & Hold", "Buy One Everyday")

profit_table