GettingandCleaningData
======================
The function is called: run_analysis() and it generates a data set as output names "Data.txt".

The script needs that the folders "test" and "train" find in the working directory:
~/train/X_train,y_train
~/test/X_test,y_test

The script works:
a) It defines a vector with the columns about mean and standard deviation for each measurement.
b) It reads the files X_train and y_train.
c) It joins the X_train data frame and y_train data frame.
d) It gets  rows from every activity in the data set "train" above.
e) It reads the files X_test and y_test.
f) It joins X_test data frame and y_test data frame.
g) It gets rows from every activity in the data test above.
h) It combines rows from every activity and every data set, and it gets the average.
i) It combines all rows.
j) It renames the columns.
k) It writes the file "Data.txt".
