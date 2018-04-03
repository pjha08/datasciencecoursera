=================================
---CREATING A TIDY DATA SET---
=================================
---STEP 1---
The data was downloaded from the link provided on the Assignement website and unzipped. 
The working directory at the start of the script is the "Test" folder of the unzipped data.
The "Inertial Signals" folder was ignored since all its columns would have to be excluded after the second step since no column description has been provided for them.
The train and test data were combined using the rbind function since they were intially part of the same dataset which was divided in an approximately 70:30 ratio.

---STEP 2---
The columns providing the mean and the standard deviation values were identified from the features file.
The grep function was used to find the column index of the required columns in the dataframe "df". Addition of 1 to the column index was required because the dataframe "df" contained an extra column "Subject" when compared to the features list. 
The required data frame df_mean_std was created.   

---STEP 4---
STEP 4 was actioned before STEP 3 because it seemed a natural continuation of STEP 2.
The column names of df_mean_std were extracted from the features file using the grep function.

---STEP 3---
The sub() function was used to substitute the numbers for their descriptive names.
The following relation was assumed according to the order the activities were provided in the README file:
1: WALKING
2: WALKING_UPSTAIRS
3: WALKING_DOWNSTAIRS
4: SITTING
5: STANDING
6: LAYING

---STEP 5---
Involves 3 nested "for" loops.
The algorithm in simple words is that for every subject and every activity calculate the mean for that activity and subject. The values are then put together using rbind and cbind to get the required tidy dataframe.
