install.packages("dplyr")
library(dplyr)

# Loading thr titanic dataset into r
titanic_data <- read.csv("Titanic-Dataset.csv")

# View the first rows of the dataset
head(titanic_data)

# Check the structure of the data
str(titanic_data)

# Data Cleaning and Transformation
# Handling missing values
summary(titanic_data)
colSums(is.na(titanic_data)) ## is.na is the function that looks for missing values
#  Age has 177 missing values

# Cleaning data and replacing NA values with the median of Ages.
titanic_data$Age <- replace(titanic_data$Age ,is.na(titanic_data$Age), median(titanic_data$Age, na.rm = TRUE))

# Removing rows with missing Embarked Values
titanic_data <- titanic_data %>%
  filter(Embarked != "")

# Dropping the Cabin Column
titanic_data <- titanic_data %>% select(-Cabin)

# Converting relevant columns to appropiate datatypes
titanic_data <- titanic_data %>% mutate(Survived = as.factor(Survived), Pclass = as.factor(Pclass), Sex = as.factor(Sex), Embarked = as.factor(Embarked))

# Looking at the Column Names
names(titanic_data)

# Changing the Column Names to Lowercase
names(titanic_data) <- tolower(names(titanic_data))

# Save my cleaned data to a new file
write.csv(titanic_data, "cleaned_titanic_data.csv", row.names = FALSE)
