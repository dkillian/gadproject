## The Run Analysis Code Book
This Code book presents a description of all the variables use used or generated. It's the Data dictionnary
Variables 
#### x_train and y_train 
are used to store the data transformed from the TXT X and Y train text files
#### x_test and y_test
are used to store the data transformed from the TXT X and Y train text files

#### subject_train and subject_test 
contain the data from the downloaded files.
#### x_data y_data 
Data sets obtained by transforming the Train and Test files
#### subject_data 
merge the previous datasets to further analysis.
#### features 
contains the correct names for the "x_data dataset", which are applied to the column names stored in 
#### mean_std_features
a numeric vector to extract the mean and the standard deviation of each measurement
#### mergedData 
received the big database created by  merging x_data, y_data and subject_data.
#### avrData
has the averages which will be later stored in a .txt file.
#### ddply() 
from the plyr package is used to apply colMeans() 
