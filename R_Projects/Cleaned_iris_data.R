install.packages("dplyr")
library(dplyr)

# Loading the Iris Dataset (It is already built in R)
data(iris)

# View the First Few rows of the Dataset:
head(iris)

# Check the structure of the Dataset:
str(iris)

# Data Cleaning and Transformation
# Handling missing values
summary(iris)
# Doesn't show any missing values
# This is a better way to check if there are any missing values in the dataset.
colSums(is.na(iris))
# Also shows there no missing values in the datatset

# Going to into intodruce a missing value so can clean it (demonstration purposes)
iris$Sepal.Length[1] <- NA 
iris$Sepal.Length <- ifelse(is.na(iris$Sepal.Length), mean(iris$Sepal.Length, na.rm = TRUE), iris$Sepal.Length)

# Converting the Data Types
# The species column is a factor by default, but lets ensure it:
iris$Species <- as.factor(iris$Species)
# Check the datatypes for all columns are appropiate
str(iris)

# Renaming Columns for Consistency
names(iris) <- tolower(names(iris))
names(iris) <- gsub("\\.", "_", names(iris))

# Removing Duplicates
iris <- iris[!duplicated(iris), ] # Checks for and removes any duplicated rows
dim(iris) # 149 rows and 5 columns

# Transforming Features
# Creating a new feature, such as ratio of petal length to width:
iris <- iris %>%
    mutate(petal_length_width_ratio = petal_length / petal_width)

#Summary of the cleaned and transformed data
# Get Summary Statistics:
summary(iris)
# View the structure of the Transformed data
str(iris)

#Saving the new cleaned data
write.csv(iris, "cleaned_iris_data.csv")
