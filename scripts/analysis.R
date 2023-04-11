
library(rstatix)
library(reshape)
library(tidyverse)
library(dplyr)
library(ggpubr)
library(plyr)
library(datarium)

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

model <- aov(Consumed ~ Hours * Treatment, data=dat)
summary(model)

#graph



