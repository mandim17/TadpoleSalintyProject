library("lubridate")
library("ggsurvfit")
library("gtsummary")
library("tidycmprsk")
library("condsurv")
library(survival)

dat <- read.csv('')
head(R_Class_Final_Project_Survival_Data)

options(contrasts=c("contr.sum", "contr.poly"))
fit1 <- lm(Consumed ~ Treatment*Hours, data=dat) 

let_mod1=survfit(Surv(Hours)~Treatment+Consumed, data=R_Class_Final_Project_Survival_Data)
plot(let_mod1, ylab='Survival Probability', xlab='Hours')

