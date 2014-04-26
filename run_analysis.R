run_analysis <- function(){
  ## Selected columns:mean and standard deviation for each measurement. 
  col<-c("V1","V2","V3","V4","V5","V6","V41","V42","V43","V44","V45","V46","V81","V82","V83","V84","V85","V86","V121","V122","V123","V124","V125","V126","V161","V162","V163","V164","V165","V166","V201","V202","V214","V215","V227","V228","V240","V241","V253","V254","V266","V267","V268","V269","V270","V271","V345","V346","V347","V348","V349","V350","V424","V425","V426","V427","V428","V429","V503","V504","V516","V517","V529","V530","V542","V543")
  ## We read files X_train and y_train
  y_train <- read.table("~/train/y_train.txt")
  names(y_train)[names(y_train)=="V1"]<-"id"
  X_train <- read.table("~/train/X_train.txt")
  ## We join X_train data frame and y_train data frame
  aux1<-cbind(y_train,X_train[col])
  ## We get rows from every activity
  aux11<-subset(aux1, id=="1")
  aux12<-subset(aux1, id=="2")
  aux13<-subset(aux1, id=="3")
  aux14<-subset(aux1, id=="4")
  aux15<-subset(aux1, id=="5")
  aux16<-subset(aux1, id=="6")
  ## We read files X_test and y_test
  y_test <- read.table("~/test/y_test.txt")
  names(y_test)[names(y_test)=="V1"]<-"id"
  X_test <- read.table("~/test/X_test.txt")
  ## We join X_test data frame and y_test data frame
  aux2<-cbind(y_test,X_test[col])
  ## We get rows from every activity
  aux21<-subset(aux2, id=="1")
  aux22<-subset(aux2, id=="2")
  aux23<-subset(aux2, id=="3")
  aux24<-subset(aux2, id=="4")
  aux25<-subset(aux2, id=="5")
  aux26<-subset(aux2, id=="6")
  ## We combine rows from every activity and every data set, and we get the average 
  auxt1<-rbind(aux11,aux21)
  Average1<-colMeans(auxt1)
  Average1["id"]="WALKING"
  auxt2<-rbind(aux12,aux22)
  Average2<-colMeans(auxt2)
  Average2["id"]="WALKING_UPSTAIRS"
  auxt3<-rbind(aux13,aux23)
  Average3<-colMeans(auxt3)
  Average3["id"]="WALKING_DOWNSTAIRS"
  auxt4<-rbind(aux14,aux24)
  Average4<-colMeans(auxt4)
  Average4["id"]="SITTING"
  auxt5<-rbind(aux15,aux25)
  Average5<-colMeans(auxt5)
  Average5["id"]="STANDING"
  auxt6<-rbind(aux16,aux26)
  Average6<-colMeans(auxt6)
  Average6["id"]="LAYING"
  ## We combine all rows
  taux<-rbind(Average1,Average2,Average3,Average4,Average5,Average6)
  ## We renames the columns names
  Names<-c("Activity","tBodyAcc-mean()-X","tBodyAcc-mean()-Y","tBodyAcc-mean()-Z","tBodyAcc-std()-X","tBodyAcc-std()-Y","tBodyAcc-std()-Z","tGravityAcc-mean()-X","tGravityAcc-mean()-Y","tGravityAcc-mean()-Z","tGravityAcc-std()-X","tGravityAcc-std()-Y","tGravityAcc-std()-Z","tBodyAccJerk-mean()-X","tBodyAccJerk-mean()-Y","tBodyAccJerk-mean()-Z","tBodyAccJerk-std()-X","tBodyAccJerk-std()-Y","tBodyAccJerk-std()-Z","tBodyGyro-mean()-X","tBodyGyro-mean()-Y","tBodyGyro-mean()-Z","tBodyGyro-std()-X","tBodyGyro-std()-Y","tBodyGyro-std()-Z","tBodyGyroJerk-mean()-X","tBodyGyroJerk-mean()-Y","tBodyGyroJerk-mean()-Z","tBodyGyroJerk-std()-X","tBodyGyroJerk-std()-Y","tBodyGyroJerk-std()-Z","tBodyAccMag-mean()","tBodyAccMag-std()","tGravityAccMag-mean()","tGravityAccMag-std()","tBodyAccJerkMag-mean()","tBodyAccJerkMag-std()","tBodyGyroMag-mean()","tBodyGyroMag-std()","tBodyGyroJerkMag-mean()","tBodyGyroJerkMag-std()","fBodyAcc-mean()-X","fBodyAcc-mean()-Y","fBodyAcc-mean()-Z","fBodyAcc-std()-X","fBodyAcc-std()-Y","fBodyAcc-std()-Z","fBodyAccJerk-mean()-X","fBodyAccJerk-mean()-Y","fBodyAccJerk-mean()-Z","fBodyAccJerk-std()-X","fBodyAccJerk-std()-Y","fBodyAccJerk-std()-Z","fBodyGyro-mean()-X","fBodyGyro-mean()-Y","fBodyGyro-mean()-Z","fBodyGyro-std()-X","fBodyGyro-std()-Y","fBodyGyro-std()-Z","fBodyAccMag-mean()","fBodyAccMag-std()","fBodyBodyAccJerkMag-mean()","fBodyBodyAccJerkMag-std()","fBodyBodyGyroMag-mean()","fBodyBodyGyroMag-std()","fBodyBodyGyroJerkMag-mean()","fBodyBodyGyroJerkMag-std()")
  for (i in 1:67){
    colnames(taux)[i]<-Names[i]
  }
  write.table(taux, "data.txt", quote=FALSE, sep="\t", row.names=FALSE) 
}