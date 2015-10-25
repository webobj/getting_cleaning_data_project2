# Project Description

Compute mean and standard deviation by subject, activity and measurement variable

## Study design and data processing

### Collection of the raw data

The data is collected by the study in http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#

## Creating the tidy datafile

The source data is download from
* download a dataset from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Cleaning of the data

* unzip the data file
* merge the test and training dataset
* compute mean and standard deviation for each varable
* replace activity factor value with the activity label
* replace variable symbol with variable name
* store the output in subject_activity_variable_summary.txt.txt
