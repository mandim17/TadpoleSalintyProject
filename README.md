#Object of project: Determine if tadpoles(prey) are disproportionately impacted by salinity compared to dragonfly nymphs(predators), and therefore more vulnerable to predation.

#The code first runs a repeated measures anova on tadpole survival data then creates an xyplot visualization. These results are statistically significant between treatments at certain time points (30min and 24hr). The code then visualizes nymph salinity tolerance data (nymphs can tolerate up to 12ppt salinity). Next the code runs a t-test on both tadpole activity and nymph activity(both of these t-tests are not signicant between treatments) and creates a box and whisker plot to visualize this data.

#The ProjectSurvivalData.csv file contains the tadpole survivor data, the Nymphsurvival.csv contains nymph salinity tolerance trial results, the Nymphactivity.csv contains nymph activity data between the control and 6ppt salinity treatment, the Tadpoleactivity.csv contains tadpole activity data between the control and 6ppt salinity treatment. The analysis r file contains my code and the Readme contains the description and code information.

#The ProjectSurvivalData contains information on trial number, container number, timepoints when data was recorded(0.5-24hrs), and treatment (0 = Control, 1 = Salinity)

#The Nymphsurvival.csv contains time points(days) over a period of 30 days, survival (Survival is the amount of nymphs alive. If at 10 no nymphs dead, 9 means 1 nymph dead, etc.), and treatment (0.4ppt control = 0, 12ppt salinity = 1, 16ppt salinity = 2, 20ppt salinity =3).

#The Nymphactivity.csv contains a control_activity and salinity_activity collumn, which were used to perform a t-test to compare the means of the activity of the two treatments. It also contains a Treatment column (0.4ppt = control and 6ppt = salinity) and Activity column (proportion of time) which were used to create the box and whisker plot data visualization. 

#The Tadpoleactivity.csv contains a control_activity and salinity_activity collumn, which were used to perform a t-test to compare the means of the activity of the two treatments. It also contains a Treatment column (0.4ppt = control and 6ppt = salinity) and Activity column (proportion of time) which were used to create the box and whisker plot data visualization. 


#Results: significant difference in the amount of tadpoles consumed over a period of 30min and 24hrs between treatments. no other significant results.

#To recreate these results, follow the instructions provided in the analysis.R file with my project code.

#Acknowledgments: Thank you to Dr. McGlinn for assisting with the code and Dr. Welch for assisting me with my research.



