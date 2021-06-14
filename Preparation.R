###Data Preparation
#This cheat sheet is for R Code related to preparation and organization of Data

#### Loops - Borbala Tutorial ####
​
#create data frame to play with
​
data <- cbind(c(1:10),sample(1:50,10,replace = T),rep(c(0,1),5))
colnames(data) <- c("ID","Value","Filter")
data <- as.data.frame(data)
​
#Go over rows and multiply the value with filter
​
result=c()#Create empty vector to store the results in
for(i in 1:nrow(data))
{
  print(i)
  print(data[i,2]*data[i,3])
}
​
#Keep value only if filter is 1
data2 <- data #create a copy of the data set that will be manipulated
for(i in 1:nrow(data2))
{
  if(data2[i,3]==0) #manipulate values only if filter is 0
  {data2[i,2]=0}
}
​
​
##Double loop##
​
data3 <- cbind(data,data[,2:3]+10)
​
data4 <- data3 #create a copy of the data set that will be manipulated
for(i in 6:nrow(data3)) #go over rows
{
  for(j in 2:5 )#go over columns
  {
    data4[i,j]<- data4[i,j]+3
  }
}
​
### Large dataset ###
​
bindata <- read.csv("Bin_data.csv",header=T, sep=",")
​
dat <- bindata #Create copy of data to avoid accidentally overwriting something
​
#We want individual level data - how many individuals do we have?
length(unique(dat$Cow))
​
#Create empty data frame to put results into
feeding=data.frame(matrix(0,length(unique(dat$Cow)),4))
colnames(feeding)=c("Cow","Intake","Duration","Visits")
feeding$Cow=unique(dat$Cow)
​
cowfed=list() #empty list for the visits of each cow
par(mfrow=c(4,3))#setting how many plots we should have in one (this is a 4x3 matrix now)- this doesn't work with ggplot unfortunately.
for(i in 1:length(unique(dat$Cow)))#go over each cow to get variables we are interested in
{
  cowdat=dat[which(dat$Cow==unique(dat$Cow)[i]),]#visits for one cow
  cowfed[[i]]=cowdat #put the visits for this cow in a list
  names(cowfed)[i]=unique(cowdat$Cow)#name the list element with cow ID
  plot(cowdat$Duration,cowdat$Intake,main=unique(cowdat$Cow))#plot the relationship between intake and visit duration for each cow
  
  feeding[i,2]=sum(cowdat[which(cowdat$Intake>0),9]) #Intake in kg
  feeding[i,3]=sum(cowdat$Duration) #Total daily feeding time in s
  feeding[i,4]=dim(cowdat)[1] #Number of daily visits
  
}
