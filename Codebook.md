This Code Book accompanies the Final Project for the course "Getting and Cleaning Data"

## Study Design

This project was based on the Human Acivity Recognition Using Smartphones Dataset provided by Jorne L Reyes-Ortiz, Davide Anguita, Allessandro Ghio, and Luca Oneto .

Detailed information about this study is available by visiting this website

### Brief Overview of the Study Thirty volunteers between the ages of 19-48 participated in a study that gathered accelerometer and gyroscope sensor signals from smartphones. Participants were recorded while doing six activities:

    Walking
    Walking up stairs
    Walking down stairs
    Sitting
    Standing
    Laying

Data on 3-axial linear acceleration and 3-axial angular velocity were obtained and were provided in the data set used in this study.here are many details of how data were gathered, manipulated, and calculated in the document provided above and on the research team's website that are not pertinent to this code book. Data were split such that 30% comprised the "test" data and 70% the "training" data.

### Data Used in the Study For the puposes of this project, the following files were used in the downloaded zip file:

    Test Files
        X_test.txt
        y_test.txt
        subject_test.txt
    Training Files
        X_train.txt
        y_train.txt
        subject_train.txt
    Other used files
        features.txt
        activity_lables.txt

Test and training data sets were merged for completion of this project per the project instructions. A useful visual schematic of how the various data sets fit together was provided by David Hood on 13Sep14, and can be found at this link. This project is modeled closely on this schematic.

### Code Book Variable Specifics

Within the Test and Training data files, the following specifics of measurement are provided:

    'subject_train'/'subject_test' files: Individual rows identify the test subjects (range from 1 to 30)

    'total__acc' files: These provide the acceleration data in standard gravity units ("g"). Rows represent 128 element vectors

    'body__acc files: These provide body acceleration data calculated by subtracting gravity from the total acceleration

    'body__gyro files: These provide angular velocity in radians/second

### Final Variable Set

The final variable set is exported as "tidy_dat.txt" with the following variables:

    Subject: This provides the subject number (1-30) that has been summarized to produce the final data set

...and the following columns are summaries of the means for these subjects for each of these variables (in order):

    LAYING
    SITTING
    STANDING
    WALKING
    WALKING_DOWNSTAIRS
    WALKING_UPSTAIRS

These means are in the units specified above under "Code Book Variable Specifics" 
