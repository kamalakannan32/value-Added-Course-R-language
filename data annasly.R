library(ggplot2)
library(dplyr)
expenses <- read.csv("dailyexpenses.csv")
View(expenses)
str(expensese)
expenses$Data <- as.Data(expenses$Data,"%d/%m/%y")
view(expenses)
tot <- expenses[,2:9]
total <- colSums(tot)
detail <-c("food","groceries","medical","fuel","toll","phone","electricity","miscellaneous")
tot_each <- data.frame(detail,total)
View(tot_each)
ggplot(data = tot_each,aes(x = detail,y=total))+
  geom_bar(stat = "Identity",fill ="Green")+
  labs(x="Items",y="Expenses",title="Comparing Expenses")
cm <- expenses[,2:9]
dt <- expenses[,1]
rs <- rowSums(cm)
dt <- as.Date(dt)
daily_tot <- data.frame(dt, rs)
View(daily_tot)
ggplot(data=daily_tot, aes(x = dt, y= rs))+
  geom_line(color = "green", size = 2)+
  labs(x = "Data", y = "Expenses", title = "Total Expenses")
  

md <- expenses[, 3]
de <- expenses[, 1]
daily_med <- data.frame(de,md)
View(daily_med)
ggplot(date = daily_med, aes(x = de, y =md)) + geom_point()+
  labs(x = "Expenses", y = "Medical", title = "Medical Expenses")
ggplot(expenses, aes(x = Medical)) +

