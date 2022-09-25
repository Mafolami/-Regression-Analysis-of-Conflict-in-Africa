#Import Data
conflict = read.csv(file.choose())

#View Dataset
View(conflict)
head(conflict, 5)
plot(conflict)

#Drop Country Variable
conflict$Country <- NULL
label<- (conflict$Actors)
label
conflict

#Remove Outliers
newconflict = conflict[-c(1,2,3,5,15),]

View(newconflict)
plot(newconflict)

#Assign variables
fatalities = newconflict$Fatalities
events = newconflict$Events
sources = newconflict$Sources
actors = newconflict$Actors

#Correlation Coefficients
cor(newconflict)

#Simple Linear Regression using 1 dependent and independent variable each
FatalityEvents = lm(fatalities~events)
summary(FatalityEvents)

#Multiple Linear Regression using more than 1 independent variable
MultiReg = lm(Fatalities~.,new)
summary(MultiReg)

#Akaike Information Criteria 
AIC1 = step(MultiReg)
summary (AIC1)

#With p-value of 1.526e-05 and Adjusted R-squared of 0.4047, we can conclude that Events--- 
#---with 4.32e-06 *** p-value is more significant than sources.

#Plot line of best fit
plot(fatalities,events,
     pch =20,
     col = "red",
     main = "Scatterplot of Events by Fatalities",
     xlab = "Number of Conflict Events",
     ylab = "Fatalities")

abline(lm(fatalities ~ events))
