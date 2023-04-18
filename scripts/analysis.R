#Load packages
library(rstatix)
library(reshape)
library(tidyverse)
library(dplyr)
library(ggpubr)
library(plyr)
library(datarium)
library(lattice)
library(survival)
library(dplyr)
library(survival)
library(survminer)

# Load tadpole survival/nymph consumption data
dat <- read.csv('./data/clean_data/ProjectSurvivalData.csv')


#Find outliers in data set
dat %>%
  group_by(Treatment, Hours) %>%
  identify_outliers(Consumed)


#Find the mean
dat %>%
  group_by(Treatment, Hours, Consumed) %>%
  summarize(mean_consumed = mean(Consumed))

#Run two way anova/repeated measures anova
?anova_test

twoway <- aov(Consumed ~  Treatment + Hours + Treatment:Hours + Error(factor(Container)),
              data=dat)
summary(twoway)

#See if there is an interaction/correlation between the amount consumed and treatment+time

interaction <- aov(Consumed ~ Hours*Treatment, data=dat)
summary(interaction)

#Create a graph to visual tadpole survival/how many tadpoles nymphs consumed
tad_key <- list(x = NULL, y = NULL, corner = c(0, 1),
                text = list(c("Salinity", "Control")),
                lines = list(col = c("red", "blue")))

xyplot(Consumed ~ Hours, group = Treatment, main = "Tadpoles Consumed", data = dat, type= "a", col=c("blue", "red"), key = tad_key)


#Load data for nymph survival
datnymph <- read.csv('./data/clean_data/Nymphsurvival.csv')

#Create a graph to visualize nymph survival rates
nymph_key <- list(x = NULL, y =NULL, corner = c(0,0),
                  text = list(c("Control", "12ppt", "16ppt","20ppt")),
                  lines = list(col = c("blue", "red", "yellow", "green")))

xyplot(Survival ~ Days, group = Salinity, main = "Nymph Survival", data = datnymph, type= "a", col=c("blue", "red", "yellow", "green"), key = nymph_key)



#Load nymph activity data

nymphact<-read.csv('./data/clean_data/Nymphactivity.csv')

#Run a t-test on nymph activity between the control and salinity to see if there is any significance between treatments
n_act <- t.test(nymphact$Control_activity, nymphact$Salinity_activity , var.equal = TRUE)
n_act

#Create a box and whisker plot to visualize nymph activity data
ggboxplot(nymphact, x = "Treatment", y = "Activity", color = "Treatment", ylab = "Nymph Activity (proportion of time)", xlab = "Treatment")

#Load tadpole activity data
tadact <- read.csv('./data/clean_data/Tadpoleactivity.csv')

#Run a t-test on tadpole activity between the control and salinity to see if there is any significance between treatments
t_act <- t.test(tadact$Control_activity, tadact$Salinity_activity, var.equal = TRUE)
t_act

#Create a box and whisker plot to visualize tadpole activity data
ggboxplot(tadact, x = "Treatment", y = "Activity", color = "Treatment", ylab = "Tadpole Activity (proportion of time)", xlab = "Treatment")
          

