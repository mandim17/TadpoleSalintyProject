library("lubridate")
library("ggsurvfit")
library("gtsummary")
library("tidycmprsk")
library("condsurv")
library("survival")

dat <- read.csv('./data/clean_data/ProjectSurvivalData.csv')
head(R_Class_Final_Project_Survival_Data)
dat <- dat[ , 1:5]
head(dat)
dat$Treatment <- factor(dat$Treatment, levels = c('C', 'T'))

# options(contrasts=c("contr.sum", "contr.poly"))
fit1 <- lm(Consumed ~ Treatment*Hours, data=dat) 
summary(fit1)

let_mod1=survfit(Surv(Consumed)~Treatment+Hours, data=dat)
plot(let_mod1, ylab='Survival Probability', xlab='Hours')

