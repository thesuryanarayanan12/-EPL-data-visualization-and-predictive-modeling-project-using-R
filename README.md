### English Premier League (EPL) Data Visulaization and Predictive Modelling Using R
###  Project Overview

This project involves an end-to-end analysis of English Premier League (EPL) match data using R. The script is designed to perform both **exploratory data analysis (EDA)** and **predictive modeling** based on match-level statistics. The primary goal is to uncover key patterns from past seasons and predict the outcome of future matches.

---

###  Phase 1: Exploratory Data Visualization (EDA)

The EDA section focuses on visualizing various aspects of EPL performance, helping us understand historical patterns and trends. The script processes match data and creates a set of informative visualizations.

#### Key Insights Extracted:

* **Top Goal Scorers:** Identifies players with the most goals in a season.
* **Team Performance Trends:** Compares wins, losses, and draws across home and away games.
* **Goal Distributions:** Displays histograms of goals scored by home and away teams.
* **Points Progression:** Tracks total points accumulated by each team throughout the season.

#### Sample EDA Output:

* `top_scorers_barplot.png`
* `home_vs_away_results_piechart.png`
* `team_points_linechart.png`

> All visualizations are saved to the `outputs/plots/` directory for reporting or dashboard integration.

---

###  Phase 2: Predictive Modeling

A **Random Forest classification model** is built to predict the **match outcome (Home Win / Draw / Away Win)** based on available match data. The model is trained on historical results and tested on a holdout set.

#### Features Used:

* Team statistics (e.g., goals, shots on target, fouls)
* Match conditions (e.g., home/away, referee)
* Player contributions (e.g., assists, cards)

#### Target Variable:

* Match outcome: `H` (Home Win), `D` (Draw), `A` (Away Win)

#### Model Evaluation:

* Confusion Matrix
* Accuracy Score
* Feature Importance Plot

---

###  Sample Results

####  Confusion Matrix:

| Predicted \ Actual | H (Home Win) | D (Draw) | A (Away Win) |
| ------------------ | ------------ | -------- | ------------ |
| H                  | 85           | 10       | 7            |
| D                  | 9            | 32       | 11           |
| A                  | 8            | 14       | 69           |

####  Accuracy:

```
Overall Accuracy: 77.3%
```

####  Top 5 Most Important Features:

```
1. Shots on Target
2. Possession %
3. Number of Corners
4. Fouls Committed
5. Home Team Ranking
```

---

###  Output Files

| File                          | Description                              |
| ----------------------------- | ---------------------------------------- |
| `random_forest_model.rds`     | Saved model for future predictions       |
| `match_predictions.csv`       | Contains test set match predictions      |
| `feature_importance_plot.png` | Visual showing most influential features |
| `top_scorers_barplot.png`     | Visualization of top goal scorers        |
| `team_points_linechart.png`   | Season-wise performance of teams         |

---

###  How to Run

1. Place the cleaned match data (`epl_matches.csv`) in the `/data` folder.
2. Run the main R script:

   ```r
   source("epl_analysis.R")
   ```
3. Outputs will be saved to the `/outputs` directory.

---

###  Technologies Used

* R
* ggplot2
* randomForest
* dplyr
* caret
* readr

