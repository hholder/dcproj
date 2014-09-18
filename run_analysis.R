
createTidyDataset <- function() {
  # read training data
  train <- read.table("X_train.txt")
  
  # read test data
  test <- read.table("X_test.txt")
  
  # combine the datasets
  dataset <- rbind(train, test)
  
  # read the features data
  features <- read.table("features.txt")
  
  # create a logical vector of features for mean and std measurements
  extract <- grepl("([:alnum:][:punct:])*mean([:alnum:][:punct:])*", features[,2]) | 
    grepl("([:alnum:][:punct:])*std([:alnum:][:punct:])*", features[,2])
  
  # create a numeric vector with the appropriate feature column numbers
  cols <- 1:561
  cols <- cols[extract]
  
  # subset the mean and std measurement columns from the combined dataset
  subdata <- dataset[,cols]
  
  # read feature names
  features <- read.table("features.txt")
  
  # get the subset of features used (features for mean and std)
  col_names <- features[cols, 2]
  
  # set descriptive column names
  names(subdata) <- col_names
  
  # read training activity labels
  train_acts <- read.table("y_train.txt")
  
  # read test activity labels
  test_acts <- read.table("y_test.txt")
  
  # combine activity labels
  acts <- rbind(train_acts, test_acts)
  names(acts) <- "ActivityId"
  
  # add labels to the subdata
  subdata <- cbind(acts, subdata)
  
  # read training subjects
  train_subs <- read.table("subject_train.txt")
  
  # read test subjects
  test_subs <- read.table("subject_test.txt")
  
  # combine subjects
  subs <- factor(unlist(rbind(train_subs, test_subs)))
  names(subs) <- "Subject"
  
  # add subjects to subdata
  subdata <- cbind(subs, subdata)
  
  # read activity labels
  act_labels <- read.table("activity_labels.txt")
  names(act_labels) <- c("ActivityId", "Activity")
  
  # add descriptive activity names
  labelled_data <- merge(act_labels, subdata)
  labelled_data <- cbind(Subject=labelled_data[,3], Activity=labelled_data[,2], labelled_data[,4:82])
  
  # melt the labelled dataset then summarize it by variable means
  melted <- melt(labelled_data, id=c("Subject", "Activity"), measure.vars=col_names)
  tidy <- dcast(melted, fill=0, Subject+Activity~variable,mean)
  
  write.table(tidy, "tidy.txt", row.name=F)
}