
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




library(xlsx)
library(rstatix)
library(reshape)
library(tidyverse)
library(dplyr)
library(ggpubr)
library(plyr)
library(datarium)

dat <- read.csv('./data/clean_data/ProjectSurvivalData24hr.csv')

#Repeated measures anova
set.seed(0123)
data("dat", package = "datarium")
dat %>% sample_n_by(Treatment, size = 1)

dat <- dat %>%
  gather(key = "Hours", value = "Consumed")

summary<-data %>%
  group_by(Hours) %>%
  get_summary_stats(Consumed, type = "mean_sd")
data.frame(summary)

