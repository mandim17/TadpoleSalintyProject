
library(rstatix)
library(reshape)
library(tidyverse)
library(dplyr)
library(ggpubr)
library(plyr)
library(datarium)
library(lattice)
library(survival)
install.packages("AICcmodavg")
install.packages("base")
library(dplyr)
library(survival)
library(survminer)
install.packages("survminer")
#plyr load first

dat <- read.csv('./data/clean_data/ProjectSurvivalData.csv')

datnymph <- read.csv('./data/clean_data/Nymphsurvival.csv')

datnymph$Salinity=as.factor(datnymph$Salinity)

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

#nymph survival graph
nymph_key <- list(x = NULL, y =NULL, corner = c(0,0),
                  text = list(c("Control", "12ppt", "16ppt","20ppt")),
                  lines = list(col = c("blue", "red", "yellow", "green")))

xyplot(Survival ~ Days, group = Salinity, main = "Nymph Survival", data = datnymph, type= "a", col=c("blue", "red", "yellow", "green"), key = nymph_key)


#tadpole survival graph
tad_key <- list(x = NULL, y = NULL, corner = c(0, 1),
                text = list(c("Salinity", "Control")),
                lines = list(col = c("red", "blue")))

xyplot(Consumed ~ Hours, group = Treatment, main = "Tadpoles Consumed", data = dat, type= "a", col=c("blue", "red"), key = tad_key)

#activity graphs



