# --- 1. SETUP ---
# Load required libraries
# install.packages(c("tidyverse", "randomForest", "caret"))
library(tidyverse)
library(randomForest)
library(caret)

# Set a seed for reproducibility
set.seed(42)

# --- 2. LOAD DATA ---
# Load the dataset (assuming a CSV with match data)
# The CSV should contain columns like HomeTeam, AwayTeam, FTHG (Full Time Home Goals), FTAG (Full Time Away Goals), etc.
message("Loading data from data/epl_2022_2023.csv...")
epl_data <- read.csv("data/epl_2022_2023.csv")


# --- 3. EXPLORATORY DATA VISUALIZATION (EDA) ---
message("Generating visualizations...")

# Plot 1: Home Advantage (Total Home Goals vs. Away Goals)
home_advantage_plot <- epl_data %>%
  summarise(HomeGoals = sum(FTHG), AwayGoals = sum(FTAG)) %>%
  pivot_longer(cols = c(HomeGoals, AwayGoals), names_to = "Location", values_to = "Goals") %>%
  ggplot(aes(x = Location, y = Goals, fill = Location)) +
  geom_bar(stat = "identity", show.legend = FALSE) +
  labs(title = "EPL Home vs. Away Goals", x = NULL, y = "Total Goals Scored") +
  theme_minimal() +
  scale_fill_manual(values = c("HomeGoals" = "#0073C2FF", "AwayGoals" = "#EFC000FF"))

# Save the plot
ggsave("plots/home_advantage.png", plot = home_advantage_plot)
message("Saved plot: plots/home_advantage.png")


# --- 4. PREDICTIVE MODELLING ---
message("Starting predictive modelling...")

# Feature Engineering: Create the target variable 'FTR' (Full Time Result)
# H = Home Win, A = Away Win, D = Draw
model_data <- epl_data %>%
  mutate(FTR = case_when(
    FTHG > FTAG ~ "H",
    FTHG < FTAG ~ "A",
    TRUE ~ "D"
  )) %>%
  select(FTR, HomeTeam, AwayTeam, HS, AS, HST, AST, HC, AC) %>% # Select relevant features
  mutate(FTR = as.factor(FTR)) # Convert target to factor

# Split data into training (80%) and testing (20%) sets
train_index <- createDataPartition(model_data$FTR, p = 0.8, list = FALSE)
train_set <- model_data[train_index, ]
test_set <- model_data[-train_index, ]

# Train a Random Forest model
message("Training Random Forest model...")
rf_model <- randomForest(FTR ~ ., data = train_set, ntree = 100)

# Make predictions on the test set
predictions <- predict(rf_model, test_set)

# Evaluate the model
message("Evaluating model performance...")
confusion_matrix <- confusionMatrix(predictions, test_set$FTR)
print(confusion_matrix)

# Save the predictions with actual results
prediction_results <- data.frame(
  HomeTeam = test_set$HomeTeam,
  AwayTeam = test_set$AwayTeam,
  ActualResult = test_set$FTR,
  PredictedResult = predictions
)
