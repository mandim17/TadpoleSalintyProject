
#library("lubridate")
#library("ggsurvfit")
#library("gtsummary")
#library("tidycmprsk")
#library("condsurv")
#library("survival")
#install.packages("tidyverse")
#install.packages("ggpubr")
#install.packages("instrstatix")
#install.packages("datarium")

# Everything under this section is code from the previous survival analysis I tried, but I am switching to a repeated measure anova

#names(dat)

#dat1 <- dat[ , 3:5]
#head(dat)

# C = 0, S = 1
#dat$Treatment <- factor(dat$Treatment, levels = c('0', '1'))

# options(contra?interaction.plot


#test2 <- survfit(Surv(Hours, ) ~ factor(Treatment) + Consumed, data = dat)
#plot(test2, col=1:5, ylab='Survival Probability', xlab='Hours')



# dat$Treatment <- factor(dat$Treatment, levels = c('C', 'S'))

#test1$strata

# habitat <- rep(C:S, test1$strata)




library(rstatix)
library(reshape)
library(tidyverse)
library(dplyr)
library(ggpubr)
library(plyr)
library(datarium)

dat <- read.csv('./data/clean_data/ProjectSurvivalData24hr.csv')


#data range
df <- data.frame(Container=rep(1:50, each=6),
                 Treatment=rep(0:1, times=1),
                  Consumed = c(0,1,2,3))
#data
df

model <- aov(Consumed~factor(Treatment)+Error(factor(Container)), data = df)

summary(model)



