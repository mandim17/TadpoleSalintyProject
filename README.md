#Object of project: Determine if tadpoles(prey) are disproportionately impacted by salinity compared to dragonfly nymphs(predators), and therefore more vulnerable to predation.

#The ProjectSurvivalData excel file contains all the data I collected this summer which is being analyzed. The analysis r file contains my code and the Readme contains the description and code information.

#The ProjectSurvivalData contains information on trial number, container number, timepoints when data was recorded(0.5-24hrs), and treatment (0 = Control, 1 = Salinity)

#Acknowledgments: Thank you to Dr. McGlinn and Dr. Welch.

#instructions & acknowledgements: still working on this

#Code still working on this
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


#Repeated measures anova (new code/format)

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

#model
model <- aov(Consumed~factor(Treatment)+Error(factor(Container)), data = df)

#summary of model
summary(model)

#graph
