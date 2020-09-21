#Loading the required packages

library(dplyr)

library(plyr)



#Loading test data set into R

X_test<- read.table("./QUIZ/UCI HAR Dataset/test/X_test.txt")

Y_test<- read.table("./QUIZ/UCI HAR Dataset/test/Y_test.txt")

Sub_test<- read.table("./QUIZ/UCI HAR Dataset/test/subject_test.txt")




#Loading train data set into R

X_train<- read.table("./QUIZ/UCI HAR Dataset/train/X_train.txt")

Y_train<- read.table("./QUIZ/UCI HAR Dataset/train/Y_train.txt")

Sub_train<- read.table("./QUIZ/UCI HAR Dataset/train/subject_train.txt")




# 1 : Merging training and test files to create one file.

X_final<- rbind(X_train, X_test)

Y_final<- rbind(Y_train, Y_test)

Sub_final<- rbind(Sub_train,Sub_test)



#Reading features and activity labels

features_text<- read.table("./QUIZ/UCI HAR Dataset/features.txt")

activity_labels<- read.table("./QUIZ/UCI HAR Dataset/activity_labels.txt",
                             col.names = c("Code", "Activity"))



# 2 : Extracting out the measurements on mean and standard deviation
#(finding the columns containing these words)

my_extract<- features_text[grep("mean\\(\\)|std\\(\\)", features_text[,2]),]

#// are escape lines and helps us in finding the text mean, std and not the
#function mean,std in the features text.

X_final<- X_final[,my_extract[,1]]

#putting together a table containing numbers in the format of those 
#columns which have been shortlisted by our my_extract function




# 3 : Using descriptive activity names to name the activity in the data set

Y_final$Code<- Y_final[,1] #adding column code

Y_final<- subset(Y_final, select = -V1)#removing column V1

Y_final<- join(Y_final,activity_labels) #will join in order of Y_final 
#according to the code




# 4 : Using descriptive labels on my X_final columns

colnames(X_final)<- features_text[my_extract[,1],2]



# 5 : using the data in 4 and creating a new data table with mean of
#each variable having each subject and label.  

colnames(Sub_final)<- "Subject"

newlabel<- Y_final[,-1] #creating a factor of labels from Y_final to
#be used in the next code

total<- cbind(X_final, Sub_final, newlabel)

total_mean<- total%>%
  group_by(Subject, activitylabel)%>%
  summarise_all(list(mean)) # grouping and making factors of subject, 
#new label and hence finding out the mean of every element.


write.table(total_mean,"totalmean.txt", row.names = FALSE)
#Writing the new table

#THANKS FOR REVIEWING. CHEERS :)

