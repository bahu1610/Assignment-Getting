# Assignment-Getting
#Getting and Cleaning data
This file has all information related to the tidying of the raw data, steps of it's processing and final output.

The repository Assignment-Getting has 4 files:
1. total_mean.txt: The text file of the table created at the final step.
2. Codebook.md: Containing the list of all variables used in our function.
3. run_analysis.R: Containing the R script having the functions.
4. README.md: This file containing all the steps.


Packages used:

1. DPLYR: Using grep() and many more.
2. PLYR: For the join function


The files needed to complete this project (in the working directory):

1.TEST FILES:
   a. X_test.txt
   b. Y_test.txt
   c. subject_test.txt 
2. TRAIN FILES:
   a. X_train.txt
   b. Y_train.txt
   c. subject_test.txt
3. Features.txt
4. activity_labels.txt

STEPS INVOLVED:

STEP 1: Merges the training and the test sets to create one data set.

SOL: First, load both the test and train datasets into the RStudio.
2. Load subject tests data also in R.
3. Use the rbind function to match the X, Y, Subject files of both test and train files respectively and that will merge them.\
4. Store them in suitable variables.


STEP 2: Extracts only the measurements on the mean and standard deviation for each measurement.

SOL: 1. Make a suitable variable and use the grep() function on features to extract rows having mean , std written in them.
2. Out of 561 rows only 68 are remaining now.
3. Use those rows in the X files of test and train as columns to find out the data.


STEP 3: Uses descriptive activity names to name the activities in the data set

SOL : 1. Make a new column in the files combined by Y files of train and test and name the column as CODE. 
2. In the activity labels file name the columns as CODE , ACTIVITY.
3. Use CODE as the by = CODE (key) as join both the datasets to make one. 
NOTE: Pass the Y files as the first argument of code.


STEP 4: Appropriately labels the data set with descriptive variable names.

SOL : Change the column names of X files by subsetting the features file on the basis of extracted number you got in STEP 2.



STEP 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

SOL : 1. Change the column name of subject files to SUBJECT.
2. Make a new factor label of the Y files where ACTIVITY was given.
3. Combine all columns of the above two files with the combined X files of test and train.
4. Do the function and write a new table.
