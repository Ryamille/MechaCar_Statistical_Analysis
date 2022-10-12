#Deliverable 1
library(dplyr)
mechacar_mpg <- read.csv(file='MechaCar_mpg.csv',check.names=F,stringsAsFactors = F)
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=mechacar_mpg)
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=mechacar_mpg))
#Deliverable 2
suspension_coil <- read.csv(file='Suspension_Coil.csv',check.names=F,stringsAsFactors = F)
#total_summary
total_summary <- suspension_coil %>% summarize(Mean_PSI=mean(PSI),
                                               Median_PSI=median(PSI),
                                               Var_PSI=var(PSI),
                                               Std_Dev_PSI=sd(PSI),
                                               Num_Coil=n(), .groups = 'keep')
#lot_summary
lot_summary <- suspension_coil  %>% group_by(Manufacturing_Lot) %>% summarize(Mean_PSI=mean(PSI),
                                                                         Median_PSI=median(PSI),
                                                                         Var_PSI=var(PSI),
                                                                         Std_Dev_PSI=sd(PSI),
                                                                         Num_Coil=n(), .groups = 'keep')
#Deliverable 3
t.test(suspension_coil$PSI,mu=1500)

t.test(subset(suspension_coil,Manufacturing_Lot =="Lot1")$PSI,mu = 1500)
t.test(subset(suspension_coil,Manufacturing_Lot =="Lot2")$PSI,mu = 1500)
t.test(subset(suspension_coil,Manufacturing_Lot =="Lot3")$PSI,mu = 1500)