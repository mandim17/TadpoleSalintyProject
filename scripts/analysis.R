library("lubridate")
library("ggsurvfit")
library("gtsummary")
library("tidycmprsk")
library("condsurv")
library("survival")
install.packages("tidyverse")
install.packages("ggpubr")
instrstatix provides pipe-friendly R functions for easy statistical analyses
datarium

dat <- read.csv('./data/clean_data/ProjectSurvivalData24hr.csv')

names(dat)

dat1 <- dat[ , 3:5]
head(dat)

# C = 0, S = 1
dat$Treatment <- factor(dat$Treatment, levels = c('0', '1'))

# options(contrasts=c("contr.sum", "contr.poly"))
# fit1 <- lm(Consumed) ~ Hours*Treatment, data=dat) 
summary(dat)

# test1 <- survfit(Surv(Consumed)~Treatment, data=dat)
#plot(test1, ylab='Survival Probability', xlab='Consumed')

uni_id <- paste(dat$Trial, dat$Container, sep = '-')

mod <- lm(Consumed ~ factor(Treatment) * Hours + factor(uni_id), data = dat)

?interaction.plot


#test2 <- survfit(Surv(Hours, ) ~ factor(Treatment) + Consumed, data = dat)
#plot(test2, col=1:5, ylab='Survival Probability', xlab='Hours')



# dat$Treatment <- factor(dat$Treatment, levels = c('C', 'S'))

#test1$strata

# habitat <- rep(C:S, test1$strata)




