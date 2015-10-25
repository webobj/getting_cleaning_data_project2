# To download data
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "data.zip")

# unzip data
unzip("data.zip")

# To merge training and test data
X_train <- read.table("UCI\ HAR\ Dataset/train/X_train.txt")
y_train <- read.table("UCI\ HAR\ Dataset/train/y_train.txt")
subject_train <- read.table("UCI\ HAR\ Dataset/train/subject_train.txt")
names(y_train) <- c('y')
names(subject_train) <- c('subject')
train <- cbind(subject_train, y_train, X_train)

X_test <- read.table("UCI\ HAR\ Dataset/test/X_test.txt")
y_test <- read.table("UCI\ HAR\ Dataset/test/y_test.txt")
subject_test <- read.table("UCI\ HAR\ Dataset/test/subject_test.txt")
names(y_test) <- c('y')
names(subject_test) <- c('subject')
test <- cbind(subject_test, y_test, X_test)
train_test <- rbind(train, test)

# To compute mean and standard deviation using melt and ddply

melted <- melt(train_test, id.vars=c('subject','y'))
means_stds <- ddply(melted, c("subject", "y", "variable"), summarise, mean=mean(value), sd=sd(value))

# Add activity label using join
activity_labels <- read.table("UCI\ HAR\ Dataset/activity_labels.txt")
names(activity_labels) <- c('y', 'activity')
means_stds1 <- join(means_stds, activity_labels, by="y")

# Add variable name using join
features <- read.table("UCI\ HAR\ Dataset/features.txt")
names(features) <- c('variable', 'variable_name')
means_stds1$variable <- sub('V','',means_stds1$variable)
means_stds2 <- join(means_stds1, features, by="variable")

# To save to file
to_save <- means_stds2[c("subject", "activity", "variable_name", "mean", "sd")]
names(to_save) <- c("subject", "activity", "variable", "mean", "sd")
write.table(to_save, file="subject_activity_variable_summary.txt", row.name=FALSE)
