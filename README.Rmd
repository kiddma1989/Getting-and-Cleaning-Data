## Getting and Cleaning Data

The code is the final project for Week 4 in the Coursera class Getting and Cleaning Data. The script, ```run-analysis.R```, runs the following steps:

* Read the activity,  features and feature info in the ```//UCI HAR Dataset``` directory
* Read the datasets in the train and test folder, save only the variables with ```mean``` or ```standard deviation```
* Merge the datasets with ```activity``` and ```subject``` in the train and test folder
* Merge data of train and test into one dataset
* Convert ```activity``` and ```subject``` into factors
* Creat a tidy dataset of mean values of each variable for each subject and activity
* Write the dataset into a file of ```tidy_data.txt```