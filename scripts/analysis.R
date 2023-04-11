
library(rstatix)
library(reshape)
library(tidyverse)
library(dplyr)
library(ggpubr)
library(plyr)
library(datarium)
install.packages("AICcmodavg")

#plyr load first

dat <- read.csv('./data/clean_data/ProjectSurvivalData.csv')

#Find outliers in data set
dat %>%
  group_by(Treatment, Hours) %>%
  identify_outliers(Consumed)


#mean
dat %>%
  group_by(Treatment, Hours, Consumed) %>%
  summarize(mean_consumed = mean(Consumed))

#Anova test
?anova_test

twoway <- aov(Consumed ~  Treatment + Hours + Treatment:Hours + Error(factor(Container)),
              data=dat)
summary(twoway)

interaction <- aov(Consumed ~ Hours*Treatment, data=dat)
summary(interaction)

#graph

library(AICcmodavg)

model.set <- list(twoway, interaction)
model.names <- c("twoway", "interaction")

aictab(model.set, modnames = model.names)


#graph
xyplot(Otime, group = Id, data = dtL.data, type = "b")
