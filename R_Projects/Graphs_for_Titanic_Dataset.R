titanic_data <- read.csv("cleaned_titanic_data.csv")

install.packages("tidyverse") ## Includes ggplot2
library(tidyverse) ## attaches the library to the project
install.packages("plotly")
library(plotly)

install.packages("devtools")
library(devtools)

view(titanic_data)

## Bar plot for Survived
# Shows a bar plot for the survived variable, shows the count of passengers who survived and those who didnt.
ggplotly(
  ggplot(titanic_data, aes(x = as.factor(survived), fill = as.factor(survived))) +
    geom_bar(color = "black") +
    scale_fill_manual(values = c("yellow", "orange")) +
    xlab("Survived") +
    ylab("Count") +
    ggtitle("Count of Survived Passengers on the Titanic") +
    theme(axis.line = element_line(color = "black"))
)

## Barplot for fair price
ggplotly(
  ggplot(titanic_data, aes(x = sex, fill = sex)) +
    geom_bar(color = "black") +  # Add black borders to the bars
    scale_fill_manual(values = c("blue", "pink")) +
    xlab("Sex") +
    ylab("Count") +
    ggtitle("Male to Female Ratio on The Titanic") +
    theme(axis.line = element_line(color = "black"))
)

## Scatter plot Age vs Fair price
ggplotly(
  ggplot(titanic_data, aes(x = age, y = fare)) +
    geom_point(color = "red") +
    geom_smooth(method = "lm", se = FALSE) +  # Add line of best fit
    xlab("Age") +
    ylab("Fare") +
    ggtitle("Age vs Fare Price") +
    theme(axis.line = element_line(color = "black"))
)

## Histogram of Age
ggplotly(
  ggplot(titanic_data, aes(x = age, fill = sex)) +
    geom_histogram(binwidth = 5, color = "black") +
    xlab("Age") +
    ylab("Count") +
    ggtitle("Age Distribution of Passengers by Sex") +
    theme(axis.line = element_line(color = "black")) 
)
         
# Facet grid of Age vs Fare by Passenger Class and Sex

ggplotly(
  ggplot(titanic_data, aes(x = age, y = fare, color = sex)) +
    geom_point() +
    facet_wrap(~ pclass) +
    xlab("Age") +
    ylab("Fare") +
    ggtitle("Age vs. Fare by Passenger Class and Sex") +
    theme(axis.line = element_line(color = "black")) 
  )
  
  str(titanic_data)
view(titanic_data)  

# Boxplot of Age by Survived
ggplotly(ggplot(titanic_data, aes(x = as.factor(survived), y = age)) +
  geom_boxplot(fill = "green") +
  geom_point(data = . %>% filter(age > quantile(age, 0.75) + 1.5*IQR(age) | age < quantile(age, 0.25) - 1.5*IQR(age)), color = "red") +
  xlab("Survived") +
  ylab("Age") +
  ggtitle("Age Distribution by Survival Status")
  )

# Bar Plot of Passenger Class
ggplotly(ggplot(titanic_data, aes(x = as.factor(pclass), fill = as.factor(pclass))) +
  geom_bar(color = "black") +
  scale_fill_manual(values = c("blue", "pink", "yellow")) +
  xlab("Pclass") +
  ylab("Count") +
  ggtitle("Count of Passenger Class") +
  theme(axis.line = element_line(color = "black"))
  )

# Bar Plot of Embarked
ggplotly(
  ggplot(titanic_data, aes(x = embarked, fill = embarked)) +
    geom_bar(color = "black") +
    scale_fill_manual(values = c("blue", "pink", "yellow", "green")) +
    xlab("Embarked Point") +
    ylab("Count") +
    ggtitle("Count of Passengers by Embarkation Point") +
    theme(axis.line = element_line(color = "black"))
  )
