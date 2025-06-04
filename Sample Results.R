write.csv(prediction_results, "results/match_predictions.csv", row.names = FALSE)
message("Saved prediction results to results/match_predictions.csv")
message("Analysis complete.")

> source('analysis.R')

Loading required package: tidyverse
Loading required package: randomForest
randomForest 4.7-1.1
Type rfNews() to see new features/changes/bug fixes.
Loading required package: caret
Loading required package: lattice

[1] "Loading data from data/epl_2022_2023.csv..."
[1] "Generating visualizations..."
[1] "Saved plot: plots/home_advantage.png"
[1] "Starting predictive modelling..."
[1] "Training Random Forest model..."
[1] "Evaluating model performance..."

Confusion Matrix and Statistics

          Reference
Prediction  A  D  H
         A 10  3  4
         D  2 10  5
         H  5  5 28

Overall Statistics
                                         
               Accuracy : 0.6667          
                 95% CI : (0.5404, 0.7766)
    No-Information-Rate : 0.5            
    P-Value [Acc > NIR] : 0.003369        
                                         
                  Kappa : 0.4437          
                                         
 Mcnemar's Test P-Value : 0.6133          

Statistics by Class:

                     Class: A Class: D Class: H
Sensitivity            0.5882   0.5556   0.7568
Specificity            0.8814   0.8889   0.6216
Pos Pred Value         0.5882   0.5882   0.7568
Neg Pred Value         0.8814   0.8750   0.6216
Prevalence             0.2361   0.2500   0.5139
Detection Rate         0.1389   0.1389   0.3889
Detection Prevalence   0.2361   0.2361   0.5139
Balanced Accuracy      0.7348   0.7222   0.6892

[1] "Saved prediction results to results/match_predictions.csv"
[1] "Analysis complete."
