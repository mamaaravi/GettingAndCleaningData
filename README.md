# GettingAndCleaningData
This repository cotains the following files:

    run_analysis.R
    codebook.md
    newData.csv
    xMatrixReduced.csv

The "run_analysis.R" file contains the R code that can be used to achieve the following:

    Transform the UCIHAR Dataset into a matrix of (observations) x (variables), where each observation is one of the 10299 data points captured in the appropriate study[1], and each of the rows is one of the variables measured. For details see description of the appropriate file xMatrixRecuced.csv in the codebook.md file.
    Produce a new dataset, newData.csv, which contains only the average value of each of the variables for each subject. For details see the description of the appropriate file newData.csv in the codebook.md file.

The codebook.md file describes the ouput files of run_analysis.R (newData.csv) and xMatrixReduced.csv, the variables, the data, and work that performed to clean up the data

The data used to generate the files in this repository was downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip on 2014 04 15. For detailed information about the data see http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
