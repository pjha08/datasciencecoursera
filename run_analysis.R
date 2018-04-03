## Assuming the data has been extracted and we are in the test folder of the dataset
    ##Reading and creating test and train datasets
subject_test <- read.table("subject_test.txt")
X_test <- read.table("X_test.txt")
Y_test <- read.table("y_test.txt")
test_df <- cbind(subject_test,X_test,Y_test)
setwd("..")  ## going up one directory
setwd(paste(getwd(),"train",sep = "/"))## going into the train directory
##repeating for train
subject_train <- read.table("subject_train.txt")
X_train <- read.table("X_train.txt")
Y_train <- read.table("y_train.txt")
train_df <- cbind(subject_train,X_train,Y_train)
## merging train and test data using rbind
df <- rbind(test_df,train_df)
## using features to extract mean and std columns
setwd('..')
features <- read.table("features.txt")
df_mean_std <- df[,c(1,grep("\\bmean()\\b|\\bstd()\\b",features[,2]) + 1,563)]
## Actioning Step 4 before Step 3
colnames(df_mean_std) <- c("Subject",as.character(features[grep("\\bmean()\\b|\\bstd()\\b",features[,2]),2]),"Activity")
## Step 3: Substituting activity numbers for activity names like walking, sleeping etc. 
## Used the activities in the order they are provided in the readme file
df_mean_std[,68] <-  sub(1,"WALKING",df_mean_std[,68])
df_mean_std[,68] <- sub(2,"WALKING_UPSTAIRS",df_mean_std[,68])
df_mean_std[,68] <- sub(3,"WALKING_DOWNSTAIRS",df_mean_std[,68])
df_mean_std[,68] <- sub(4,"SITTING",df_mean_std[,68])
df_mean_std[,68] <- sub(5,"STANDING",df_mean_std[,68])
df_mean_std[,68] <- sub(6,"LAYING",df_mean_std[,68])

##STEP 5: involves 3 nested for loops
r <- data.frame()
for (i in unique(df_mean_std$Subject)) {
  q <- data.frame()
  for (j in unique(df_mean_std$Activity)) {
    avg_bind <- vector()
    for (k in 2:67) {
      avg_value <- mean(df_mean_std[df_mean_std$Activity==j & df_mean_std$Subject==i,k])
      avg_bind <- cbind(avg_bind,avg_value)
                    }
    p <- cbind(i,avg_bind,j)
    q <- rbind(q,p)
    }
    r <- rbind(r,q)
  }
colnames(r) <- c("Subject",paste("Average of",names(df_mean_std)[2:67]),"Activity")
tidy_df <- r
tidy_df

