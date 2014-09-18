# Getting and Cleaning Data Course Project

This project creates a tidy dataset from the data obtained from the following dataset:
==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
[www.smartlab.ws](www.smartlab.ws)
==================================================================

The tidy dataset consists of a single file containing the the mean value for each of the mean or standard deviation variables in the original dataset grouped by Subject then Activity. The data was prepared as follows:
 * The test and train datasets were read into R
 * They were combined into a single dataset
 * A subset of the combined dataset was created containing only columns with mean/std measurements
 * The features dataset was read and used to set the column names
 * Test and train activity datasets were read, combined and then added as another column to the subset
 * Test and train subject datasets were read, combined and then added as another column to the subset
 * The activity labels data set was read and merged to the subset then the activity Ids were replaced by the descriptive names
 * The subset was then melted and a tidy dataset produced by taking the mean using subject and activity as Ids and all other columns as measures
