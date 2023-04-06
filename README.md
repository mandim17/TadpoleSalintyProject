#Object of project: Determine if tadpoles(prey) are disproportionately impacted by salinity compared to dragonfly nymphs(predators), and therefore more vulnerable to predation.

#The ProjectSurvivalData excel file contains all the data I collected this summer which is being analyzed. The analysis r file contains my code and the Readme contains the description and code information.

#The ProjectSurvivalData contains information on trial number, container number, timepoints when data was recorded(0.5-24hrs), and treatment (0 = Control, 1 = Salinity)

#Acknowledgments: Thank you to Dr. McGlinn and Dr. Welch.



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
df <- data.frame(Hours=rep(, each=50),
                 Treatment=rep(0:1, times=1),
                  Consumed = c(0,1,2,3), data = dat)
#data
df

#model
model <- aov(Consumed~factor(Treatment)+factor(Hours), data = df)

#summary of model
summary(model)

#graph
par(cex=.6)


